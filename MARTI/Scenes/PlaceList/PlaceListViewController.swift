//
//  PlaceListViewController.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import UIKit

class PlaceListViewController: UIViewController, PlaceListViewProtocol {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter : PlaceListPresenterProtocol!
    private var places: [Place] = []

    var searchText = ""{
        didSet{
            presenter.searchPlace(searchText: searchText)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        presenter.load()
    }
    
    func handleOutput(_ output: PlaceListPresenterOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            print(isLoading)
//            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showPlaceList(let search):
            if let results = search.results{
                places = results
                print(search)
            }else{
                places = []
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension PlaceListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SearchTableViewCell", owner: self, options: nil)?.first as! SearchTableViewCell
        
        cell.configure(place: places[indexPath.row])
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter.selectPlace(at: indexPath.row)
    }
}

extension PlaceListViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
