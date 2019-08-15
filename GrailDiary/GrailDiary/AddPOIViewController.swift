//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Joshua Sharp on 8/14/19.
//  Copyright © 2019 Joshua Sharp. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasCreated (_ POI: POI)
}

class AddPOIViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clueTableView: UITableView!
    var delegate: AddPOIDelegate?
    var clueList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = locationTextField.text,
                let country = countryTextField.text,
                !location.isEmpty,
                !country.isEmpty else { return }
        
        let poi = POI(location: location, country: country, clues: [])
        delegate?.poiWasCreated(poi)
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clueList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clueCell", for: indexPath)
        let clue = clueList[indexPath.row]
        cell.detailTextLabel?.text = clue
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
extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else
        {
            textField.becomeFirstResponder()
            return false
        }
        return true
    }
}
