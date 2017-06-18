//
//  PersonViewController.swift
//  ios-exam
//
//  Created by Allan Gonzales on 6/19/17.
//  Copyright © 2017 upraxis. All rights reserved.
//

import UIKit

class PersonViewController: UITableViewController {

    var person: Person?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var contactPersonLabel: UILabel!
    @IBOutlet weak var contactPersonNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setPersonDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPersonDetails() {
        self.nameLabel.text = person?.name
        self.birthdayLabel.text = person?.birthday
        self.ageLabel.text = "\(person!.age)"
        self.emailLabel.text = person?.email
        self.mobileNumberLabel.text = person?.mobile_number
        self.addressLabel.text = person?.address
        self.contactPersonLabel.text = person?.contact_person
        self.contactPersonNumberLabel.text = person?.contact_person_number
    }

}
