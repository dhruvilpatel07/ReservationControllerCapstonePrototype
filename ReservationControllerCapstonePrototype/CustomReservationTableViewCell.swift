//
//  CustomReservationTableViewCell.swift
//  ReservationControllerCapstonePrototype
//
//  Created by Dhruvil Patel on 2020-04-10.
//  Copyright © 2020 Dhruvil Patel. All rights reserved.
//

import UIKit

class CustomReservationTableViewCell: UITableViewCell {
    @IBOutlet weak var lblNumberOfPeople: UILabel!
    @IBOutlet weak var lblPpl: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var btnSeated: UIButton!
    @IBOutlet weak var btnModify: UIButton!
    @IBOutlet weak var btnDelay: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
