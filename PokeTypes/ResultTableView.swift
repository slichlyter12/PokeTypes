//
//  ResultTableView.swift
//  PokeTypes
//
//  Created by Samuel Lichlyter on 12/6/19.
//  Copyright © 2019 Samuel Lichlyter. All rights reserved.
//

import UIKit

class ResultTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var types: [String] = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeCell", for: indexPath)
        cell.textLabel?.text = types[indexPath.row].capitalized
        return cell
    }
}
