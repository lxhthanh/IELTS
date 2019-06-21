//
//  MainView.swift
//  ielts.test
//
//  Created by admin on 12/12/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
var cName = ""
class MainView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        assignbackground()
    }
    
    @IBOutlet weak var btnb3: UIButton!
    @IBOutlet weak var btnb2: UIButton!
    @IBOutlet weak var btnb1: UIButton!
    

    @IBAction func onClickB3(_ sender: Any) {
        iSize = 19
        Position = 0
        ReadDataJson.instance().readLocalJsonFile(NameJson: "b3")
        cName = ReadDataJson.instance().readNameJsonFile(NameJson: "b3")
        intentQuestion()
    }
    @IBAction func onClickB2(_ sender: Any) {
        iSize = 18
        Position = 0
        ReadDataJson.instance().readLocalJsonFile(NameJson: "b2")
        cName = ReadDataJson.instance().readNameJsonFile(NameJson: "b2")
        intentQuestion()
    }
    @IBAction func onClickB1(_ sender: Any) {
        iSize = 20
        Position = 0
        ReadDataJson.instance().readLocalJsonFile(NameJson: "b1")
        cName = ReadDataJson.instance().readNameJsonFile(NameJson: "b1")
        intentQuestion()  
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    //intentB1//
    func intentQuestion()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewQuestion") as! MainViewQuestion
        self.present(nextViewController, animated:true, completion:nil)
    }
    //
    func SetButton(btn: UIButton){
        btn.titleLabel?.numberOfLines = 0
        btn.titleLabel?.lineBreakMode = .byWordWrapping
        btn.titleLabel?.textAlignment = .center
        btn.setFont()
    }
    //Set Background View//
    func assignbackground(){
        SetButton(btn: btnb1)
        SetButton(btn: btnb2)
        SetButton(btn: btnb3)
        btnb1.setTitle(ReadDataJson.instance().readNameJsonFile(NameJson: "b1"), for: .normal)
        btnb2.setTitle(ReadDataJson.instance().readNameJsonFile(NameJson: "b2"), for: .normal)
        btnb3.setTitle(ReadDataJson.instance().readNameJsonFile(NameJson: "b3"), for: .normal)
        btnb1.setBackgroundImage(UIImage(named: "bg2_b"), for:.highlighted)
        btnb2.setBackgroundImage(UIImage(named: "bg2_b"), for:.highlighted)
        btnb3.setBackgroundImage(UIImage(named: "bg2_b"), for:.highlighted)
        self.view.assignbackground(img:"bg2_bg")
    }
    //
}
