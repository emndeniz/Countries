//
//  ServiceProvider.swift
//  Countries
//
//  Created by Emin on 15.09.2022.
//
import Foundation

protocol RequestHandling {
    func request<T>(service: APIRoute, completion: @escaping (Result<T, APIError>) -> Void) where T:Decodable
}


/// Service Provider manages URLSession process
class RequestHandler: RequestHandling {
    var urlSession:URLSession
    
    init(urlSession: URLSession = .shared ) {
        self.urlSession = urlSession
    }
    
    
    /// Starts resuest flow given service with required parameters and returns result in completion block.
    /// - Parameters:
    ///   - service: Service Type
    ///   - decodeType: Decoder Type to return response
    ///   - completion: Completion with Service Result
    func request<T>(service: APIRoute, completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
    //func request<U>(service:T, decodeType: U.Type, completion: @escaping ((ServiceResult<U>) -> Void)) where U: Decodable {
        guard let request = service.asRequest() else {
            completion(.failure(.invalidRequest))
            return
        }
        execute(request) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let response =  try decoder.decode(T.self, from: data)
                    print("Successfull response received, response:\(response)")
                    completion(.success(response))
                }
                catch let error{
                    print("Failed to decode received data :\(error)")
                    completion(.failure(.jsonConversionFailure))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
    /// Executes given request.
    /// - Parameters:
    ///   - request: URLRequest
    ///   - deliveryQueue: DispatchQueue of the request, default is main.
    ///   - completion: Completion block.
    private func execute(_ request:URLRequest,
                             deliveryQueue:DispatchQueue = DispatchQueue.main,
                             completion: @escaping ((ServiceResult<Data>) -> Void)){
        
        urlSession.dataTask(with: request) { data, response , error in
            
            if let error = error {
                deliveryQueue.async{
                    print("Error recevied on request, error:\(error)")
                    completion(.failure(.responseUnsuccessful(error)))
                }
            }else if let data = data {
                deliveryQueue.async{
                    completion(.success(data))
                }
            }else {
                deliveryQueue.async{
                    print("Invalid data received, response:\(response)")
                    completion(.failure(.invalidData))
                }
            }
        }.resume()
    }
    
}

/// Service Results Enum will return easy to undestand API responses to upper layers.
enum ServiceResult<T> {
    case success(T)
    case failure(APIError)
}

/// Customized APIErrors for the app
enum APIError: Error {
    case jsonConversionFailure
    case invalidData
    case invalidRequest
    case responseUnsuccessful(Error)
    var localizedDescription: String {
        switch self {
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .invalidRequest: return "Invalid Request Type"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        }
    }
}



