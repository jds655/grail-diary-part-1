//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Joshua Sharp on 8/14/19.
//  Copyright © 2019 Joshua Sharp. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    var POIs:[POI] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                //addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let POIDetailVC = segue.destination as? POIDetailViewController {
                // Set the friend property on the detail view controller to the friend that was selected
                POIDetailVC.POI = POIs[indexPath.row]
            }
        }
    }
}

//Conform to UITableViewDataSource
extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "grailDiaryCell", for: indexPath) as? POITableViewCell else {return UITableViewCell()}
        let POI = POIs[indexPath.row]
        cell.POI = POI
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasCreated(_ POI: POI) {
        POIs.append(POI)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
