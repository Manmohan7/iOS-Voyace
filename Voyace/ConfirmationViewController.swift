//
//  ConfirmationViewController.swift
//  Voyace
//
//  Created by Manmohan Singh on 2022-12-03.
//

import UIKit

struct BookingInfo {
    var hotel: Hotel
    var checkInDate: String = ""
    var checkOutDate: String = ""
    var totalFare: String = ""
    var lengthOfStay: Int = 0
}

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelLocation: UILabel!
    @IBOutlet weak var hotelRating: UILabel!
    @IBOutlet weak var checkInDate: UILabel!
    @IBOutlet weak var checkOutDate: UILabel!
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    var bookingInfo: BookingInfo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popUpView.isHidden = true
        
        hotelName.text = bookingInfo!.hotel.name
        hotelLocation.text = bookingInfo!.hotel.location
        hotelRating.text = bookingInfo!.hotel.rating
        checkInDate.text = bookingInfo!.checkInDate
        checkOutDate.text = bookingInfo!.checkOutDate
        roomName.text = bookingInfo!.hotel.rooms[0].name
        totalPrice.text = bookingInfo!.totalFare
    }
    
    
    @IBAction func viewPopUp(_ sender: Any) {
        popUpView.isHidden = false
    }
    
    @IBAction func confirmBooking(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
