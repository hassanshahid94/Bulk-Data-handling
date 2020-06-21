//
//  StationDetailTCell.swift
//  Virta iOS Task
//
//  Created by Hassan on 4/24/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import UIKit

class StationDetailTCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet var lblIds: UILabel!
    @IBOutlet var vwBackground: UIView!
    
    //MARK:- Load
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vwBackground.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
