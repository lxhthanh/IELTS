//
//  QuestionTypeReading.swift
//  ielts.test
//
//  Created by admin on 12/13/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
var iSize:Int = 0
class QuestionTypeReading: UIViewController {

    @IBOutlet weak var NRead: UILabel!
    var cRead:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ReadData()
        NRead.adjustsFontSizeToFitWidth = true
        NRead.lineBreakMode = .byWordWrapping
        NRead.numberOfLines = 0;
    }
    func ReadData(){
        cRead = ""
        for data in listQuestion[0].qcontents as? [AnyObject] ?? []{
            for datatexts in data["texts"] as? [AnyObject] ?? []{
                var text:String = ""
                text = (datatexts as! String)
                cRead = cRead + text + "<br/>"
            }
        }
        NRead.setReadLabel(text: cRead,size: iSize)
    }

}
