//
//  PlaceDetailViewController.swift
//  MARTI
//
//  Created by burak kaya on 01/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import UIKit
import SDWebImage

class PlaceDetailViewController: UIViewController, PlaceDetailViewProtocol {
    
    var presenter: PlaceDetailPresenterProtocol!
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var icon: UIImageView!
    var mirror : Mirror?
    var cellsToShow = [KeyValue]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
    
    func setDetail(_ place: Place) {
        name.text = place.name
        if let photos = place.photos,photos.count > 0,let photo_reference = photos[0].photo_reference{
            let urlString = ProductionServer.photoUrl + "&photoreference=\(photo_reference)"
            let url = URL(string: urlString)
            photo?.sd_setImage(with: url, placeholderImage: UIImage(named: "marti"), options: SDWebImageOptions.highPriority, context: nil)
        }else{
            photo.image = UIImage(named: "marti")
        }
        
        if let iconUrl = place.icon{
            let url = URL(string: iconUrl)
            icon?.sd_setImage(with: url, placeholderImage: UIImage(named: "marti"), options: SDWebImageOptions.highPriority, context: nil)
        }
        
        mirror = Mirror(reflecting: place)
        if let children = mirror?.children{
            for child in children {
                if child.label == "Rating" || child.label == "UserRatingsTotal" || child.label == "PriceLevel"  || child.label == "Adress" || child.label == "Types"{
                    var value = "\(Helper.unwrap(child.value))"
                    if (child.label == "Types"){
                        value = Helper.formatTypes(types: place.Types ?? []) 
                    }
                    if value != "nil"{
                        cellsToShow.append(KeyValue(key: child.label ?? "", value: value))
                    }
                }
            }
        }
        tableView.reloadData()
    }
}

extension PlaceDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("DetailTableViewCell", owner: self, options: nil)?.first as! DetailTableViewCell
        cell.configure(keyValue: cellsToShow[indexPath.row])
        return cell
    }
}
