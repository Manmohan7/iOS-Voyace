//
//  RoomViewController.swift
//  Voyace
//
//  Created by Manmohan Singh on 2022-12-02.
//

import UIKit

class RoomViewController: UIViewController {
    
    var hotelInfo: Hotel? = nil
    
    // use these variables to validate the date input
    @IBOutlet weak var fromDate: UIDatePicker!
    @IBOutlet weak var toDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "viewConfirmation") {
            let destination = segue.destination as? ConfirmationViewController
            destination?.bookingInfo = sender as? BookingInfo
        }
    }
    
    // complete this function
    private func calculateLength() -> Int {
        // calculate the length of stay
        return 0
    }
    
    private func calculateTotalFare(room: Room, lengthOfStay: Int) -> String {
        var fare = room.fare
        if let i = fare.firstIndex(of: "$") {
            fare.remove(at: i)
        }
        
        let intFare = Int(fare) ?? 0
        
        let totalFare = intFare * lengthOfStay
        
        return "$\(totalFare)"
    }
    
    @IBAction func viewConfirmationAction(_ sender: AnyObject) {
        let cell = sender.superview?.superview?.superview as! UITableViewCell
        let table = sender.superview?.superview?.superview?.superview as! UITableView
        let indexPath = table.indexPath(for: cell)
        let i = indexPath!.row
        let room: Room = hotelInfo!.rooms[i]
        
        var selectedHotel = hotelInfo!
        selectedHotel.rooms = [room]
        
        let lengthOfStay = calculateLength()
        
        let totalFare = calculateTotalFare(room: room, lengthOfStay: lengthOfStay)
        
        let bookingInfo = BookingInfo(hotel: selectedHotel, checkInDate: "", checkOutDate: "", totalFare: totalFare, lengthOfStay: lengthOfStay)
        
        self.performSegue(withIdentifier: "viewConfirmation", sender: bookingInfo)
    }
}

extension RoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelInfo!.rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCellIdentifier", for: indexPath) as! RoomTableViewCell
        let i = indexPath.row
        let roomInfo = hotelInfo?.rooms[i]
        
        cell.roomName.text = roomInfo!.name
        cell.roomDescription.text = roomInfo!.description
        cell.roomFare.text = roomInfo!.fare
        cell.roomImage.image = UIImage(named: roomInfo!.image)
        
        return cell
    }
}
