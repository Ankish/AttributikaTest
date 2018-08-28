//
//  ViewController.swift
//  Test
//
//  Created by Ankish Jain on 28/08/18.
//  Copyright © 2018 Appyog. All rights reserved.
//

import UIKit
import Atributika

class AttributedLabelCell : UITableViewCell {
    @IBOutlet weak var textView: AttributedLabel!
    @IBOutlet weak var phView: UIView!
    @IBOutlet var bubbleViewWidthConstraint: NSLayoutConstraint!

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setContainerWidth()
    }
    
    func setContainerWidth(){
        var messageWidth: CGFloat
        
        let rowWidth = self.bounds.width
        messageWidth = rowWidth - 70 - 20
        self.bubbleViewWidthConstraint.constant = messageWidth
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.numberOfLines = 0
        textView.isEnabled = true
        textView.isUserInteractionEnabled = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textView.attributedText = nil
    }
}

class ViewController: UIViewController {

     @IBOutlet weak var tableView: UITableView!
    
    var array = [AttributedText]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 300
        
        let path = Bundle.main.path(forResource: "Text", ofType: "txt")
        
        if let string = try? String(contentsOfFile:path!, encoding: String.Encoding.utf8) {
            let strings = string.components(separatedBy: "&&&&")
            array.append(ViewController.formattedText(text: strings[0], creatorHandle: "t4ext", edited: false))
            array.append(ViewController.formattedText(text: strings[1], creatorHandle: "t4eerwerwxt", edited: false))

        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tableView.reloadData()
        self.tableView.scrollToRow(at: IndexPath(row: 199, section: 0), at: UITableViewScrollPosition.bottom, animated: false)
    }
    
    //
    class func formattedText(text: String, creatorHandle : String , edited : Bool) -> AttributedText {
        print(text)
        var  finalText = text
        finalText = "<b>@\(creatorHandle)</b>" + (text.isEmpty ? "" : "\n") + text
        if edited == true {
            finalText = finalText + "<x>(edited)</x>"
        }
        
        let styledText = finalText
        
        let span = Style("span").font(UIFont.brandonRegular(size: 16)).foregroundColor(UIColor.charCoal())
        let xEdited = Style("x").font(UIFont.brandonRegular(size: 8)).foregroundColor(UIColor.charCoal())
        
        let bold = Style("b").font(UIFont.brandonBold(size: 16)).foregroundColor(UIColor.charCoal())
        
        let links = Style.foregroundColor(UIColor.paleGreen(), .normal).foregroundColor(UIColor.paleGreen(), .highlighted).foregroundColor(UIColor.paleGreen(), StyleType.disabled).underlineStyle(NSUnderlineStyle.styleSingle, StyleType.disabled).underlineStyle(NSUnderlineStyle.styleSingle, StyleType.normal).underlineStyle(NSUnderlineStyle.styleSingle, StyleType.highlighted)
        let a = Style("a").foregroundColor(UIColor.paleGreen(), .normal).foregroundColor(UIColor.red, .highlighted).underlineStyle(NSUnderlineStyle.styleSingle, StyleType.normal).underlineStyle(NSUnderlineStyle.styleSingle, StyleType.highlighted)
        let underline = Style.underlineColor(UIColor.paleGreen(), .normal)
        let underlineH = Style.underlineColor(UIColor.paleGreen(), .highlighted)
        let all = Style.font(UIFont.brandonRegular(size: 16)).foregroundColor(UIColor.charCoal())
        return styledText.style(tags: [span,xEdited,a,underline,underlineH,bold]).styleLinks(links).styleAll(all)
    }
}

extension ViewController : UITableViewDataSource , UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttributedLabelCell") as! AttributedLabelCell
        if indexPath.row % 2 == 0{
             cell.textView.attributedText = array[0]
        }
        else {
           cell.textView.attributedText = array[1]
        }
       // cell.setContainerWidth()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
