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
        clueTableView.dataSource = self
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = locationTextField.text,
                let country = countryTextField.text,
                !location.isEmpty,
                !country.isEmpty else { return }
        
        let poi = POI(location: location, country: country, clues: clueList)
        delegate?.poiWasCreated(poi)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let alert = UIAlertController(title: "New Clue", message: "Enter a clue", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            if let textField = alert?.textFields?[0] {
                if let textValue = textField.text {
                    self.clueList.append(textValue)
                    self.clueTableView.reloadData()
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clueList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clueCell", for: indexPath)
        let clue = clueList[indexPath.row]
        cell.textLabel?.text = clue
        return cell
    }
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
