//
//  SearchTableViewCell.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import UIKit
import SDWebImage

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(place : Place){
        name.text = place.name
        if let ratingTxt = place.Rating{
            rating.text = "\(ratingTxt)"
        }

        if let iconUrl = place.icon{
            let url = URL(string: iconUrl)
            icon?.sd_setImage(with: url, placeholderImage: UIImage(named: "marti"), options: SDWebImageOptions.highPriority, context: nil)
        }
    }
}
