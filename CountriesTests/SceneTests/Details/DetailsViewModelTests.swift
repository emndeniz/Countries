//
//  DetailsViewModelTests.swift
//  CountriesAppTests
//
//  Created by Emin on 10.12.2022.
//

import XCTest
@testable import Countries

final class DetailsViewModelTests: XCTestCase {
    
    
    private var mockRequestHandler: MockRequestHandler!
    private var expectation: XCTestExpectation!
    private var sut : DetailViewModel!
    
    private let countryName = "france"
    
    override func setUpWithError() throws {
        
        expectation = expectation(description: "Expectation")
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test_givenSuccessfullResponse_whenGetAPIDataCalled_ThenExpectedToSeeUIModel() throws {
        
        let countryList = JSONTestHelper().readAndDecodeFile(decodeType: CountryResponseModel.self, name: "DetailSuccessResponse")
        
        mockRequestHandler = MockRequestHandler( { [weak self] in
            self?.expectation.fulfill()
        })
        
        mockRequestHandler.countriesResponse = countryList
        sut = DetailViewModel(countryName: countryName,requestHandler: mockRequestHandler)
        XCTAssertTrue(sut.dataSource.isEmpty)
        
        sut.getAPIData()
        
        
        
        XCTAssertFalse(sut.dataSource.isEmpty)
        let first = sut.dataSource.first!
        XCTAssertEqual(first.commonName, "France")
        XCTAssertEqual(first.officialName, "Official Name: French Republic")
        XCTAssertEqual(first.capital, "Capital: Paris")
        XCTAssertEqual(first.region, "Region: Europe")
        XCTAssertEqual(first.area, "Area: 551,695")
        XCTAssertEqual(first.population, "Population: 67,391,582")
        XCTAssertEqual(first.location.center.latitude,  48.87)
        XCTAssertEqual(first.location.center.longitude,  2.33)
        
        wait(for: [expectation], timeout: 1.0)
        
    }
    
    
    func test_givenFailResponse_whenGetAPIDataCalled_ThenExpectedToSeeEmptyUIModel() throws {
        
        mockRequestHandler = MockRequestHandler( { [weak self] in
            self?.expectation.fulfill()
        })
        
        mockRequestHandler.isReturnFail = true
        sut = DetailViewModel(countryName: countryName,requestHandler: mockRequestHandler)
        XCTAssertTrue(sut.dataSource.isEmpty)
        
        sut.getAPIData()
        
        XCTAssertEqual(sut.dataSource.count, 0)
        
        wait(for: [expectation], timeout: 1.0)
        
    }
    
    
    
}



private class MockRequestHandler : RequestHandling {
    
    var countriesResponse: CountryResponseModel?
    var isReturnFail: Bool
    var requestCompletion: (() -> Void)?
    
    init(countriesResponse: CountryResponseModel? = nil,
         isReturnFail:Bool = false,
         _ completion: @escaping (() -> Void)){
        self.countriesResponse = countriesResponse
        self.isReturnFail = isReturnFail
        self.requestCompletion = completion
    }
    
    
    func request<T>(service: APIRoute, completion: @escaping (Result<T, Countries.APIError>) -> Void) where T : Decodable {
        
        if isReturnFail {
            completion(.failure(.invalidData))
        }else {
            completion(.success(countriesResponse as! T))
        }
        
        requestCompletion?()
        
    }
}

