//
//  TableViewCell.swift
//  Voyace
//
//  Created by Manmohan Singh on 2022-12-02.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelDescription: UILabel!
    @IBOutlet weak var hotelImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
