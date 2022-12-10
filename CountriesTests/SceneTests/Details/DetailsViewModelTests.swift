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
        
        XCTFail("Test is incomplete!")
        
    }
    
    
    func test_givenFailResponse_whenGetAPIDataCalled_ThenExpectedToSeeEmptyUIModel() throws {
        

        XCTFail("Test is incomplete!")
        
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

