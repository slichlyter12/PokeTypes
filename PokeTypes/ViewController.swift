//
//  ViewController.swift
//  PokeTypes
//
//  Created by Samuel Lichlyter on 12/6/19.
//  Copyright © 2019 Samuel Lichlyter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PokeDelegate {

    @IBOutlet weak var typePicker: TypePickerView!
    @IBOutlet weak var strengthSegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultTableView: ResultTableView!
    
    var pokeTypes: [StrengthType] = [StrengthType]()
    
    var selectedType: String = ""
    var selectedStrength: Strength = .weak
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // load types.json into pokeTypes
        if let filepath = Bundle.main.path(forResource: "types", ofType: "json") {
            do {
                let typeString = try String(contentsOfFile: filepath)
                let typeData = typeString.data(using: .utf8)!
                pokeTypes = try JSONDecoder().decode([StrengthType].self, from: typeData)
            } catch {
                print("Failed reading file:", error.localizedDescription)
            }
        }
        
        // set delegates and data sources
        typePicker.pokeDelegate = self
        typePicker.delegate = typePicker
        typePicker.dataSource = typePicker
        
        resultTableView.delegate = resultTableView
        resultTableView.dataSource = resultTableView
        
        // get just a list of types
        let types = pokeTypes.map { (type) -> String in
            return type.type.capitalized
        }

        // load types into picker view
        typePicker.types = types
        
        // initialize view
        didSelectType(type: pokeTypes[0].type)
        strengthSegmentedControl.selectedSegmentIndex = 1
        loadResults()
    }

    @IBAction func strengthChanged(_ sender: Any) {
        switch strengthSegmentedControl.selectedSegmentIndex {
        case 0:
            // strong
            selectedStrength = .strong
            break
        case 1:
            // weak
            selectedStrength = .weak
            break
        default:
            break
        }
        
        loadResults()
    }
    
    func didSelectType(type: String) {
        selectedType = type
        loadResults()
    }
    
    func loadResults() {
        var resultTypes: [String] = [String]()
        for type in pokeTypes {
            if type.type == selectedType {
                switch selectedStrength {
                case .strong:
                    resultTypes = type.strong
                    break
                case .weak:
                    resultTypes = type.weak
                    break
                }
                break
            }
        }
            
        resultTableView.types = resultTypes
        resultTableView.reloadData()
    }
}
