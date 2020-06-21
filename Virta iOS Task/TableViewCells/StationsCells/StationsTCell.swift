//
//  StationsTCell.swift
//  Virta iOS Task
//
//  Created by Hassan on 4/24/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import UIKit

class StationsTCell: UITableViewCell {
    

    //MARK:- Outlets
    @IBOutlet var cvPowerSwitches: UICollectionView!
    @IBOutlet var lblDistance: UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var vwBackground: UIView!
    @IBOutlet weak var vwBackgroundHeight: NSLayoutConstraint!
    
    //MARK:- Load
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
