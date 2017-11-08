//
//  ViewController.swift
//  ClintonBodyShop2
//
//  Created by Michael Hardin on 10/25/17.
//  Copyright © 2017 Michael Hardin. All rights reserved.
//

import UIKit
import MessageUI
import MapKit
import CoreLocation

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MFMailComposeViewControllerDelegate,MKMapViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager = CLLocationManager()
    var annotation = MKPointAnnotation()
    var location: CLLocation?
    
    var menuItems = [MenuItem]()
    let alertController = UIAlertController(title: "Email Us", message: "Which location would you like to email?", preferredStyle: .actionSheet)
    let alertController2 = UIAlertController(title: "Call Us", message: "Which location would you like to call?", preferredStyle: .actionSheet)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.addAnnotation(annotation)
        
        
        setUpTable()
        //setupMap()
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if !locations.isEmpty{
            location = locations[0]
            
            let latitude:CLLocationDegrees = location!.coordinate.latitude
            let longitude:CLLocationDegrees = location!.coordinate.longitude
            let latDelta:CLLocationDegrees = 0.005
            let lonDelta:CLLocationDegrees = 0.005
            let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
            
            let coordinates:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            
            
            CLGeocoder().reverseGeocodeLocation(location!, completionHandler: { (placemarks, error) in
                if error != nil{
                    print(error!)
                }else {
                    if let placemark = placemarks?[0] {
                        if placemark.subThoroughfare != nil && placemark.thoroughfare != nil {
                            self.locationLabel!.text = "\(placemark.subThoroughfare!) \(placemark.thoroughfare!)"
                            //annotation.title = placemark.name!
                            self.annotation.coordinate = coordinates
                            print(placemark.name!)
                        }else{
                            self.locationLabel!.text = "Street address not found"
                        }
                        
                }
                    
            }
            })
            let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
            
            mapView.setRegion(region, animated: true)
            
            
            
           
            
            
            
            
            
            print(location!)
        }
        
        
        
    }
    
    
    
    
    
    func setUpTable(){
        tableView.delegate = self
        tableView.dataSource = self
        
        menuItems.append(MenuItem(title: "Accident Checklist", image: #imageLiteral(resourceName: "accident")))
        menuItems.append(MenuItem(title: "Call Us", image: #imageLiteral(resourceName: "phone")))
        menuItems.append(MenuItem(title: "Email Us", image: #imageLiteral(resourceName: "email")))
        menuItems.append(MenuItem(title: "About Us", image: #imageLiteral(resourceName: "aboutus")))
        //menuItems.append(MenuItem(title: "News", image: #imageLiteral(resourceName: "news")))
        menuItems.append(MenuItem(title: "FAQs", image: #imageLiteral(resourceName: "faqs")))
        tableView.rowHeight = 60
        configureActionSheets()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.titleLabel.text = menuItems[indexPath.row].title
        cell.imageView?.image = menuItems[indexPath.row].image
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuCell
        cell.setSelected(false, animated: false)
        switch cell.titleLabel.text! {
        case "Accident Checklist":
            performSegue(withIdentifier: "toAccidentChecklist", sender: self)
        case "About Us":
            performSegue(withIdentifier: "toAboutUs", sender: self)
        case "FAQs":
            performSegue(withIdentifier: "toFAQs", sender: self)
            print("FAQs")
        case "Email Us":
            present(alertController, animated: true, completion: nil)
            print("Email")
        case "Call Us":
            present(alertController2, animated: true, completion: nil)
            print("Call")
        default:
            break
        }
    }
    func configureActionSheets(){
        
        
        let clintonEmail = UIAlertAction(title: "Clinton", style: .default, handler: { (action) -> Void in
            print("clinton email tapped")
            self.sendEmailClinton()
        })
        
        let  richlandEmail = UIAlertAction(title: "Richland", style: .default, handler: { (action) -> Void in
            print("richland email tapped")
            self.sendEmailRichland()
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        
        let clintonPhone = UIAlertAction(title: "Clinton", style: .default, handler: { (action) -> Void in
            print("clinton phone tapped")
            guard let number = URL(string: "tel://6019242159") else { return }
            UIApplication.shared.open(number)
        })
        
        let  richlandPhone = UIAlertAction(title: "Richland", style: .default, handler: { (action) -> Void in
            print("richland phone tapped")
            guard let number = URL(string: "tel://6019320459") else { return }
            UIApplication.shared.open(number)
        })
        
        let cancelButton2 = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        
        alertController.addAction(clintonEmail)
        alertController.addAction(richlandEmail)
        alertController.addAction(cancelButton)
        
        alertController2.addAction(clintonPhone)
        alertController2.addAction(richlandPhone)
        alertController2.addAction(cancelButton2)
    }
    
    func sendEmailClinton() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["clintonbodyshop@comcast.net"])
            mail.setSubject("Message to Clinton Body Shop")
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func sendEmailRichland() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["cbsr@clintonbodyshop.com"])
            mail.setSubject("Message to Clinton Body Shop in Richland")
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
    
    
//    func setupMap(){
//        let latitude:CLLocationDegrees = 32.2994437
//        let longitude:CLLocationDegrees = -90.1828231
//        let latDelta:CLLocationDegrees = 0.01
//        let lonDelta:CLLocationDegrees = 0.01
//        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
//
//        let coordinates:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//
//        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
//
//        mapView.setRegion(region, animated: true)
//
//        let annotation = MKPointAnnotation()
//
//        annotation.title = "You are here"
//        annotation.coordinate = coordinates
//
//        mapView.addAnnotation(annotation)
//    }
}

