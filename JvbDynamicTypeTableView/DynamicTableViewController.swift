//
//  DynamicTableViewController.swift
//  JvbDynamicTypeTableView
//
//  Created by Joost van Breukelen on 01-09-16.
//  Copyright © 2016 Joost van Breukelen. All rights reserved.
//

import UIKit

class DynamicTableViewController: UITableViewController {
    
    let cars = ["Alfa Romeo", "BMW", "Citroën", "Daihatsu", "Evasion", "Ferrari", "Gullwing", "Hummer", "Iso", "Just don't know", "Koenigsegg", "Lancia", "Maserati", "Nissan", "Oldsmobile", "Paccar", "Quasimodo", "Reliant", "Saab", "Toyota", "Ulysse", "Volkswagen", "Wartburg", "Xantia", "Yugo", "Zastava"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return cars.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dynamicCell", for: indexPath)

        cell.textLabel?.text = cars[indexPath.row]

        return cell
    }


    


}
