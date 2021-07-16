//
//  Parser.swift
//  Flickr
//
//  Created by AkhileshSingh on 15/07/21.
//

import Foundation

protocol Parser {
    func parse<T: Decodable>(data: Data?, to: T.Type) -> T?
}

struct DataParser: Parser {
    
    func parse<T: Decodable>(data: Data?, to: T.Type) -> T? {
        guard let data = data else { return nil}
        let jsonDecoder = JSONDecoder()
        guard let decodedData = try? jsonDecoder.decode(T.self, from: data) else { return nil }
        return decodedData
    }
    
}
