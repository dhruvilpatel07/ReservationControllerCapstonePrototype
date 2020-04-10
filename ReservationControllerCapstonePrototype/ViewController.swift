//
//  ViewController.swift
//  ReservationControllerCapstonePrototype
//
//  Created by Dhruvil Patel on 2020-04-10.
//  Copyright © 2020 Dhruvil Patel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblReservations: UITableView!
    var reservationList = [ReservationCollection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let db = Firestore.firestore()
        
        // updates table and retrives data when ever you make changes ot add a new documents
        db.collection("reservations").addSnapshotListener { (snapshot, error) in
            if error == nil && snapshot != nil {
                self.reservationList.removeAll()
                for document in snapshot!.documents {
                    let data = document.data()
                    let customerId = data["uid"]
                    let customerName = data["name"]
                    let customerPhoneNumber = data["phoneNumber"]
                    let numberOfCustmer = data["numberOfPeople"]
                    let bookingDate = Date.init()
                    
                    let reservationObject = ReservationCollection(id: customerId as! String, name: customerName as! String, phoneNumber: customerPhoneNumber as! String, numberOfPeople: numberOfCustmer as! Int, dateAndTime: bookingDate as! Date)
                    self.reservationList.append(reservationObject)
                }//end of for loop
                self.tblReservations.reloadData()
            }//end of if
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservationList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomReservationTableViewCell

        let row = indexPath.row
        cell.lblName.text = reservationList[row].name
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from:reservationList[row].dateAndTime!)
        cell.lblDate.text = dateString
        cell.lblPhoneNumber.text = reservationList[row].phoneNumber
        cell.lblNumberOfPeople.text = String(format: "%.0d", reservationList[row].numberOfPeople!)
        
        
        return cell
    }
    
    func setAlertText(text:String){
        let alertController = UIAlertController(title: text , message: "\(text) Tapped", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController,animated: true)
    }
    
    @IBAction func seatedTapped(_ sender: Any) {
        setAlertText(text: "Seated")
    }
    
    @IBAction func delayTapped(_ sender: Any) {
        setAlertText(text: "Delay")
    }
    
    @IBAction func modifyTapped(_ sender: Any) {
        setAlertText(text: "Modify")
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        setAlertText(text: "Cancel")
    }
    
}

