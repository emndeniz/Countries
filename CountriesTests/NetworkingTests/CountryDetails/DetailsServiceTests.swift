//
//  DetailsServiceTests.swift
//  CountriesAppTests
//
//  Created by Emin on 10.12.2022.
//

import XCTest
@testable import Countries


final class DetailsServiceTests: XCTestCase {

    var sut: RequestHandling!
    var expectation: XCTestExpectation!
    
    let apiURL = URL(string: "https://restcountries.com/v3.1/name/france?")!
    let countryName = "france"
    
    override func setUpWithError() throws {
        // Configuration required to Mock API requests.
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        
        sut = RequestHandler(urlSession: urlSession)
        // Expectation required to wait background operations.
        expectation = expectation(description: "Expectation")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    /// In this case we are inserting success data via mock and expect decoded response.
    func test_givenDetailsRequest_whenResponseSuccessfull_thenShouldContainRequiredResponseModel() throws {
        // Name of the sample response
        let data = JSONTestHelper().readLocalFile(name: "DetailSuccessResponse")
        
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url, url == self.apiURL else {
                throw fatalError("URLS are not matching. Expected: \(self.apiURL), Found: \(request.url)")
          }
          
          let response = HTTPURLResponse(url: self.apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
          return (response, data)
        }
        
        // Start test by calling the actual function
        sut.request(service: .querryCountryByName(name: countryName)) {
            (result : Result<CountryResponseModel, APIError>) in
            
            switch result {
                
            case .success(let response):
                XCTAssertEqual(response.first?.name?.common, "France", "Common names are not matching")
                XCTAssertEqual(response.first?.name?.official, "French Republic", "Official names are not matching")
            case .failure(let error):
                XCTFail("Error was not expected: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    
    /// In this case we are inserting fail case via mock and expect fail return.
    func test_givenDetailsRequest_whenResponseFailed_thenShouldReturnFail() throws {
        // For error case we can use empty data
        let data = Data()
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: self.apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        sut.request(service: .querryCountryByName(name: countryName)) {
            (result : Result<AllCountriesResponseModel, APIError>) in
            switch result {
                
            case .success(_):
                XCTFail("Success was not expected")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, APIError.jsonConversionFailure.localizedDescription)
            }
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }

   
    
    
}
