//
//  ReceiveLatAndLongController.swift
//  Weather2
//
//  Created by CharuwanRuanmoei on 1/14/2559 BE.
//  Copyright © 2559 CharuwanRuanmoei. All rights reserved.
//

import UIKit

class ReceiveLatAndLongController: UIViewController, UITextFieldDelegate{
   
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        latitudeTextField.delegate = self
        longitudeTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
