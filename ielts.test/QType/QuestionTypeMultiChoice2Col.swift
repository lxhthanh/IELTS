import UIKit

class QuestionTypeMultiChoice2Col: UIViewController {
    @IBOutlet weak var tQuestion1: UILabel!
    @IBOutlet weak var tQuestion2: UILabel!
    @IBOutlet weak var tQuestion3: UILabel!
    @IBOutlet weak var nQuestion: UILabel!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnD: UIButton!
    @IBOutlet weak var btnE: UIButton!
    @IBOutlet weak var btnF: UIButton!
    var CheckbtnA:Bool = false
    var CheckbtnB:Bool = false
    var CheckbtnC:Bool = false
    var CheckbtnD:Bool = false
    var CheckbtnE:Bool = false
    var CheckbtnF:Bool = false
    var iPos:Int = 1
    var iPosE:Int = 1
    var CheckSet:Bool = false
    var cRead:String = ""
    var myView:UIView!
    var myView1:UIView!
    var CheckResult:Bool = false
    @IBAction func onclickA(_ sender: Any) {
        if(CheckbtnA == true){
            CheckbtnA = false
        }
        else{
            CheckbtnA = true
        }
        setCheck(check: CheckbtnA, btn: btnA, nameImg: "checkA",nameuImg: "uncheckA")
        SaveData(iPos: 1, bData: CheckbtnA)
    }
    @IBAction func onclickB(_ sender: Any) {
        if(CheckbtnB == true){
            CheckbtnB = false
        }
        else{
            CheckbtnB = true
        }
        setCheck(check: CheckbtnB, btn: btnB, nameImg: "checkB",nameuImg: "uncheckB")
        SaveData(iPos: 2, bData: CheckbtnB)
    }
    @IBAction func onclickC(_ sender: Any) {
        if(CheckbtnC == true){
            CheckbtnC = false
        }
        else{
            CheckbtnC = true
        }
        setCheck(check: CheckbtnC, btn: btnC, nameImg: "checkC",nameuImg: "uncheckC")
        SaveData(iPos: 3, bData: CheckbtnC)
    }
    @IBAction func onclickD(_ sender: Any) {
        if(CheckbtnD == true){
            CheckbtnD = false
        }
        else{
            CheckbtnD = true
        }
        setCheck(check: CheckbtnD, btn: btnD, nameImg: "checkD",nameuImg: "uncheckD")
        SaveData(iPos: 4, bData: CheckbtnD)
    }
    @IBAction func onclickE(_ sender: Any) {
        if(CheckbtnE == true){
            CheckbtnE = false
        }
        else{
            CheckbtnE = true
        }
        setCheck(check: CheckbtnE, btn: btnE, nameImg: "checkE",nameuImg: "uncheckE")
        SaveData(iPos: 5, bData: CheckbtnE)
    }
    @IBAction func onclickF(_ sender: Any) {
        if(CheckbtnF == true){
            CheckbtnF = false
        }
        else{
            CheckbtnF = true
        }
        setCheck(check: CheckbtnF, btn: btnF, nameImg: "checkF",nameuImg: "uncheckF")
        SaveData(iPos: 6, bData: CheckbtnF)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        iPosE = 1
        btnA.setImage(UIImage(named: "uncheckA"), for: .normal)
        btnB.setImage(UIImage(named: "uncheckB"), for: .normal)
        btnC.setImage(UIImage(named: "uncheckC"), for: .normal)
        btnD.setImage(UIImage(named: "uncheckD"), for: .normal)
        btnE.setImage(UIImage(named: "uncheckE"), for: .normal)
        btnF.setImage(UIImage(named: "uncheckF"), for: .normal)
        CheckbtnA = false
        CheckbtnB = false
        CheckbtnC = false
        CheckbtnD = false
        CheckbtnE = false
        CheckbtnF = false
        myView.removeFromSuperview()
        myView1.removeFromSuperview()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        qProcess()
        ReadData()
        ReadEq()
    }
    func SaveData(iPos: Int, bData: Bool){
        let arr = listQuestion[Position].qtitle.components(separatedBy: " ")
        for i in 0..<listResult.count{
            let rQuestion = listResult[i].sQuestion.components(separatedBy: ",")
            if(arr[1] == rQuestion[0]){
                if(iPos == 1 && listResult[i].sQuestion.last! == "A")
                {
                    listResult[i].setisRightAnswer(isRightAnswer: bData)
                    print(listResult[i].isRightAnswer)
                    break
                }
                else{
                    if(iPos == 2 && listResult[i].sQuestion.last! == "B")
                    {
                        listResult[i].setisRightAnswer(isRightAnswer: bData)
                        break
                    }else{
                        if(iPos == 3 && listResult[i].sQuestion.last! == "C")
                        {
                            print("c")
                            listResult[i].setisRightAnswer(isRightAnswer: bData)
                            break
                        }
                        else{
                            if(iPos == 4 && listResult[i].sQuestion.last! == "D")
                            {
                                print("d")
                                listResult[i].setisRightAnswer(isRightAnswer: bData)
                                break
                            }
                            else{
                                if(iPos == 5 && listResult[i].sQuestion.last! == "E")
                                {
                                    print("e")
                                    listResult[i].setisRightAnswer(isRightAnswer: bData)
                                    break
                                }
                                else{
                                    if(iPos == 6 && listResult[i].sQuestion.last! == "F")
                                    {
                                        print("f")
                                        listResult[i].setisRightAnswer(isRightAnswer: bData)
                                        break
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    func ReadEq(){
        var CheckStop:Bool = false
        let arr = listQuestion[Position].qtitle.components(separatedBy: " ")
        for i in 0..<listResult.count{
            let rQuestion = listResult[i].sQuestion.components(separatedBy: ",")
            if(arr[1] == rQuestion[0]){
                switch iPosE{
                case 1:
                    CheckbtnA = false
                    setCheck(check: listResult[i].isRightAnswer, btn: btnA, nameImg: "checkA",nameuImg: "uncheckA")
                    iPosE = iPosE + 1
                case 2:
                    CheckbtnB = false
                    setCheck(check: listResult[i].isRightAnswer, btn: btnB, nameImg: "checkB",nameuImg: "uncheckB")
                    iPosE = iPosE + 1
                case 3:
                    CheckbtnC = false
                    setCheck(check: listResult[i].isRightAnswer, btn: btnC, nameImg: "checkC",nameuImg: "uncheckC")
                    iPosE = iPosE + 1
                case 4:
                    CheckbtnD = false
                    setCheck(check: listResult[i].isRightAnswer, btn: btnD, nameImg: "checkD",nameuImg: "uncheckD")
                    iPosE = iPosE + 1
                case 5:
                    CheckbtnE = false
                    setCheck(check: listResult[i].isRightAnswer, btn: btnE, nameImg: "checkE",nameuImg: "uncheckE")
                    iPosE = iPosE + 1
                case 6:
                    CheckbtnF = false
                    setCheck(check: listResult[i].isRightAnswer, btn: btnF, nameImg: "checkF",nameuImg: "uncheckF")
                    iPosE = 1
                    CheckStop = true
                default: break
                }
                if(CheckStop == true){
                    CheckStop = false
                    break
                }
            }
        }
        
    }
    func qProcess(){
        tQuestion1.lineBreakMode = .byWordWrapping
        tQuestion1.numberOfLines = 0;
        tQuestion2.lineBreakMode = .byWordWrapping
        tQuestion2.numberOfLines = 0;
        tQuestion3.lineBreakMode = .byWordWrapping
        tQuestion3.numberOfLines = 0;
        nQuestion.lineBreakMode = .byWordWrapping
        nQuestion.numberOfLines = 0;
        var wComplete:Int = 0
        var wnComplete:Int = 0
        let iwidth:Int = Int(self.view.frame.width)
        let sY:Int = Int(tQuestion1.frame.height + tQuestion2.frame.height + tQuestion3.frame.height + 15)
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
    func ReadData(){
        for data in listQuestion[Position].qcontents as? [AnyObject] ?? []{
            for datatexts in data["texts"] as? [AnyObject] ?? []{
                let type = data["type"] as! Int
                if(type != 30)
                {
                    if(CheckSet == false)
                    {
                        switch iPos{
                        case 1:
                            tQuestion1.setLabel(text: (datatexts as! String))
                            iPos = iPos + 1
                        case 2:
                            tQuestion2.setLabel(text: (datatexts as! String))
                            iPos = iPos + 1
                        case 3:
                            tQuestion3.setLabel(text: (datatexts as! String))
                            iPos = 1
                            CheckSet = true
                        default: break
                        }
                    }
                    else{
                        nQuestion.setLabel(text: (datatexts as! String))
                        CheckSet = false
                    }
                }
            }
            
            
        }
        
    }
    func setCheck(check: Bool, btn: UIButton, nameImg: String, nameuImg: String){
        if(check == false){
            btn.setImage(UIImage(named: nameuImg), for: .normal)
        }
        else{
            btn.setImage(UIImage(named: nameImg), for: .normal)
        }
    }
}
