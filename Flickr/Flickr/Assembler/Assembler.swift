//
//  Assembler.swift
//  ElectroluxDemo
//
//  Created by AkhileshSingh on 15/07/21.
//

import UIKit

class Assembler: NSObject {
    func viewModel() -> PhotosViewModel {
        return PhotosViewModel(service: apiService())
    }
    
    func apiService() -> APIServiceProtocol {
        return APIService(fetcher: fetcher())
    }
    
    func fetcher() -> Fetcher {
        return DataFetcher(networking: networking(), parser: parser())
    }
    
    func networking() -> Networking {
        return HTTPNetworking()
    }
    
    func parser() -> Parser {
        return DataParser()
    }
}
