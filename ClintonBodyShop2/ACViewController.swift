//
//  ACViewController.swift
//  ClintonBodyShop2
//
//  Created by Michael Hardin on 10/30/17.
//  Copyright © 2017 Michael Hardin. All rights reserved.
//

import UIKit

class ACViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var steps = ["Check to ensure you are not injured, if you are uninjured check with others.","If anyone is injured or the nature of the accident dictates it, immediately call 911. If required and appropriate, render first aid.", "Move your vehicle to a safe location if possible.","Exchange with other involved parties. This includes name, address, phone number, license plate number, driver's license number, and the name of the insurance company and contact.", "Secure names and contact info of any witnesses.","Take photographs of the vehicles and scene of the accident, if possible.", "Call the nearest Clinton Body Shop.", "Contact your insurance company, they may be able to provide additional guidance and request you get additional info."]
    
    
    @IBOutlet weak var acTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        acTableView.delegate = self
        acTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ACCell", for: indexPath) as! ACCell
        cell.stepLabel.text = steps[indexPath.row]
        return cell
    }
    
}
