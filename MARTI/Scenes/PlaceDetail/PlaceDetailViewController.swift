//
//  PlaceDetailViewController.swift
//  MARTI
//
//  Created by burak kaya on 01/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import UIKit

class PlaceDetailViewController: UIViewController, PlaceDetailViewProtocol {

    var presenter: PlaceDetailPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
    
    func update(_ place: Place) {
        print(place.name)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
