//
//  Networking.swift
//  Flickr
//
//  Created by AkhileshSingh on 15/07/21.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
}

typealias Parameter = [String: Any]

protocol Requestable {
    var path: Path { get }
    var method: RequestMethod { get }
}

protocol URLQueryRequest: Requestable { }

extension URLQueryRequest {
    
    var method: RequestMethod {
        return .get
    }
}

protocol Networking {
    func request(_ request: Requestable, completion: ((Result<Data, Error>) -> Void)?)
}

struct HTTPNetworking: Networking {
    
    func request(_ request: Requestable, completion: ((Result<Data, Error>) -> Void)?) {
        guard let url = request.path.url else { return }
        var dataRequest = URLRequest(url: url)
        dataRequest.httpMethod = request.method.rawValue
        
        URLSession.shared.dataTask(with: dataRequest) { (data, _, error) in
            DispatchQueue.main.async {
                if let data = data {
                    completion?(.success(data))
                } else {
                    if let error = error {
                        completion?(.failure(error))
                    }
                }
            }
        }.resume()
    }
}

struct Responder<T: Decodable> {
    typealias ResponseHandeler<T: Decodable> = ((Result<T?, Error>) -> Void)
    let completion: ResponseHandeler<T>
    init(completion: @escaping ResponseHandeler<T>) {
        self.completion = completion
    }
}
