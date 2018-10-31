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
    
  
    
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var dimView: UIView!
    var counterListViewModel: CounterListViewModel = CounterListViewModel()
    
//    var listofColors : [UIImage] = [#imageLiteral(resourceName: "b circle"),#imageLiteral(resourceName: "blue circle"),#imageLiteral(resourceName: "orange circle"),#imageLiteral(resourceName: "pink circle"),#imageLiteral(resourceName: "yellow circle")]
    
    
    @IBOutlet weak var editTextAdd: UITextField!
    
    
    @IBAction func enterButton(_ sender: UIButton) {
        if(editTextAdd.text != ""){
            
            let counter = Counter()
            if let title = editTextAdd.text{
                
                counter.mTitle = title
                counter.mCounterState = CounterState()
                counterListViewModel.persistCounter(counter: counter)
                
                myTableView.reloadData()
                
                UIView.animate(withDuration: 0.4, animations: {
                    self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                    self.addItemView.alpha = 0
                    self.dimView.alpha = 0
                    self.editTextAdd.text = ""
                    
                }) { (success: Bool) in
                    
                    self.addItemView.removeFromSuperview()
                    
                }
                
                
            }
            
           
            
        }else{
            
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.08
            animation.repeatCount = 2
            animation.autoreverses = true
            animation.speed = 1.0
            animation.fromValue = NSValue(cgPoint: CGPoint(x: addItemView.center.x+10, y: addItemView.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: addItemView.center.x-10 , y: addItemView.center.y))
            addItemView.layer.add(animation, forKey: "position")
            
        }
        
    }
    @IBOutlet var addItemView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        myTableView.allowsSelection = false;
        setupNavbar()
        
//        counterListViewModel.datatoVc.subscribe(onNext:{
//            data in
//            
//            self.myTableView.reloadData()
//            
//        })
        

        
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
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
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
        
        

//
       
        
        addItemView.layer.cornerRadius = 10
        topView.layer.cornerRadius = 10
        
        view.addSubview(addItemView)
        
        //animation
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
             self.dimView.alpha = 0.6
             self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
        
        
        addItemView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addItemView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            addItemView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: -UIScreen.main.bounds.height * 0.1),
            addItemView.widthAnchor.constraint(equalToConstant: 304),
            addItemView.heightAnchor.constraint(equalToConstant: 156)
            ])
        
        

        
        
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150;
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
    
    
    
    @IBAction func onDimissCardView(_ sender: Any) {
        
        
        UIView.animate(withDuration: 0.4, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            self.dimView.alpha = 0
            self.editTextAdd.text = ""
            
        }) { (success: Bool) in
            
            self.addItemView.removeFromSuperview()
            
        }
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.myTableView.reloadData()
    }
    
    
    
    


}


extension ViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //error
        return (counterListViewModel.getTotalCounter())
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        
//        let cell = Bundle.main.loadNibNamed("CounterListTableViewCell", owner: self, options: nil)?.first as! CounterListTableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! CounterListTableViewCell
        
        cell.mTitleCounter.text = counterListViewModel.getTitle()[indexPath.row]
        
        cell.mCount.text = String(counterListViewModel.getCount()[indexPath.row])
        
        
        cell.rateLabel.text =  String(counterListViewModel.mListofCounters[indexPath.row].mCounterState.rateState)
        
        
        if( counterListViewModel.mListofCounters[indexPath.row].mCounterState.mSound == .mute){
             cell.muteImage.setImage(UIImage(named: "mute-white"), for: .normal)
        }else{
             cell.muteImage.setImage(UIImage(named: "sound-white"), for: .normal)
        }
        
        
        
        if(counterListViewModel.mListofCounters[indexPath.row].mCounterState.mSpeed == .fast){
            cell.speedBtn.setImage(UIImage(named: "lighting-white"), for: .normal)
        }else if (counterListViewModel.mListofCounters[indexPath.row].mCounterState.mSpeed == .slow) {
            cell.speedBtn.setImage(UIImage(named: "tortoise-white"), for: .normal)
        }else if (counterListViewModel.mListofCounters[indexPath.row].mCounterState.mSpeed == .normal) {
            
           cell.speedBtn.setImage(UIImage(named: "blank-white"), for: .normal)
        }
       
        

        
        
        return cell
    }
    
    
    
    
    
 

    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("selected \(indexPath.row)")
        
        let counter = counterListViewModel.mListofCounters[indexPath.row]
        
        coordinator?.listToDetail(counter: counter)
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if(editingStyle == .delete){
            
            let id = counterListViewModel.mListofCounters[indexPath.row].mId
            
            counterListViewModel.deleteCounter(id: id)
            myTableView.reloadData()

        }
    }
    
    
}

