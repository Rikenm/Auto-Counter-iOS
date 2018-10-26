//
//  ViewController.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/20/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var myTableView: UITableView!
    
    weak var coordinator: RootCoordinator?
    
    var counterListViewModel: CounterListViewModel = CounterListViewModel()
    
    var listofColors : [UIImage] = [#imageLiteral(resourceName: "b circle"),#imageLiteral(resourceName: "blue circle"),#imageLiteral(resourceName: "orange circle"),#imageLiteral(resourceName: "pink circle"),#imageLiteral(resourceName: "yellow circle")]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        myTableView.allowsSelection = false;
        setupNavbar()
        

        
    }
    
    public func setupTableView(){
        
        var tableViewFooter = UIView()
        tableViewFooter.translatesAutoresizingMaskIntoConstraints = false
        var label = UILabel()
        label.text = "Add Counter Item by clicking  +"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        tableViewFooter.addSubview(label)

        self.myTableView.tableFooterView = tableViewFooter
    }
    
    
    public func setupNavbar(){
        
        
       navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = .white
    
            let titleLabel = UILabel()
    
            //attributes for the first part of the string
            let firstAttr: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 20),
                                                           .foregroundColor: UIColor.white]
    

            let attrString = NSMutableAttributedString(string: "Counter", attributes: firstAttr)

            titleLabel.attributedText = attrString
    
            //finding the bounds of the attributed text and resizing the label accordingly
            let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: .greatestFiniteMagnitude)
            titleLabel.frame.size = attrString.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, context: nil).size
    
            //setting the label as the title view of the navigation bar
            navigationItem.titleView = titleLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func addTapped(){
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75;
    }
    
    
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = UITableViewCell()
//        
//        
//        cell.preservesSuperviewLayoutMargins = false
//        cell.separatorInset = UIEdgeInsets.zero
//        cell.layoutMargins = UIEdgeInsets.zero
//        
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
//        footerView.backgroundColor = UIColor.blue
        
        
        footerView.backgroundColor = UIColor.init(displayP3Red: 22/255, green: 32/255, blue: 43/255, alpha: 1)
        
        let line = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.7))
        line.backgroundColor = UIColor.init(displayP3Red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
        
        line.backgroundColor = UIColor.init(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
       
        footerView.addSubview(line)
        
        
        
        let label = UILabel()
        label.text = "Add counter item by clicking  +"
        label.font = UIFont(name: "HelveticaNeue-Light", size: 10)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        footerView.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        
        return footerView
    }
    
    // set height for footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }


}


extension ViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (counterListViewModel.getTotalCounter())
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        
//        let cell = Bundle.main.loadNibNamed("CounterListTableViewCell", owner: self, options: nil)?.first as! CounterListTableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! CounterListTableViewCell
        
        cell.mTitleCounter.text = counterListViewModel.getTitle()[indexPath.row]
        
        cell.mCount.text = String(counterListViewModel.getCount()[indexPath.row])
        
        cell.imageCircle.image = listofColors[(indexPath.row%5)]
        
        
        
        return cell
    }
    
    
    
    
    
 

    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("selected \(indexPath.row)")
        
        let counter = counterListViewModel.mListofCounters[indexPath.row]
        
        coordinator?.listToDetail(counter: counter)
        
    }
    
    
}

