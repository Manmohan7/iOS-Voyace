//
//  RoomViewController.swift
//  Voyace
//
//  Created by Manmohan Singh on 2022-12-02.
//

import UIKit

class RoomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var hotelInfo: Hotel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func viewConfirmationAction(_ sender: Any) {
        self.performSegue(withIdentifier: "viewConfirmation", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelInfo!.rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCellIdentifier", for: indexPath)
        return cell
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
