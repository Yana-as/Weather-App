//
//  View Controller+UITextFieldDelegate.swift
//  Weather Map
//
//  Created by Yana on 13.08.2020.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    
    // Hiding the keyboard by tapping
    @objc func tapGesture() {
        customCitySearchTextField.resignFirstResponder()
    }
    
    // Hiding the keyboard by pressing search button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
