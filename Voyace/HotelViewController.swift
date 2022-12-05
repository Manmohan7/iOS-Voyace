//
//  HotelViewController.swift
//  Voyace
//
//  Created by Manmohan Singh on 2022-12-02.
//

import UIKit

class HotelViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var hotelinfo: Hotel? = nil
    
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelDescription: UILabel!
    @IBOutlet weak var hotelRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotelName.text = hotelinfo?.name
        hotelDescription.text = hotelinfo?.description
        hotelRating.text = hotelinfo?.rating
        // Do any additional setup after loading the view.
    }
    
    @IBAction func viewRoomAction(_ sender: Any) {
        self.performSegue(withIdentifier: "viewRoom", sender: hotelinfo)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hotelImage", for: indexPath)
        return cell
    }
    
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "viewRoom") {
            let destination = segue.destination as? RoomViewController
            destination?.hotelInfo = sender as? Hotel
        }
    }
    

}
