//
//  TypePickerView.swift
//  PokeTypes
//
//  Created by Samuel Lichlyter on 12/6/19.
//  Copyright © 2019 Samuel Lichlyter. All rights reserved.
//

import UIKit

class TypePickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {

    var types: [String] = [String]()
    var pokeDelegate: PokeDelegate?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pokeDelegate?.didSelectType(type: types[row].lowercased())
    }
}
