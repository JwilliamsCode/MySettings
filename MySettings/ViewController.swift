//
//  ViewController.swift
//  MySettings
//
//  Created by Justin Williams on 10/28/19.
//  Copyright © 2019 Justin Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtFavoriteColor: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBAction func btnSave(_ sender: Any) {
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(self.txtFullName.text, forKey: "fullname")
        defaults.set(self.txtAddress.text, forKey: "address")
        defaults.set(self.txtUserName.text, forKey: "username")
        defaults.set(self.txtPassword.text, forKey: "password")
        defaults.set(self.txtFavoriteColor.text, forKey: "favoritecolor")
          let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
        let newDate = dateFormatter.string(from:datepicker.date) //pass Date here
        defaults.set(newDate, forKey: "bdate")
        print(datepicker.date.description)
        defaults.synchronize()
        clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults: UserDefaults = UserDefaults.standard
              if defaults.string(forKey: "fullname") != nil{
                    txtFullName.text = defaults.string(forKey: "fullname")
              }
              if defaults.string(forKey: "address") != nil{
                  txtAddress.text = defaults.string(forKey: "address")
              }
            if defaults.string(forKey: "username") != nil{
                txtUserName.text = defaults.string(forKey: "username")
            }
            if defaults.string(forKey: "password") != nil{
                txtPassword.text = defaults.string(forKey: "password")
            }
            if defaults.string(forKey: "favoritecolor") != nil{
                txtFavoriteColor.text = defaults.string(forKey: "favoritecolor")
            }
              if defaults.string(forKey: "bdate") != nil{
                  let bdate  = defaults.string(forKey: "bdate")
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
                  let date = dateFormatter.date(from: bdate!) //according to date format your date string
                  datepicker.setDate(date!, animated: true)
              }
    }
    
    func clear()
    {
     txtFavoriteColor.resignFirstResponder()
            txtFullName.resignFirstResponder()
     }
}

