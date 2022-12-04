//
//  ConfirmationViewController.swift
//  Voyace
//
//  Created by Manmohan Singh on 2022-12-03.
//

import UIKit

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popUpView.isHidden = true
    }
    
    
    @IBAction func viewPopUp(_ sender: Any) {
        popUpView.isHidden = false
    }
    
    @IBAction func confirmBooking(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
