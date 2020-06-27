//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage
import SkeletonView

class RestaurantCell: UITableViewCell {

    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starsImage: UIImageView!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    // ––––– Lab 2 TODO: Add Movie Variable + didset
    var r: Restaurant! {
           didSet {

            nameLabel.text = r.name
            categoryLabel.text = r.mainCategory
            phoneLabel.text = r.phone
            reviewsLabel.text = String(r.reviews) + " reviews"
            
            // set images
            starsImage.image = Stars.dict[r.rating]!
            restaurantImage.af.setImage(withURL: r.imageURL!)
            restaurantImage.layer.cornerRadius = 10
            restaurantImage.clipsToBounds = true
            
           }
       }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
