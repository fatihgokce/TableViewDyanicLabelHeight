//
//  ViewController.swift
//  Table
//
//  Created by fatih on 11/05/16.
//  Copyright © 2016 fatih. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var messages = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        
        //tableView.dataSource = self
       
     
        //tableView.separatorStyle = .SingleLineEtched
        //tableView.rowHeight = UITableViewAutomaticDimension
        
        //tableView.estimatedRowHeight = 200
    
        messages.append("rrrr dfvffff dfvfdvfdv dfvdfvvvvvf dfvdfvdfvdfvervr sdcsdcsdc sdcsdcsdcs s dcsdcsd sdcdscsd scdscsd sdcdscsdcsd sdcsdcsdcsd sdcwefewv dvsdsdvwefewişğğilclvğsdlvdfisvisşdfvifşvkidfvidfvdfşvdflvişdfvşikvkrepikver ervmşelrmşlermvsvşjvreoş 1.S")
        messages.append("2. data svdfvdfvdf sdvdfvd dscdcsd sdcsdcsd sddscsdc DSCSDVDFVFDVDFVDF FDVERVREV EVFDVERVDVERVE DVVERVVDVRBTJYUKUIKMTYNTY 2S")
        
        messages.append("2. row fda")
        messages.append("4.row")
        //tableView.reloadData()
 
    }
    override func viewDidAppear(animated: Bool) {
         //tableView.estimatedRowHeight = 200
          //tableView.reloadData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
        //return self.messages.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? CustomCell
        cell?.txt1.text = messages[indexPath.row]
        cell?.accessoryType = .None
        //cell!.layoutIfNeeded()
        if indexPath.row % 2 == 1
        {
        
            cell?.backgroundColor = UIColor.grayColor()
        }
        else{
        
            cell?.backgroundColor = UIColor.lightGrayColor()
        }
        return cell!;
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       
       
        var h = messages[indexPath.row].heightWithConstrainedWidth(UIScreen.mainScreen().bounds.width, font: UIFont.systemFontOfSize(13))
        if h > 0 {
        
            h += h * 20/100
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? CustomCell
        
        //cell?.txt1.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        return    h + 5 + 165
    }
 
 
 
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.alpha = 0
        
        
        let rota = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rota
        UIView.animateWithDuration(1.0, animations: {() in
        
           cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        })
 
    }

}
class CustomCell: UITableViewCell{


    let view1 : UIImageView = {
    
        let ui = UIImageView()
        let img = UIImage(named: "7")
        ui.image = img
        //ui.backgroundColor = UIColor.redColor()
        ui.contentMode = .ScaleToFill  //.ScaleAspectFit
        
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    let txt1 : UILabel = {
    
        let lbl = UILabel()
        lbl.text = " Iphomne 7 8 Ulltra thin"
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFontOfSize(13)
        lbl.lineBreakMode = .ByWordWrapping

        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let txt2 : UILabel = {
        
        let lbl = UILabel()
        lbl.text = " Iphomne 7 8 Ulltra thin e333"
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let txt3 : UILabel = {
        
        let lbl = UILabel()
        lbl.text = " Iphomne 7"
        lbl.textColor = UIColor.orangeColor()
        lbl.font = UIFont.boldSystemFontOfSize(17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //contentView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 200)
        setupViews()
    
    }
    func setupViews(){
  
        self.contentView.addSubview(view1)
        self.contentView.addSubview(txt1)
        //self.contentView.addSubview(txt2)
        self.contentView.addSubview(txt3)
   
        
        addConstraint(NSLayoutConstraint(item: txt1, attribute: .Left, relatedBy: .Equal, toItem: self.contentView, attribute: .Left, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: txt1, attribute: .Top, relatedBy: .Equal, toItem: self.contentView, attribute: .Top, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: txt1, attribute: .Right, relatedBy: .Equal, toItem: self.contentView, attribute: .Right, multiplier: 1, constant: 0))
        //addConstraint(NSLayoutConstraint(item: txt1, attribute: .Bottom, relatedBy: .Equal, toItem: self.contentView, attribute: .Bottom, multiplier: 1, constant: 0))

        //addConstraint(NSLayoutConstraint(item: txt2, attribute: .Left, relatedBy: .Equal, toItem: txt1, attribute: .Right, multiplier: 1, constant: 5))
        //addConstraint(NSLayoutConstraint(item: txt2, attribute: .Top, relatedBy: .Equal, toItem: self.contentView, attribute: .Top, multiplier: 1, constant: 10))
        
        addConstraint(NSLayoutConstraint(item: view1, attribute: .Left, relatedBy: .Equal, toItem: self.contentView, attribute: .Left, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: view1, attribute: .Right, relatedBy: .Equal, toItem: self.contentView, attribute: .Right, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: view1, attribute: .Top, relatedBy: .Equal, toItem: txt1, attribute: .Bottom, multiplier: 1, constant: 10))

        addConstraint(NSLayoutConstraint(item: view1, attribute: .Width, relatedBy: .Equal, toItem: self.contentView, attribute: .Width, multiplier: 1, constant: -20))
        addConstraint(NSLayoutConstraint(item: view1, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 150))
        
         addConstraint(NSLayoutConstraint(item: view1, attribute: .Bottom, relatedBy: .Equal, toItem: self.contentView, attribute: .Bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: txt3, attribute: .CenterX, relatedBy: .Equal, toItem: view1, attribute: .CenterX, multiplier: 1, constant: 0))
      
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layoutSubviews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
}
