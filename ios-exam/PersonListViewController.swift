//
//  PersonListViewController.swift
//  ios-exam
//
//  Created by Allan Gonzales on 6/19/17.
//  Copyright © 2017 upraxis. All rights reserved.
//

import UIKit

class PersonListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var personList = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.getData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData() {
        Service.getPersonList { (result:Any?, error: Error?) in
            if error == nil {
                self.personList = result as! [Person]
                self.tableView.reloadData()
            } else {
                print("error: \(error?.localizedDescription)")
            }
        }
    }

}

extension PersonListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        let person = personList[indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "PersonViewController") as! PersonViewController
        view.person = personList[indexPath.row]
        self.navigationController?.pushViewController(view, animated: true)
    }
}


