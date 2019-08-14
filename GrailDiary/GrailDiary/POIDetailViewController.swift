//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Joshua Sharp on 8/14/19.
//  Copyright © 2019 Joshua Sharp. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesView: UITextView!
    
    var POI: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let POI = POI else { return }
        
        locationLabel.text =  POI.location
        countryLabel.text = POI.country
        var cluesText = ""
        for clue in POI.clues {
            // Append each clue with a bullet point
            // \n will add a "new line charecter", the same thing the enter key does.
            cluesText += "• \(clue)\n"
        }
        cluesView.text = cluesText
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
