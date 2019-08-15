//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Joshua Sharp on 8/14/19.
//  Copyright © 2019 Joshua Sharp. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
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
        locationLabel.text = POI.location
        countryLabel.text = POI.country
        let cluesCount = POI.clues.count
        if cluesCount > 1 {
            cluesLabel.text = "\(cluesCount) clues"
        } else {
            cluesLabel.text = "\(cluesCount) clue"
        }
    }

}
