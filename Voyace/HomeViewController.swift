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

class HomeViewController: UIViewController, UISearchBarDelegate {
    
    let hotels = DBHelper().hotels
    var filteredHotels: [Hotel]!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredHotels = hotels
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "viewHotel") {
            let destination = segue.destination as? HotelViewController
            destination?.hotelInfo = sender as? Hotel
            
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredHotels = searchText.isEmpty
            ? hotels
            : hotels.filter { $0.name.contains(searchText) } as [Hotel]
        
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredHotels.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table_cell", for: indexPath) as! TableViewCell
        
        let i = indexPath.row

        let hotel = filteredHotels[i]
        cell.hotelName.text = hotel.name
        cell.hotelDescription.text = hotel.description
        cell.hotelImage.image = UIImage(named: hotel.images[0])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "viewHotel", sender: hotels[indexPath.row])
    }
}
