//
//  ListViewModelTests.swift
//  CountriesAppTests
//
//  Created by Emin on 5.12.2022.
//

import XCTest
@testable import Countries
final class ListViewModelTests: XCTestCase {
    
    private var mockRequestHandler: MockRequestHandler!
    private var expectation: XCTestExpectation!
    private var sut : ListViewModel!
    
    
    
    override func setUpWithError() throws {

        expectation = expectation(description: "Expectation")
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_givenSuccessfullResponse_whenGetAPIDataCalled_ThenExpectedToSeeUIModel() throws {
        
        let countryList = JSONTestHelper().readAndDecodeFile(decodeType: AllCountriesResponseModel.self, name: "AllCountriesResponse")
        
        mockRequestHandler = MockRequestHandler( { [weak self] in
            self?.expectation.fulfill()
        })
        
        mockRequestHandler.countriesResponse = countryList
        sut = ListViewModel(requestHandler: mockRequestHandler)
        XCTAssertEqual(sut.dataSource.count, 0)
        
        sut.getAPIData()
        
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertEqual(sut.dataSource.count, 3)
        
    }
    
    
    func test_givenFailResponse_whenGetAPIDataCalled_ThenExpectedToSeeEmptyUIModel() throws {
        
        
        mockRequestHandler = MockRequestHandler( { [weak self] in
            self?.expectation.fulfill()
        })
        
        mockRequestHandler.isReturnFail = true
        sut = ListViewModel(requestHandler: mockRequestHandler)
        XCTAssertEqual(sut.dataSource.count, 0)
        
        sut.getAPIData()
        
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertEqual(sut.dataSource.count, 0)
        
    }
    
}


private class MockRequestHandler : RequestHandling {
    
    var countriesResponse: AllCountriesResponseModel?
    var isReturnFail: Bool
    var requestCompletion: (() -> Void)?
    
    init(countriesResponse: AllCountriesResponseModel? = nil,
         isReturnFail:Bool = false,
         _ completion: @escaping (() -> Void)){
        self.countriesResponse = countriesResponse
        self.isReturnFail = isReturnFail
        self.requestCompletion = completion
    }
    
    
    func request<T>(service: Countries.ServiceBase, completion: @escaping (Result<T, Countries.APIError>) -> Void) where T : Decodable {
        
        if isReturnFail {
            completion(.failure(.invalidData))
        }else {
            completion(.success(countriesResponse as! T))
        }

        requestCompletion?()

    }
}
