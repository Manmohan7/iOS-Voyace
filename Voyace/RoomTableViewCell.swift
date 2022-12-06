//
//  RoomTableViewCell.swift
//  Voyace
//
//  Created by Manmohan Singh on 2022-12-05.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var roomImage: UIImageView!
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var roomDescription: UILabel!
    @IBOutlet weak var roomFare: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
