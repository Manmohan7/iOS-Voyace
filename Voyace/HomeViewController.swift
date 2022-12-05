//
//  HomeViewController.swift
//  Voyace
//
//  Created by Manmohan Singh on 2022-12-02.
//

import UIKit

/**
  Attempt 1

  functions required are - getHotels, getHotel

  from Home Screen pass the selected hotel name
  on HotelPage fetch the Hotel from name

  from Hotel Screen pass thr list of Room to Room page

  from Room page pass the name
 */

/**
 Attempt 2
 
 functions required - getHotels
 on the Home Controller show the list of Hotels
 
 on selection pass the whole Hotel struct to Hotel Controller
 
 on click of "view rooms" pass the whole Hotel struct to Room Controller
 
 on Room Controller show the list of Rooms
 
 on click of "reserve" pass the whole Hotel struct along with check in/out dates
 
 on Confirmation Controller show the complete details
 */

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let hotels = DBHelper().hotels
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hotels.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table_cell", for: indexPath) as! TableViewCell
        
        let i = indexPath.row

        cell.hotelName.text = hotels[i].name
        cell.hotelDescription.text = hotels[i].description

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "viewHotel", sender: hotels[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "viewHotel") {
            let destination = segue.destination as? HotelViewController
            destination?.hotelinfo = sender as? Hotel
            
        }
    }

}
