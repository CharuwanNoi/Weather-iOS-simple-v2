//
//  MyTableViewController.swift
//  Weather2
//
//  Created by CharuwanRuanmoei on 1/14/2559 BE.
//  Copyright © 2559 CharuwanRuanmoei. All rights reserved.
//

import UIKit
import CoreData

class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var titleArray = [String]()
    var idArray = [String]()

    var latitude = String()
    var longitude = String()
    var id: String = ""
    var city :String = ""
    
        @IBOutlet var tableView: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.tableView.reloadData()
            
        }
    
        @IBAction func saveTitle(segue:UIStoryboardSegue){

            if segue.identifier == "cityName"{
                

                let titleVC: ReceiveLatAndLongController = segue.sourceViewController as! ReceiveLatAndLongController

                latitude = titleVC.latitudeTextField.text!
                longitude = titleVC.longitudeTextField.text!
            
                if latitude == "" || latitude == "" {
                
                    let alert = UIAlertView()
                    alert.message = "Please enter the latitude and longitude."
                    alert.addButtonWithTitle("OK")
                    alert.show()
                }else if Double(latitude) < -90 || Double(latitude) > 90 || Double(latitude) < -180 || Double(latitude) > 180 {

                    let alert = UIAlertView()
                    alert.message = "found no city"
                    alert.addButtonWithTitle("OK")
                    alert.show()
            
                }else if Double(latitude) == 0 && Double(latitude) == 0 {
                    let alert = UIAlertView()
                    alert.message = "Not found city."
                    alert.addButtonWithTitle("OK")
                    alert.show()
                    
                }else if Double(latitude) == 1 && Double(latitude) == 1{
                    let alert = UIAlertView()
                    alert.message = "Not found city."
                    alert.addButtonWithTitle("OK")
                    alert.show()
                    
                }else if Double(latitude) == 2 && Double(latitude) == 2{
                    let alert = UIAlertView()
                    alert.message = "Not found city."
                    alert.addButtonWithTitle("OK")
                    alert.show()

                }else {

                    let parser = XMLParserLocation(Url: "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20geo.placefinder%20where%20text=%22\(latitude),\(longitude)%22%20and%20gflags=%22R%22")
           
                    let weather: Weather = parser.weather1
                    id = weather.woeid
                    city = weather.city
                    
                    idArray.append(id)
                    titleArray.append(city)
                    

                }
            }
        }

        override func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
            self.tableView.reloadData()
        
        }

    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.titleArray.count;

        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            cell.textLabel?.text = self.titleArray[indexPath.row]
            
            return cell
        }
        
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
  
        }
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            if let selectedRow = self.tableView.indexPathsForSelectedRows {
                let showViewController = segue.destinationViewController as! ShowViewController
            
                let indexPath = selectedRow[0]
                showViewController.idCiry = idArray[indexPath.row]

            }
        }
    
}
