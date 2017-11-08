//
//  FAQVC.swift
//  ClintonBodyShop2
//
//  Created by Michael Hardin on 10/31/17.
//  Copyright © 2017 Michael Hardin. All rights reserved.
//

import UIKit

class FAQVC: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = "If my vehicle's frame is damaged, can it be saved and repaired?\n\nIn many cases, it is possible to repair a vehicle’s frame if it’s been damaged in a collision. We use Car-O-Liner frame-straightening equipment and premium-quality welders to repair unibody frames and sections. Whenever possible, we’ll bring your vehicle back into alignment, restoring the handling and ride that it had before its collision. On the other hand, if the frame is damaged to the point where it cannot be restored to a safe condition, we’ll be straightforward with you about that too.\n\nCan I get a rental car from Clinton Body Shop?\n\nYes, Clinton Body Shop has arrangements with several rental car agencies near our shop, and they provide pick-up and drop-off service for customers at our facility.\n\nCan you match my vehicles exact paint color?\n\nYes. Clinton Body Shop uses a state-of-the-art PPG paint mixing system that makes customized, highly exact colors and finishes. This system will match any color on any vehicle of any model, make, and year.\n\nIs there a warranty on Clinton Body Shop Repairs?\n\nYes, all Warranty on parts and materials are by the manufacturer of the part or material. All warranty on labor and workmanship for repairs performed by Clinton Body Shop, Inc. are for the duration of the ownership by the person for whom it was repaired..\nThis guarantee covers labor only and does not apply to parts, material or equipment which may be covered by a manufacturer’s warranty.\n\nHow will I know if my vehicle is done?\n\nAt Clinton Body Shop, we make it a point to keep you updated on the status of your vehicle. We contact you at every important step in the repair process, including the moment when your vehicle’s repairs are complete."
    }

    
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
