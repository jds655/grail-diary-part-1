//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Joshua Sharp on 8/14/19.
//  Copyright © 2019 Joshua Sharp. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    
    var POI:POI? {
        // didSet is a property observer, it will be called every time friend is set
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func updateViews() {
        guard let POI = POI else { return }
        
//        .text = friend.name
//        hometownLabel.text = friend.hometown
//        hobbyCountLabel.text = "\(friend.hobbies.count) # of clues"
    }

}
