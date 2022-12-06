//
//  HotelViewController.swift
//  Voyace
//
//  Created by Manmohan Singh on 2022-12-02.
//

import UIKit

class HotelViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var hotelInfo: Hotel? = nil
    
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelDescription: UILabel!
    @IBOutlet weak var hotelRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotelName.text = hotelInfo?.name
        hotelDescription.text = hotelInfo?.description
        hotelRating.text = hotelInfo?.rating
    }
    
    @IBAction func viewRoomAction(_ sender: Any) {
        self.performSegue(withIdentifier: "viewRoom", sender: hotelInfo)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotelInfo!.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hotelImageCell", for: indexPath) as! HotelCollectionViewCell
        let i = indexPath.row
        
        cell.hotelImage.image = UIImage(named: hotelInfo!.images[i])
        
        return cell
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "viewRoom") {
            let destination = segue.destination as? RoomViewController
            destination?.hotelInfo = sender as? Hotel
        }
    }
    

}
