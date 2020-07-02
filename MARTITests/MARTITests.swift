//
//  MARTITests.swift
//  MARTITests
//
//  Created by burak kaya on 02/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import XCTest
@testable import MARTI
import PromiseKit

class MARTITests: XCTestCase {
    
    private var presenter: PlaceListPresenter!
    private var interactor: PlaceListInteractor!
    private var service: MockSearchPlaceService!
    private var view: MockPlaceListView!
    private var router: MockPlaceListRouter!
    
    override func setUp() {
        service = MockSearchPlaceService()
        interactor = PlaceListInteractor(service: service)
        view = MockPlaceListView()
        router = MockPlaceListRouter()
        presenter = PlaceListPresenter(view: view,
                                       interactor: interactor,
                                       router: router)
        
        view.presenter = presenter
    }
    let serialQueue = DispatchQueue(label: "swiftlee.serial.queue")

    func testSearchPlace() throws {
        // Given:
        let search = try ResourceLoader.loadSearch()
        service.search = search
        
        serialQueue.async {
            // When:
            self.view.searchPlace()
            
            //  Then:
            if self.view.outputs.count == 3 {
                let output = self.view.outputs[0]
                switch output {
                case .setLoading(true):
                break // Success
                default:
                    XCTFail()
                }
                
                let output1 = self.view.outputs[1]
                switch output1 {
                case .setLoading(false):
                break // Success
                default:
                    XCTFail()
                }
                
                let expectedSearch = self.service.search
                let output2 = self.view.outputs[2]
                switch output2 {
                case .showPlaceList(expectedSearch):
                break // Success
                default:
                    XCTFail()
                }
            }else{
                XCTFail()
            }
        }
    }
    
    func testSelectPlace() throws {
        // Given:
        let search = try ResourceLoader.loadSearch()
        service.search = search
        serialQueue.async {
            
            // When:
            self.view.searchPlace()
            self.view.selectPlace(at: 0)
            
            // Then:
            let expectedSearch = self.service.search
            
            if self.router.routes.count > 0{
                let output = self.router.routes[0]
                switch output {
                case .showOnMap(expectedSearch?.results![0]):
                break // Success
                default:
                    XCTFail()
                }
            }else{
                XCTFail()
            }
        }
    }
}

private final class MockPlaceListView: PlaceListViewProtocol {
    
    var presenter: PlaceListPresenter!
    var outputs: [PlaceListPresenterOutput] = []
    
    func searchPlace(){
        presenter.searchPlace(searchText: "ayasofya")
    }
    
    func selectPlace(at index: Int) {
        presenter.selectPlace(at: index)
    }
    
    func handleOutput(_ output: PlaceListPresenterOutput) {
        outputs.append(output)
    }
}

private final class MockPlaceListRouter: PlaceListRouterProtocol {
    
    var routes: [PlaceListRoute] = []
    
    func navigate(to route: PlaceListRoute) {
        routes.append(route)
    }
}

final class MockSearchPlaceService: APIClientProtocol {
    var search : Search?
    func getPlaceList(searchText: String) -> Promise<Search> {
        return Promise.init { (resolver) in
            if let search = search{
                resolver.fulfill(search)
            }else{
                resolver.reject(DummyError.init(title: "error"))
            }
        }
    }
}


struct DummyError: Error {

    var title: String?

    init(title: String?) {
        self.title = title ?? "Error"
    }
}
