//
//  StationDetailVC.swift
//  Virta iOS Task
//
//  Created by Hassan on 4/24/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import UIKit
import LoadingPlaceholderView

class StationDetailVC: BaseVC {

    //MARK:- Variables
    var stationId = Int()
    var stationDetail: VirtaStationDetailListResponse!
    var distance = ""
    private var loadingPlaceholderView = LoadingPlaceholderView()
    
    private var cellsIdentifiers = [
           "StationDetailTCell",
           "StationDetailTCell",
           "StationDetailTCell",
           "StationDetailTCell"
       ]
    
    //MARK:- Outlets
    @IBOutlet var lblDistance: UILabel!
    @IBOutlet var lblStationAddress: UILabel!
    @IBOutlet var lblStationName: UILabel!
    @IBOutlet var tblStationDetail: UITableView!{
        didSet {
            tblStationDetail.coverableCellsIdentifiers = cellsIdentifiers
        }
    }
    
    //MARK:- Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stationDetail = VirtaStationDetailListResponse(fromDictionary: [:])
        
        setupLoadingPlaceholderView()
        performFakeNetworkRequest()
        
        ServerManager.stationDetail(token: Globals.tokens.accessToken!, stationId: stationId) { (status, data) in
            
            self.finishFakeRequest()
            if status == "success"
            {
                self.stationDetail = data
                self.lblStationName.text = self.stationDetail.name ?? ""
                self.lblStationAddress.text = "\(self.stationDetail.address ?? ""), \(self.stationDetail.city ?? "")"
                self.lblDistance.text = self.distance
                self.tblStationDetail.reloadData()
            }
            else
            {
                self.showAlertMessage(message: status)
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func btnBackAction(_ sender: UIButton) {
        
        self.navigationController?.fadeOut(self)
        
    }
    
    //MARK:- Functions
    private func performFakeNetworkRequest() {
        loadingPlaceholderView.cover(view)
    }

    private func finishFakeRequest() {
        //self.tblNewsFeed.reloadData()
        self.loadingPlaceholderView.uncover()
    }

    private func setupLoadingPlaceholderView() {
        
        loadingPlaceholderView.gradientColor = .white
        loadingPlaceholderView.backgroundColor = .white
    }
}

//MARK:- UITableView Delegate and DataSource
extension StationDetailVC: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
         return stationDetail.evses == nil ? 0 : stationDetail.evses.count
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
            let stationInfoAndHelpTCell = tableView.dequeueReusableCell(withIdentifier: "StationInfoAndHelpTCell") as! StationInfoAndHelpTCell
            return stationInfoAndHelpTCell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == stationDetail.evses.count - 1 {
            return 200
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stationDetail.evses.count == 0 ? 0 : stationDetail.evses[section].connectors.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return stationDetail.evses.count == 0 ? "" : "\(stationDetail.evses[section].id ?? 0)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let stationDetailTCell = tableView.dequeueReusableCell(withIdentifier: "StationDetailTCell", for: indexPath) as! StationDetailTCell
        
        stationDetailTCell.lblIds.text = "\(stationDetail.evses[indexPath.section].connectors[indexPath.row].maxKwh ?? 0) kw"
            return stationDetailTCell
        
    }
}

