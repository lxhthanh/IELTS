//
//  QuestionTypeDrawLineChild.swift
//  ielts.test
//
//  Created by admin on 12/15/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class QuestionTypeDrawLineChild: UIViewController {

    @IBOutlet weak var txt3: UILabel!
    @IBOutlet weak var txt2: UILabel!
    @IBOutlet weak var txt1: UILabel!
    @IBOutlet weak var btnEq: UIButton!
    @IBAction func onclickEq(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        btnEq.DesignBtn()
        qProcess()
        ReadData()
        
    }
    func ReadData(){
        var CheckSet:Bool = false
        var iPos:Int = 1
        for data in listQuestion[Position].qcontents as? [AnyObject] ?? []{
            let type = data["type"] as! Int
            if(type == 9){
                for datatexts in data["texts"] as? [AnyObject] ?? []{
                    if(CheckSet == false)
                    {
                        switch iPos{
                        case 1:
                            setLabel(label: txt1,text: (datatexts as! String))
                            iPos = iPos + 1
                        case 2:
                            setLabel(label: txt2,text: (datatexts as! String))
                            iPos = 1
                            CheckSet = true
                        default: break
                        }
                    }
                    else{
                        setLabel(label: txt3,text: (datatexts as! String))
                        CheckSet = false
                    }
                }
            }
        }
        
    }
    func setLabel(label: UILabel,text: String){
        do {
            label.attributedText = try NSAttributedString(data: (text.data(using: String.Encoding.unicode, allowLossyConversion: true)!), options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            //myLabel.textAlignment = NSTextAlignment.left
        } catch {
            print(error)
        }
    }
    func qProcess(){
        txt1.adjustsFontSizeToFitWidth = true
        txt2.adjustsFontSizeToFitWidth = true
        txt3.adjustsFontSizeToFitWidth = true
        var wComplete:Int = 0
        var wnComplete:Int = 0
        let iwidth:Int = Int(self.view.frame.width)
        let sY:Int = Int(txt1.frame.height + txt2.frame.height + txt3.frame.height + 16)
        wComplete = (iwidth - 32) * Position/(listQuestion.count - 1)
        wnComplete = (iwidth - 32) * (listQuestion.count - Position - 1)/(listQuestion.count - 1)
        let sX:Int =  16 + wComplete
        let myView = UIView(frame: CGRect(x: 16, y: sY, width: wComplete, height: 8))
        myView.backgroundColor = UIColor.red
        self.view.addSubview(myView)
        let myView1 = UIView(frame: CGRect(x: sX, y: sY, width: wnComplete, height: 8))
        myView1.backgroundColor = UIColor.blue
        self.view.addSubview(myView1)
    }

}
