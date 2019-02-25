//
//  MealTableViewCell.swift
//  Food Tacker
//
//  Created by Jessica Lowry on 2/25/19.
//  Copyright © 2019 Jessica Lowry. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell
{
 
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
}
