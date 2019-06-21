import UIKit

class QuestionTypeFillInLineImage: UIViewController {
    @IBOutlet weak var tQuestion: UILabel!
    var TextField1: UITextField!
    var TextField2: UITextField!
    var TextField3: UITextField!
    var TextField4: UITextField!
    var NameImg:String = ""
    var listPoint = [String]()
    var myView:UIView!
    var myView1:UIView!
    var nQuestion:UIView!
    var iHeight:Int = 0
    var cRead:String = ""
    var CheckQuestion:Int = 0
    var ReadQuestion:Int = 0
    var currentPos:Int = 0
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        sData()
    }
    func sData(){
        switch listPoint.count {
        case 1:
            SaveData(iPosData: 1, sData: TextField1.text!)
            TextField1.text = ""
        case 2:
            SaveData(iPosData: 1,sData: TextField1.text!)
            SaveData(iPosData: 2,sData: TextField2.text!)
            TextField1.text = ""
            TextField2.text = ""
        case 3:
            SaveData(iPosData: 1,sData: TextField1.text!)
            SaveData(iPosData: 2,sData: TextField2.text!)
            SaveData(iPosData: 3,sData: TextField3.text!)
            TextField1.text = ""
            TextField2.text = ""
            TextField3.text = ""
        case 4:
            SaveData(iPosData: 1,sData: TextField1.text!)
            SaveData(iPosData: 2,sData: TextField2.text!)
            SaveData(iPosData: 3,sData: TextField3.text!)
            SaveData(iPosData: 4,sData: TextField4.text!)
            TextField1.text = ""
            TextField2.text = ""
            TextField3.text = ""
        default:
            break
        }
        currentPos = 0
        listPoint.removeAll()
        myView1.removeFromSuperview()
        myView.removeFromSuperview()
        nQuestion.removeFromSuperview()
    }
    func SaveData(iPosData: Int,sData: String){
        var iQuestion: String = ""
        var fQuestion: String = ""
        let arr = listQuestion[currentPos].qtitle.components(separatedBy: " ")
        let arr1 = arr[1].components(separatedBy: "-")
        if(arr1.count == 1){
            iQuestion = arr1[0]
        }
        else{
            fQuestion = arr1[0]
            iQuestion = arr1[1]
        }
        for i in 0..<listResult.count{
            let rQuestion = listResult[i].sQuestion.components(separatedBy: ",")
            if(arr1.count == 2){
            if (Int(fQuestion)! <= Int(rQuestion[0])! && Int(rQuestion[0])! <= Int(iQuestion)! && CheckQuestion != i){
                switch iPosData{
                    case 1:
                        listResult[i].setanswerValue(answerValue: sData)
                        CheckQuestion = i
                    case 2:
                        CheckQuestion = CheckQuestion + 1
                        listResult[CheckQuestion].setanswerValue(answerValue: sData)
                    case 3:
                        CheckQuestion = CheckQuestion + 1
                        listResult[CheckQuestion].setanswerValue(answerValue: sData)
                    case 4:
                        CheckQuestion = CheckQuestion + 1
                        listResult[CheckQuestion].setanswerValue(answerValue: sData)
                    default: break
            }
                break
          }
        }
            else
            {
                if(iQuestion == rQuestion[0]){
                    listResult[i].setanswerValue(answerValue: sData)
                    break
                }
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        iHeight = Int(self.view.frame.height)
        qProcess()
        ReadData()
        DTextField()
        ReadEq()
    }
    func ReadEq(){
        var CheckStop:Bool = false
        var iPosE:Int = 1
        var iQuestion: String = ""
        var fQuestion: String = ""
        let arr = listQuestion[Position].qtitle.components(separatedBy: " ")
        let arr1 = arr[1].components(separatedBy: "-")
        if(arr1.count == 1){
            iQuestion = arr1[0]
        }
        else{
            fQuestion = arr1[0]
            iQuestion = arr1[1]
        }
        for i in 0..<listResult.count{
            let rQuestion = listResult[i].sQuestion.components(separatedBy: ",")
            if(arr1.count == 2){
                if (Int(fQuestion)! <= Int(rQuestion[0])! && Int(rQuestion[0])! <= Int(iQuestion)! && ReadQuestion != i){
                    switch iPosE{
                        case 1:
                            print("a")
                            print(i)
                            TextField1.text = listResult[i].answerValue
                            ReadQuestion = i
                            iPosE = iPosE + 1
                        case 2:
                            print("b")
                            ReadQuestion = ReadQuestion + 1
                            print(ReadQuestion)
                            TextField2.text = listResult[ReadQuestion].answerValue
                            iPosE = iPosE + 1
                        case 3:
                            print("c")
                            ReadQuestion = ReadQuestion + 1
                            print(ReadQuestion)
                            TextField3.text = listResult[ReadQuestion].answerValue
                            iPosE = iPosE + 1
                        case 4:
                            print("d")
                            ReadQuestion = ReadQuestion + 1
                            print(ReadQuestion)
                            TextField4.text = listResult[ReadQuestion].answerValue
                            CheckStop = true
                            iPosE =  1
                        default: break
                    }
                    if(CheckStop == true){
                        CheckStop = false
                        break
                    }
                }
            }
            else
            {
                if(iQuestion == rQuestion[0]){
                    TextField1.text = listResult[i].answerValue
                    break
                }
            }
        }
    }
    func ReadData(){
        currentPos = Position
        for data in listQuestion[Position].qcontents as? [AnyObject] ?? []{
            let type = data["type"] as! Int
            switch type{
            case 9:
                for datatexts in data["texts"] as? [AnyObject] ?? []{
                    var text:String = ""
                    text = (datatexts as! String)
                    cRead = cRead  + text + "<br/>"
                }
            case 10:
                for datatexts in data["texts"] as? [AnyObject] ?? []{
                    NameImg = (datatexts as! String)
                    if(Int(getImgHeight(name: NameImg)) > iHeight/20*16){
                        nQuestion = UIView(frame: CGRect(x: 16, y: mHeight/20*3, width: mWidth-32, height: iHeight/20*17))
                    }
                    else{
                        nQuestion = UIView(frame: CGRect(x: 16, y: mHeight/20*3, width: mWidth-32, height: Int(getImgHeight(name: NameImg))))
                    }
                    
                    self.view.addSubview(nQuestion)
                    nQuestion.assignbackground(img: (datatexts as! String))
                  //  print((datatexts as! String))
                }
            case 100:
                for datatexts in data["texts"] as? [AnyObject] ?? []{
                    listPoint.append((datatexts as! String))
                }
            default:
                break
            }
        }
        tQuestion.setLabel(text: cRead)
        cRead = ""
    }
    func qProcess(){
        tQuestion.lineBreakMode = .byWordWrapping
        tQuestion.numberOfLines = 0;
        var wComplete:Int = 0
        var wnComplete:Int = 0
        let iwidth:Int = Int(self.view.frame.width)
        let sY:Int = Int(tQuestion.frame.height + 15)
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
    //setTextField//
    func DTextField(){
        var arr1 = [String]()
        let toolbar  = UIToolbar()
        toolbar.sizeToFit()
        let btnDone = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClick))
        toolbar.setItems([btnDone], animated: true)
        for i in 0..<listPoint.count{
            let arr = listPoint[i].components(separatedBy: ":")
            if(arr.count == 8){
                 arr1 = arr[5].components(separatedBy: ",")
            }
            else{
                 arr1 = arr[7].components(separatedBy: ",")
            }
            switch i{
            case 0:
                setTextField1(iPointX1: Int(arr1[0])!,iPointY1: Int(arr1[1])!, iPointX2: Int(arr1[2])!, iPointY2: Int(arr1[3])!, nameImg: NameImg)
                TextField1.inputAccessoryView = toolbar
                TextField1.setFont()
            case 1:

                setTextField2(iPointX1: Int(arr1[0])!,iPointY1: Int(arr1[1])!, iPointX2: Int(arr1[2])!, iPointY2: Int(arr1[3])!, nameImg: NameImg)
                TextField2.inputAccessoryView = toolbar
                TextField2.setFont()
            case 2:
                
                setTextField3(iPointX1: Int(arr1[0])!,iPointY1: Int(arr1[1])!, iPointX2: Int(arr1[2])!, iPointY2: Int(arr1[3])!, nameImg: NameImg)
                TextField3.inputAccessoryView = toolbar
                TextField3.setFont()
            case 3:
                
                setTextField4(iPointX1: Int(arr1[0])!,iPointY1: Int(arr1[1])!, iPointX2: Int(arr1[2])!, iPointY2: Int(arr1[3])!, nameImg: NameImg)
                TextField4.inputAccessoryView = toolbar
                TextField4.setFont()
            default:
                break
            }
        }
    }

    @objc func doneClick()
    {
        view.endEditing(false)
    }
    func setTextField1(iPointX1: Int,iPointY1: Int,iPointX2: Int,iPointY2: Int,nameImg: String){
        var iWidth:Int = 0
        var iHeight:Int = 0
        var iWidthView:Int = 0
        var iHeightView:Int = 0
        var iX:Int = 0
        var iY:Int = 0
        iWidthView = Int(self.nQuestion.frame.width)
        iHeightView = Int(self.nQuestion.frame.height)
        iX = iPointX1*iWidthView/Int(getImgWidth(name: nameImg))
        iY = iPointY1*iHeightView/Int(getImgHeight(name: nameImg))
        let iX2 = iPointX2*iWidthView/Int(getImgWidth(name: nameImg))
        let iY2 = iPointY2*iHeightView/Int(getImgHeight(name: nameImg))
        iWidth = iX2 - iX
        iHeight = iY2 - iY
        TextField1 = UITextField()
        TextField1 =  UITextField(frame: CGRect(x: iX, y: iY - 5, width: iWidth, height: iHeight))
        TextField1.font = UIFont.systemFont(ofSize: 15)
        TextField1.textColor = .blue
        TextField1.borderStyle = UITextBorderStyle.none
        TextField1.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        TextField1.delegate = self as? UITextFieldDelegate
        nQuestion.addSubview(TextField1)
    }
    func setTextField2(iPointX1: Int,iPointY1: Int,iPointX2: Int,iPointY2: Int,nameImg: String){
        var iWidth:Int = 0
        var iHeight:Int = 0
        var iWidthView:Int = 0
        var iHeightView:Int = 0
        var iX:Int = 0
        var iY:Int = 0
        iWidthView = Int(self.nQuestion.frame.width)
        iHeightView = Int(self.nQuestion.frame.height)
        iX = iPointX1*iWidthView/Int(getImgWidth(name: nameImg))
        iY = iPointY1*iHeightView/Int(getImgHeight(name: nameImg))
        let iX2 = iPointX2*iWidthView/Int(getImgWidth(name: nameImg))
        let iY2 = iPointY2*iHeightView/Int(getImgHeight(name: nameImg))
        iWidth = iX2 - iX
        iHeight = iY2 - iY
        TextField2 = UITextField()
        TextField2 =  UITextField(frame: CGRect(x: iX, y: iY - 5, width: iWidth, height: iHeight))
        TextField2.font = UIFont.systemFont(ofSize: 15)
        TextField2.textColor = .blue
        TextField2.borderStyle = UITextBorderStyle.none
        TextField2.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        TextField2.delegate = self as? UITextFieldDelegate
        nQuestion.addSubview(TextField2)
    }
    func setTextField3(iPointX1: Int,iPointY1: Int,iPointX2: Int,iPointY2: Int,nameImg: String){
        var iWidth:Int = 0
        var iHeight:Int = 0
        var iWidthView:Int = 0
        var iHeightView:Int = 0
        var iX:Int = 0
        var iY:Int = 0
        iWidthView = Int(self.nQuestion.frame.width)
        iHeightView = Int(self.nQuestion.frame.height)
        iX = iPointX1*iWidthView/Int(getImgWidth(name: nameImg))
        iY = iPointY1*iHeightView/Int(getImgHeight(name: nameImg))
        let iX2 = iPointX2*iWidthView/Int(getImgWidth(name: nameImg))
        let iY2 = iPointY2*iHeightView/Int(getImgHeight(name: nameImg))
        iWidth = iX2 - iX
        iHeight = iY2 - iY
        TextField3 = UITextField()
        TextField3 = UITextField(frame: CGRect(x: iX, y: iY - 5, width: iWidth, height: iHeight))
        TextField3.font = UIFont.systemFont(ofSize: 15)
        TextField3.textColor = .blue
        TextField3.borderStyle = UITextBorderStyle.none
        TextField3.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        TextField3.delegate = self as? UITextFieldDelegate
        nQuestion.addSubview(TextField3)
    }
    func setTextField4(iPointX1: Int,iPointY1: Int,iPointX2: Int,iPointY2: Int,nameImg: String){
        var iWidth:Int = 0
        var iHeight:Int = 0
        var iWidthView:Int = 0
        var iHeightView:Int = 0
        var iX:Int = 0
        var iY:Int = 0
        iWidthView = Int(self.nQuestion.frame.width)
        iHeightView = Int(self.nQuestion.frame.height)
        iX = iPointX1*iWidthView/Int(getImgWidth(name: nameImg))
        iY = iPointY1*iHeightView/Int(getImgHeight(name: nameImg))
        let iX2 = iPointX2*iWidthView/Int(getImgWidth(name: nameImg))
        let iY2 = iPointY2*iHeightView/Int(getImgHeight(name: nameImg))
        iWidth = iX2 - iX
        iHeight = iY2 - iY
        TextField4 = UITextField()
        TextField4 =  UITextField(frame: CGRect(x: iX, y: iY - 5, width: iWidth, height: iHeight))
        TextField4.font = UIFont.systemFont(ofSize: 15)
        TextField4.textColor = .blue
        TextField4.borderStyle = UITextBorderStyle.none
        TextField4.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        TextField4.delegate = self as? UITextFieldDelegate
        nQuestion.addSubview(TextField4)
    }
    func getImgHeight(name: String) -> CGFloat{
        let imageView: UIImage = UIImage(named: name)!
        let imageViewHeight: CGFloat = imageView.size.height
        return imageViewHeight
    }
    func getImgWidth(name: String) -> CGFloat{
        let imageView: UIImage = UIImage(named: name)!
        let imageViewWidth: CGFloat = imageView.size.width
        return imageViewWidth
    }
}
