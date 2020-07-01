////
////  MARTITests.swift
////  MARTITests
////
////  Created by burak kaya on 01/07/2020.
////  Copyright © 2020 burak kaya. All rights reserved.
////
//
//import XCTest
//@testable import MARTI
//import Alamofire
//
//class MARTITests: XCTestCase {
//    
//    private var presenter: PlaceListPresenter!
//    private var interactor: PlaceListInteractor!
//    private var service: MockSearchPlaceService!
//    private var view: MockPlaceListView!
//    private var router: MockPlaceListRouter!
//    
//    override func setUp() {
//        service = MockSearchPlaceService()
//        interactor = PlaceListInteractor(service: service)
//        view = MockPlaceListView()
//        router = MockPlaceListRouter()
//        presenter = PlaceListPresenter(view: view,
//                                       interactor: interactor,
//                                       router: router)
//        
//        view.presenter = presenter
//    }
//    
//    func testSearchPlace() throws {
//        // Given:
//        let place1 = try ResourceLoader.loadPlace(resource: .place1)
//        let place2 = try ResourceLoader.loadPlace(resource: .place2)
//        service.search.results = [place1, place2]
//
//        // When:
//        view.viewDidLoad()
//
//        // Then:
//        XCTAssertEqual(view.outputs.count, 4)
//
//        let output = try view.outputs[0]
//        switch output {
//        case .updateTitle:
//        break // Success
//        default:
//            XCTFail()
//        }
//
//        XCTAssertEqual(try view.outputs[1], .setLoading(true))
//        XCTAssertEqual(try view.outputs[2], .setLoading(false))
//        let expectedMovies = service.search.map(SearchPresentation.init)
//        XCTAssertEqual(try view.outputs[3], .showPlaceList(expectedMovies))
//    }
//    
//    func testSelectPlace() throws {
//        // Given:
//        let place1 = try ResourceLoader.loadPlace(resource: .place1)
//        let place2 = try ResourceLoader.loadPlace(resource: .place2)
//        service.movies = [movie1, movie2]
//        view.viewDidLoad()
//        
//        // When:
//        view.selectMovie(at: 0)
//        
//        // Then:
//        let expectedMovie = try service.movies.element(at: 0)
//        XCTAssertEqual(try router.routes.element(at: 0), .detail(expectedMovie))
//    }
//}
//
//private final class MockPlaceListView: PlaceListViewProtocol {
//    
//    var presenter: PlaceListPresenter!
//    var outputs: [PlaceListPresenterOutput] = []
//    
//    func viewDidLoad() {
//        presenter.searchPlace(searchText: "burger")
//    }
//    
//    func selectMovie(at index: Int) {
//        presenter.selectPlace(at: index)
//    }
//    
//    func handleOutput(_ output: PlaceListPresenterOutput) {
//        outputs.append(output)
//    }
//}
//
//private final class MockPlaceListRouter: PlaceListRouterProtocol {
//    
//    var routes: [PlaceListRoute] = []
//    
//    func navigate(to route: PlaceListRoute) {
//        routes.append(route)
//    }
//    
//}
//
//final class MockSearchPlaceService: APIClientProtocol {
//    var search : Search!
//
//    func getPlaceList(searchText: String, completion: @escaping (Result<Search, AFError>?) -> Void) {
//        completion(SearchPlaceResponse(results: search))
//    }
//}
