import UIKit

class QuestionTypeSingleChoice: UIViewController {

    @IBOutlet weak var btnD: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var qD: UILabel!
    @IBOutlet weak var qC: UILabel!
    @IBOutlet weak var qB: UILabel!
    @IBOutlet weak var qA: UILabel!
    @IBOutlet weak var nQuestion: UILabel!
    @IBOutlet weak var tQuestion: UILabel!
    var myView:UIView!
    var myView1:UIView!
    var CheckbtnA:Bool = false
    var CheckbtnB:Bool = false
    var CheckbtnC:Bool = false
    var CheckbtnD:Bool = false
    @IBAction func onclickA(_ sender: Any) {
        CheckbtnA = true
        setCheck(btn: btnA, iPos: 1)
    }
    @IBAction func onclickB(_ sender: Any) {
        CheckbtnB = true
        setCheck(btn: btnB, iPos: 2)
    }
    @IBAction func onclickC(_ sender: Any) {
        CheckbtnC = true
        setCheck(btn: btnC, iPos: 3)
    }
    @IBAction func onclickD(_ sender: Any) {
        CheckbtnD = true
        setCheck(btn: btnD, iPos: 4)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        qProcess()
        ReadData()
        ReadEq()
    }
    func ReadEq(){
        print("xxxxxxxxxxxxxxxxx")
        var iPosE:Int = 1
        let arr = listQuestion[Position].qtitle.components(separatedBy: " ")
        for i in 0..<listResult.count{
            let rQuestion = listResult[i].sQuestion.components(separatedBy: ",")
            if(arr[1] == rQuestion[0]){
                print(listResult[i].isRightAnswer)
                switch iPosE{
                case 1:
                    CheckSetImg(bCheck: listResult[i].isRightAnswer,bBtn: btnA)
                    CheckbtnA = listResult[i].isRightAnswer
                    iPosE = iPosE + 1
                case 2:
                    CheckSetImg(bCheck: listResult[i].isRightAnswer,bBtn: btnB)
                    CheckbtnB = listResult[i].isRightAnswer
                    iPosE = iPosE + 1
                case 3:
                    CheckSetImg(bCheck: listResult[i].isRightAnswer,bBtn: btnC)
                    CheckbtnC = listResult[i].isRightAnswer
                    iPosE = iPosE + 1
                case 4:
                    CheckSetImg(bCheck: listResult[i].isRightAnswer,bBtn: btnD)
                    CheckbtnD = listResult[i].isRightAnswer
                    iPosE = 1
                default: break
                }
            }
        }
        
    }
    func CheckSetImg(bCheck: Bool,bBtn: UIButton){
        if(bCheck == false){
            bBtn.setImage(UIImage(named: "runcheck"), for: .normal)
        }
        else{
            bBtn.setImage(UIImage(named: "rcheck"), for: .normal)
        }
    }
    func setupLabel(label:UILabel){
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0;
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(CheckbtnA)
        print(CheckbtnB)
        print(CheckbtnC)
        print(CheckbtnD)
        sData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(CheckbtnA)
        print(CheckbtnB)
        print(CheckbtnC)
        print(CheckbtnD)
        sData()
    }
    func sData(){
        btnA.setImage(UIImage(named: "runcheck"), for: .normal)
        btnB.setImage(UIImage(named: "runcheck"), for: .normal)
        btnC.setImage(UIImage(named: "runcheck"), for: .normal)
        btnD.setImage(UIImage(named: "runcheck"), for: .normal)
        CheckbtnA = false
        CheckbtnB = false
        CheckbtnC = false
        CheckbtnD = false
        myView.removeFromSuperview()
        myView1.removeFromSuperview()
    }
    func ReadData(){
        var iPos:Int = 1
        var iPos1:Int = 1
        for data in listQuestion[Position].qcontents as? [AnyObject] ?? []{
            let type = data["type"] as! Int
            if(type == 9){
                for datatexts in data["texts"] as? [AnyObject] ?? []{
                    switch iPos{
                    case 1:
                        tQuestion.setLabel(text: (datatexts as! String))
                        iPos = iPos + 1
                    case 2:
                        nQuestion.setLabel(text: (datatexts as! String))
                        iPos = 1
                    default:
                        break
                    }
                }
            }
        }
        for data in listQuestion[Position].answers as? [AnyObject] ?? []{
                for data2 in data["acontents"] as? [AnyObject] ?? []{
                    for datatexts in data2["texts"] as? [AnyObject] ?? []{
                        switch iPos1{
                        case 1:
                            qA.setLabel(text: "<b>A.</b>" + (datatexts as! String))
                            iPos1 = iPos1 + 1
                        case 2:
                            qB.setLabel(text: "<b>B.</b>" + (datatexts as! String))
                            iPos1 = iPos1 + 1
                        case 3:
                            qC.setLabel(text: "<b>C.</b>" + (datatexts as! String))
                            iPos1 = iPos1 + 1
                        case 4:
                            qD.setLabel(text: "<b>D.</b>" + (datatexts as! String))
                            iPos1 = 1
                        default:
                            break
                        }
                    }
                }
        }
    }
    func qProcess(){
        setupLabel(label:nQuestion)
        setupLabel(label:tQuestion)
        setupLabel(label:qA)
        setupLabel(label:qB)
        setupLabel(label:qC)
        setupLabel(label:qD)
        var wComplete:Int = 0
        var wnComplete:Int = 0
        let iwidth:Int = Int(self.view.frame.width)
        let sY:Int = Int(tQuestion.frame.height + 30)
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
    func setCheck(btn: UIButton,iPos:Int){
        switch iPos {
        case 1:
            CheckbtnA = true
            SaveData(iPos: iPos, bData: CheckbtnA)
            if CheckbtnB == true
            {
                btnB.setImage(UIImage(named: "runcheck"), for: .normal)
                CheckbtnB = false
                SaveData(iPos: 2, bData: CheckbtnB)
            }
            else
            {
                if CheckbtnC == true
                {
                    btnC.setImage(UIImage(named: "runcheck"), for: .normal)
                    CheckbtnC = false
                    SaveData(iPos: 3, bData: CheckbtnC)
                }
                else
                {
                    if CheckbtnD == true
                    {
                        btnD.setImage(UIImage(named: "runcheck"), for: .normal)
                        CheckbtnD = false
                        SaveData(iPos: 4, bData: CheckbtnD)
                    }
                    else
                    {
                        
                    }
                }
            }
        case 2:
            CheckbtnB = true
            SaveData(iPos: iPos, bData: CheckbtnB)
            if CheckbtnA == true
            {
                btnA.setImage(UIImage(named: "runcheck"), for: .normal)
                CheckbtnA = false
                SaveData(iPos: 1, bData: CheckbtnA)
            }
            else
            {
                if CheckbtnC == true
                {
                    btnC.setImage(UIImage(named: "runcheck"), for: .normal)
                    CheckbtnC = false
                    SaveData(iPos: 3, bData: CheckbtnC)
                }
                else
                {
                    if CheckbtnD == true
                    {
                        btnD.setImage(UIImage(named: "runcheck"), for: .normal)
                        CheckbtnD = false
                        SaveData(iPos: 4, bData: CheckbtnD)
                    }
                    else
                    {
                        
                    }
                }
            }
        case 3:
            CheckbtnC = true
            SaveData(iPos: iPos, bData: CheckbtnC)
            if CheckbtnA == true
            {
                btnA.setImage(UIImage(named: "runcheck"), for: .normal)
                CheckbtnA = false
                SaveData(iPos: 1, bData: CheckbtnA)
            }
            else
            {
                if CheckbtnB == true
                {
                    btnB.setImage(UIImage(named: "runcheck"), for: .normal)
                    CheckbtnB = false
                    SaveData(iPos: 2, bData: CheckbtnB)
                }
                else
                {
                    if CheckbtnD == true
                    {
                        btnD.setImage(UIImage(named: "runcheck"), for: .normal)
                        CheckbtnD = false
                        SaveData(iPos: 4, bData: CheckbtnD)
                    }
                    else
                    {
                        
                    }
                }
            }
        case 4:
            CheckbtnD = true
            SaveData(iPos: iPos, bData: CheckbtnD)
            if CheckbtnA == true
            {
                btnA.setImage(UIImage(named: "runcheck"), for: .normal)
                CheckbtnA = false
                SaveData(iPos: 1, bData: CheckbtnA)
            }
            else
            {
                if CheckbtnB == true
                {
                    btnB.setImage(UIImage(named: "runcheck"), for: .normal)
                    CheckbtnB = false
                    SaveData(iPos: 2, bData: CheckbtnB)
                }
                else
                {
                    if CheckbtnC == true
                    {
                        btnC.setImage(UIImage(named: "runcheck"), for: .normal)
                        CheckbtnC = false
                        SaveData(iPos: 3, bData: CheckbtnC)
                    }
                }
            }
        default:
            break
        }
        btn.setImage(UIImage(named: "rcheck"), for: .normal)
    }
    func SaveData(iPos: Int, bData: Bool){
        let arr = listQuestion[Position].qtitle.components(separatedBy: " ")
        for i in 0..<listResult.count{
            let rQuestion = listResult[i].sQuestion.components(separatedBy: ",")
            if(arr[1] == rQuestion[0]){
                if(iPos == 1 && listResult[i].sQuestion.last! == "A")
                {
                    listResult[i].setisRightAnswer(isRightAnswer: bData)
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
                            listResult[i].setisRightAnswer(isRightAnswer: bData)
                            break
                        }
                        else{
                            if(iPos == 4 && listResult[i].sQuestion.last! == "D")
                            {
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
