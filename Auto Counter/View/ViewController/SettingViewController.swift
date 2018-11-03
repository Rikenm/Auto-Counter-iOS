//
//  SettingViewController.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 11/2/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit
import MessageUI

class SettingViewController: UITableViewController, Storyboarded, MFMailComposeViewControllerDelegate {
    
    var coordinator : Coordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
//        self.view.backgroundColor = UIColor.red
        self.view.isOpaque = true
        
//        self.view.backgroundColor = UIColor.init(displayP3Red: 149/255, green: 190/255, blue: 242/255, alpha: 1)
        
        
        
        setupNavBar()
    }
    
    
    func  setupNavBar(){
        
        
        
        navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 74/255, green: 73/255, blue: 73/255, alpha: 1)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        
        navigationItem.rightBarButtonItem?.tintColor = .white
        
    }
    
   @objc func doneTapped(){
       self.dismiss(animated: true, completion: nil)
    }
    
    
    
   
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        print(indexPath.row)
        
        
        
        
        if indexPath.section == 0 && indexPath.row == 1 {
            // rate this app
            
            rateApp(appId: "id959379869") { success in
                print("RateApp \(success)")
            }
            
            
        }else if  indexPath.section == 0 && indexPath.row == 0 {
            
            suggestAFeature()
            
        }
    
        else if  indexPath.section == 0 && indexPath.row == 2  {
            sendFeedback()
            
        }
    
        else if indexPath.section == 1 && indexPath.row == 0 {
            // reset all the counter
            print("reset all counter")
           resetAllCounters()
            
            
        }
        
        else if indexPath.section == 1 && indexPath.row == 1{
            // delete all the counter
            print("deletet all counter")
            deleteAllCounters()
            
            
        }
        
        
        
    }
    
    
    func rateApp(appId: String, completion: @escaping ((_ success: Bool)->())) {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/" + appId) else {
            completion(false)
            return
        }
        guard #available(iOS 10, *) else {
            completion(UIApplication.shared.openURL(url))
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: completion)
    }
    
    
    func resetAllCounters(){
        
        let persistantData = PersistantDataManager.shared
        
        
        
        var result = persistantData.fetchListOfCounters()
        
        result?.forEach({ (counter) in
            
           let counterCopy = Counter()
            counterCopy.mCount = 0
            counterCopy.mId = counter.mId
             counterCopy.mTitle = counter.mTitle
            counterCopy.mCounterState =   CounterState()
           persistantData.persistAndUpdateCounter(counter: counterCopy)
            
            
        })
        
        
        
        
    }
    
    func deleteAllCounters(){
        
        let persistantData = PersistantDataManager.shared
        
        persistantData.deleteAll()
        
        
        // show an alert that you have reset all the data from the realm
        
        
    }
    
    
    func suggestAFeature(){
        
        
        let mailComposeViewController = configureMailController(subject: "Requesting a feature", body: "Hi Riken, </br> I would like to suggest you to add a feature in the app. </br> </br> <b>YOUR MESSAGE HERE</b>  ")
        
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
        }else{
            
            showMailError()
        }
        
    }
    
    func sendFeedback(){
        
        let mailComposeViewController = configureMailController(subject: "Feedback about the app", body: "Hi Riken, </br>I would like to say something about the app. </br> </br> <b>YOUR MESSAGE HERE</b> ")
        
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
        }else{
            
            showMailError()
        }
        
    }
    
    
    func configureMailController(subject:String, body: String) -> MFMailComposeViewController{
        
        let mMailComposerVC = MFMailComposeViewController()
        
        mMailComposerVC.mailComposeDelegate = self
        
        mMailComposerVC.setToRecipients(["rikenm@bu.edu"])
        
        mMailComposerVC.setSubject(subject)
        
        mMailComposerVC.setMessageBody(body, isHTML: true)
        
        
        
        return mMailComposerVC
        
    }
    
    func showMailError(){
        let sendMailError = UIAlertController(title: "Couldn't Send the email", message: "blah blah", preferredStyle: .alert)
        
        let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        sendMailError.addAction(dismiss)
        
        self.present(sendMailError, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
