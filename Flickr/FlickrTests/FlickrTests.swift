//
//  FlickrTests.swift
//  FlickrTests
//
//  Created by AkhileshSingh on 14/07/21.
//

import XCTest
@testable import Flickr

class FlickrTests: XCTestCase {

    let assembler = Assembler()
    var viewModel: PhotosViewModel?
    var photos: [Photo]?
    var service: APIServiceProtocol?

    override func setUp() {
        super.setUp()
        viewModel = assembler.viewModel()
        service = assembler.apiService()
    }

    func testCheckIfDataReceivedFromServer() {
        var isSuccess = false
        let expect = expectation(description: "check network call")
        viewModel?.getPhotos { (result) in
            switch result {
            case .success(_):
                isSuccess = true
            case .failure(_):
                isSuccess = false
            }
            XCTAssert(isSuccess == true, "server data received")
            expect.fulfill()
        }
        waitForExpectations(timeout: 5) { error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
    }

    func testGetPhotos() {
        let expect = expectation(description: "get data from api")
        service?.getPhotos { [weak self](result) in
            switch result {
            case .success(let model):
                self?.photos = model?.photos?.photo ?? []
            case .failure(_):
                break
            }
            XCTAssert((self?.photos!.count)! > 0, "photos received")
            expect.fulfill()
        }

        waitForExpectations(timeout: 5) { error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
    }

    func testNumberOfRows() {
        testGetPhotos()
        XCTAssertEqual(self.photos!.count, 20)
    }
    
}
