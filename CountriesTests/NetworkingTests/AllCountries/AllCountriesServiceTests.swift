//
//  AllCountriesRequestTests.swift
//  CountriesAppTests
//
//  Created by Emin on 10.12.2022.
//

import XCTest
@testable import Countries

final class AllCountriesServiceTests: XCTestCase {

    var sut: RequestHandling!
    var expectation: XCTestExpectation!
    
    let apiURL = URL(string: "https://restcountries.com/v3.1/all?")!
    
    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        
        sut = RequestHandler(urlSession: urlSession)
        expectation = expectation(description: "Expectation")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_givenAllCountriesRequest_whenResponseSuccessfull_thenShouldContainRequiredResponseModel() throws {
        // Name of the sample response
        let data = JSONTestHelper().readLocalFile(name: "AllCountriesResponse")
        
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url, url == self.apiURL else {
                throw fatalError("URLS are not matching. Expected: \(self.apiURL), found: \(request.url)")
          }
          
          let response = HTTPURLResponse(url: self.apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
          return (response, data)
        }
        
        sut.request(service: .getAllCountries) {
            (result : Result<AllCountriesResponseModel, APIError>) in
            switch result {
                
            case .success(let response):
                XCTAssertEqual(response.count, 3, "Total number of countries should be 250")
                let firstCountry = response[0]
                XCTAssertEqual(firstCountry.name?.common, "Bulgaria", "First country name is not matching")
                XCTAssertEqual(firstCountry.region, "Europe", "First country region is not matching")
                XCTAssertEqual(firstCountry.startOfWeek, "monday", "Start of the week not matching")
            case .failure(let error):
                XCTFail("Error was not expected: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        
    }

    
    func test_givenAllCountriesRequest_whenResponseFails_thenShouldContainReturnFail() throws {
        
        // For error case we can use empty data
        let data = Data()
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: self.apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        sut.request(service: .getAllCountries) {
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
