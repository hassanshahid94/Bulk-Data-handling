//
//  StationsVC.swift
//  Virta iOS Task
//
//  Created by Hassan on 4/24/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import UIKit
import CoreLocation
import LoadingPlaceholderView

class StationsVC: BaseVC {

    // MARK: - Variables
    var isStationAvailable = true
    var locationManager = CLLocationManager()
    var currentLat = 0.0
    var currentLong = 0.0
    var maxLat = 0.0
    var maxlong = 0.0
    var minLat = 0.0
    var minLong = 0.0
    var arrEvses = [VirtaEvse]()
    
    var refreshControl = UIRefreshControl()
   private var loadingPlaceholderView = LoadingPlaceholderView()
    
    private var cellsIdentifiers = [
        "StationsTCell",
        "StationsTCell",
        "StationsTCell",
        "StationsTCell",
        "StationsTCell",
        "StationsTCell"
    ]
    
    //MARK:- Outlets
    @IBOutlet var lblNearby: UILabel!
    @IBOutlet var tblStations: UITableView!{
        didSet {
            tblStations.coverableCellsIdentifiers = cellsIdentifiers
        }
    }
    
    //MARK:- Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoadingPlaceholderView()
        performFakeNetworkRequest()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tblStations.addSubview(refreshControl)

    }
    
    //MARK:- Actions
    @IBAction func btnLogoutAction(_ sender: UIButton) {
        
        self.showGlobalProgressHUDWithTitle("Please wait...")
        ServerManager.logout(token: Globals.tokens.accessToken!) { (status) in
            self.dismissGlobalHUD()
            if status == "success"
            {
                UserDefaults.standard.removeObject(forKey: CacheValue.AuthToken)
                UserDefaults.standard.removeObject(forKey: CacheValue.StationsList)
                self.navigationController?.popToRootViewController(animated: true)
                
            }
            else
            {
                self.showAlertMessage(message: status)
            }
        }
    }
    // MARK: - Functions
     @objc func refresh(_ sender: Any) {
        locationManager.startUpdatingLocation()
       }

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
    

    func deg2rad(degrees:Double) -> Double{
        return degrees * Double.pi / 180
    }
    
    func calculateDistance(mobileLocationX:Double,mobileLocationY:Double,DestinationX:Double,DestinationY:Double) -> Double {

        let coordinate₀ = CLLocation(latitude: mobileLocationX, longitude: mobileLocationY)
        let coordinate₁ = CLLocation(latitude: DestinationX, longitude:  DestinationY)

        let distanceInMeters = coordinate₀.distance(from: coordinate₁)

        return distanceInMeters
    }

    func getStationsList()
    {
        ServerManager.getListOfStations(token: Globals.tokens.accessToken!, latMin: minLat, longMin: minLong, latMax: maxLat, longMax: maxlong, limit: 10) { (status) in
            self.refreshControl.endRefreshing()
            if status == "success"
            {
                if Globals.arrStationsList.count == 0
                {
                    self.isStationAvailable = false
                }
                else
                {
                    self.isStationAvailable = true
                }
                for (index, station) in Globals.arrStationsList.enumerated() {

                  print("Item \(index): \(station)")
                    
                    let distance = self.calculateDistance(mobileLocationX: self.currentLat, mobileLocationY: self.currentLong, DestinationX: station.latitude, DestinationY: station.longitude)
                    
                    var dis = Int (distance)
                    Globals.arrStationsList[index].distance = dis
                    if dis >= 1000
                    {
                        dis = (dis / 1000)
                        Globals.arrStationsList[index].distanceString = "\(dis) km"
                    }
                    else
                    {
                        Globals.arrStationsList[index].distanceString = "\(dis) m"
                    }
               }
                self.finishFakeRequest()
                Globals.arrStationsList = Globals.arrStationsList.sorted{ $0.distance < $1.distance }
                self.tblStations.reloadData()
              
            }
            else
            {
                self.isStationAvailable = false
                self.tblStations.reloadData()
                self.finishFakeRequest()
                self.showAlertMessage(message: status)
            }
        }
    }

}

//MARK:- UITablView DataSource
extension StationsVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isStationAvailable
        {
            return Globals.arrStationsList == nil ? 0 : Globals.arrStationsList.count
        }
        else
        {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isStationAvailable
        {
           let stationsTCell = tableView.dequeueReusableCell(withIdentifier: "StationsTCell", for: indexPath) as! StationsTCell
                      
                      stationsTCell.lblName.text = "\(Globals.arrStationsList[indexPath.row].name ?? "")"
                      arrEvses = Globals.arrStationsList[indexPath.row].evses!
                      print(stationsTCell.cvPowerSwitches.contentSize.height)
                      stationsTCell.lblAddress.text = "\(Globals.arrStationsList[indexPath.row].address ?? ""),\(Globals.arrStationsList[indexPath.row].city ?? "")"
                      
                      stationsTCell.lblDistance.text = Globals.arrStationsList[indexPath.row].distanceString ?? ""
            
            stationsTCell.cvPowerSwitches.reloadData()
            if stationsTCell.cvPowerSwitches.contentSize.height == 0.0 {
                stationsTCell.vwBackgroundHeight.constant = 120
            }
            else {
                stationsTCell.vwBackgroundHeight.constant = stationsTCell.cvPowerSwitches.contentSize.height + 70
            }
            return stationsTCell
        }
        else
        {
            let stationsNotAvailableTCell = tableView.dequeueReusableCell(withIdentifier: "StationsNotAvailableTCell", for: indexPath) as! StationsNotAvailableTCell
            return stationsNotAvailableTCell
        }
        
    }
}

//MARK:- UITablView Delegate
extension StationsVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let stationDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "StationDetailVC") as! StationDetailVC
        
        stationDetailVC.stationId = Globals.arrStationsList[indexPath.row].id!
        stationDetailVC.distance = Globals.arrStationsList[indexPath.row].distanceString ?? ""
        self.navigationController?.fadeTo(stationDetailVC)
        
    }
}

//MARK:- UITablView DataSource, Delegates and Flowlayout
extension StationsVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrEvses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let powerSwitchesCCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PowerSwitchesCCell", for: indexPath) as! PowerSwitchesCCell
        
        powerSwitchesCCell.lblNumberofSwitches.text = "x\(arrEvses[indexPath.row].connectors.count)"
        
        powerSwitchesCCell.lblPower.text = "\(arrEvses[indexPath.row].connectors.first?.maxKw ?? 0)"
        return powerSwitchesCCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let yourWidth = 70
            let yourHeight = 50
            return CGSize(width: yourWidth, height: yourHeight)

        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets.zero

        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

            return 0

        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
}

//MARK:- CurrentLocation Delegate
extension StationsVC: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
         
        currentLat = Double(locValue.latitude)
        currentLong = Double(locValue.longitude)
        
        let searchDistance:Double =  5.00 //float value in KM

        minLat = currentLat - (searchDistance / 69)
        maxLat = currentLat + (searchDistance / 69)

        minLong = currentLong - searchDistance / fabs(cos(deg2rad(degrees: currentLat))*69)
        maxlong = currentLong + searchDistance / fabs(cos(deg2rad(degrees: currentLat))*69)
        
        locationManager.stopUpdatingLocation()
        getStationsList()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    
        locationManager.stopUpdatingLocation()
        let alert = UIAlertController(title: "Virta", message: "Allow location from settings", preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                self.getStationsList()
                UIApplication.shared.openURL(NSURL(string: UIApplication.openSettingsURLString)! as URL)
                
            case .cancel: print("cancel")
            case .destructive: print("destructive")
            }
        }))
    }
   
}


