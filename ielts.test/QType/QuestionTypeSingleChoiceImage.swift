import UIKit
import EzPopup
var bShowLabel = false
class QuestionTypeSingleChoiceImage: UIViewController {
    var timer = Timer()
    @IBOutlet weak var txt3: UILabel!
    @IBOutlet weak var txt1: UILabel!
    @IBOutlet weak var btnEq: UIButton!
    var myView:UIView!
    var myView1:UIView!
    var cRead:String = ""
    var currentPos:Int = 0
    @IBAction func onclickEq(_ sender: Any) {
        bCheckShow = true
        self.timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.showLabel), userInfo: nil, repeats: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if(btnEq.currentTitle != nil){
            SaveData(sData: btnEq.currentTitle!)
        }
        btnEq.setTitle("", for: .normal)
        myView1.removeFromSuperview()
        myView.removeFromSuperview()
    }
    func SaveData(sData: String){
        let arr = listQuestion[currentPos].qtitle.components(separatedBy: " ")
        let iQuestion = arr[1]
        for i in 0..<listResult.count{
            if(iQuestion == listResult[i].sQuestion){
                listResult[i].setanswerValue(answerValue: sData)
                break
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        btnEq.DesignBtn()
        qProcess()
        ReadData()
        ReadEq()
    }
    func ReadEq(){
        let arr = listQuestion[Position].qtitle.components(separatedBy: " ")
        let iQuestion = arr[1]
        for i in 0..<listResult.count{
            if(iQuestion == listResult[i].sQuestion){
                btnEq.setTitle(listResult[i].answerValue, for: .normal)
                break
            }
        }
    }
    func ReadData(){
        var CheckSet:Bool = false
        currentPos = Position
        for data in listQuestion[Position].qcontents as? [AnyObject] ?? []{
            let type = data["type"] as! Int
            if(type == 9){
                for datatexts in data["texts"] as? [AnyObject] ?? []{
                    var text:String = ""
                    text = (datatexts as! String)
                    cRead = cRead  + text + "<br/>"
                }
                if(CheckSet == false)
                {
                    txt1.setLabel(text: cRead)
                    cRead = ""
                    CheckSet = true
                }
                else{
                    txt3.setLabel(text: cRead)
                    cRead = ""
                    CheckSet = false
                }
            }
        }
    }
    func qProcess(){
        btnEq.setFontBold()
        btnEq.titleLabel!.numberOfLines = 1
        btnEq.titleLabel!.adjustsFontSizeToFitWidth = true
        btnEq.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        btnEq.setTitleColor(UIColor(red: 23/255, green: 0/255, blue: 254/255, alpha: 1.0), for: .normal)
        txt1.lineBreakMode = .byWordWrapping
        txt1.numberOfLines = 0;
        txt3.lineBreakMode = .byWordWrapping
        txt3.numberOfLines = 0;
        var wComplete:Int = 0
        var wnComplete:Int = 0
        let iwidth:Int = Int(self.view.frame.width)
        let sY:Int = Int(txt1.frame.height + 15)
        wComplete = (iwidth - 32) * Position/(listQuestion.count - 1)
        wnComplete = (iwidth - 32) * (listQuestion.count - Position - 1)/(listQuestion.count - 1)
        let sX:Int =  16 + wComplete
        myView = UIView(frame: CGRect(x: 16, y: sY, width: wComplete, height: 7))
        myView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 254/255, alpha: 1.0)
        self.view.addSubview(myView)
        myView1 = UIView(frame: CGRect(x: sX, y: sY, width: wnComplete, height: 7))
        myView1.backgroundColor = UIColor(red: 182/255, green: 151/255, blue: 12/255, alpha: 1.0)
        self.view.addSubview(myView1)
    }
    @objc func showLabel(){
        if(bShowLabel == true){
            bShowLabel = false
            timer.invalidate()
            btnEq.setTitle(sEq, for: .normal)
            
        }
    }
}
