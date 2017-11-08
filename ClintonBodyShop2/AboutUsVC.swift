//
//  AboutUsVC.swift
//  ClintonBodyShop2
//
//  Created by Michael Hardin on 10/30/17.
//  Copyright © 2017 Michael Hardin. All rights reserved.
//

import UIKit

class AboutUsVC: UIViewController {

    @IBOutlet weak var ABTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ABTextView.text = "Our repair experts are thoroughly trained in the use of our equipment and its exacting application in the repair process. Our technicians are PPG certified collision specialists and receive ongoing training from ICAR and ASE (industry certification programs that provide ongoing technical training in the collision repair business). In addition, the manufacturers of our high-tech frame, body repair, and paint systems keep our technicians up to date with new technology and use of their equipment and materials.\n\nOne Stop Shop\nWe are a one stop full service shop.We offer frame straightening, unibody alignment, minor to major refinish work including all-over paint jobs and custom paint.\n\nUse Quality Parts\nTo repair your car to the best of our ability utilizing the most highly respected brand of equipment and materials available to our industry.\n\nTrain Employees\nTo make training of everyone involved in the service process be an ongoing positive part of their job at Clinton Body Shop.\n\nRespect Customers\nTo treat you with the same respect we would expect at a business.\n\nMaintain Relationships\nTo maintain a positive relationship with the customer and the insurance company so that we can provide the level of quality in our repairs your car deserves and for which we are known.\n\nMinimize Downtime\nTo minimize the down time on your car by making repairs right the first time.  We know you don’t have time to have the same job done twice.\n\nHelp Our Community\nTo be good business citizens and help our community as much as possible."

    }

    
    
    @IBAction func backPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
