import UIKit
var Position = 0
var bCheckShow = false
var bCheck = false
class MainViewQuestion: UIViewController {
    @IBOutlet weak var NameQuestion: UILabel!
    @IBOutlet weak var btnPassage: UIButton!
    @IBOutlet weak var nameEx: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var bnBack: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    var timer = Timer()
    //    Reading(-1),
//    SingleChoice(0),
//    MultiChoice(1),
//    MultiChoiceHorizontal(11),
//    MultiChoice2Col(12),
//    SelectAndPlace(2),
//    PointAndShot(3),
//
//    SingleChoiceCheck(7),
//    SingleChoiceCheckNoneABCD(70),
//    FillInBlank(8),
//    HotArea(9),
//
//    Matching(10),
//    SingleChoiceHorizontal(100),
//
//    TickCross(110),
//
//    FillInBlankRight(121),
//    FillInBlankRights(1212),
//    FillInBlankRightYesNo(122),
//    FillInBlankCenter(123),
//    FillInBlankInline(129),
//    Speaking(140),
//    DrawLine(200),
//    DrawLineAndFill(210),
//    DrawLineChild(220),
//    SingleChoiceImage(230),
//    FillInLineImage(240),
//    DrawLineAndFillZoom(250);

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    func CheckTypeQuestion(iPos: Int){
        switch iPos {
        case 12:
            displayCurrentTab(TabIndex.QuestionTypeMultiChoice2Col.rawValue)
        case 230:
            displayCurrentTab(TabIndex.QuestionTypeFillInLineImage.rawValue)
        case 240:
            displayCurrentTab(TabIndex.QuestionTypeSingleChoiceImage.rawValue)
        case 0:
            displayCurrentTab(TabIndex.QuestionTypeSingleChoice.rawValue)
        default:
            displayCurrentTab(TabIndex.QuestionTypeReading.rawValue)
        }
    }
    @IBAction func btnBack(_ sender: Any) {
        if(Position != 0){
            Position = Position - 1
        }
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        iHiddenBtn()
        CheckTypeQuestion(iPos: listQuestion[Position].qtype)
        NameQuestion.text = listQuestion[Position].qtitle
        btnNext.setTitle("NEXT >", for: .normal)
        bCheck = false
        ShowPop()
        
    }
    
    @IBAction func btnNext(_ sender: Any) {
        print(listResult.count)
        if(Position < listQuestion.count - 1)
        {
            Position = Position + 1
            self.currentViewController!.view.removeFromSuperview()
            self.currentViewController!.removeFromParentViewController()
            iHiddenBtn()
            CheckTypeQuestion(iPos: listQuestion[Position].qtype)
            NameQuestion.text = listQuestion[Position].qtitle
            if(Position == listQuestion.count - 1){
                btnNext.setTitle("FINISH", for: .normal)
            }
            else{
                btnNext.setTitle("NEXT >", for: .normal)
            }
            bCheck = true
            ShowPop()
        }
    }
    @IBAction func onclickPassage(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PassageView") as! PassageView
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        iSize = iSize - 1
    }
    @objc func CheckShow(){
        if(bCheckShow == true){
            bCheckShow = false
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewImg") as! PopUpViewImg
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
        }
    }
    func ShowPop(){
        if(listQuestion[Position].qtype == 240){
            self.timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.CheckShow), userInfo: nil, repeats: true)
        }
        else{
            self.timer.invalidate()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.assignbackground(img:"bg_main")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Design()
        iHiddenBtn()
        nameEx.text = cName
        
        displayCurrentTab(TabIndex.QuestionTypeReading.rawValue)
        NameQuestion.text = listQuestion[Position].qtitle
    }
    func Design(){
        nameEx.setFont(size: 22)
        btnNext.setFont()
        bnBack.setFont()
        btnPassage.setFont()
        NameQuestion.setFont(size: 22)
        NameQuestion.setTextColor()
    }
    func iHiddenBtn(){
        if(Position == 0){
            bnBack.isHidden = true
        }
        else{
            bnBack.isHidden = false
        }
    }
    //View Page//
    enum TabIndex : Int {
        case QuestionTypeReading = 0
        case QuestionTypeMultiChoice2Col = 1
        case QuestionTypeFillInLineImage = 2
        case QuestionTypeSingleChoiceImage = 3
        case QuestionTypeSingleChoice = 4
    }
    var currentViewController: UIViewController?
    lazy var QuestionTypeReading: UIViewController? = {
        let QuestionTypeReading = self.storyboard?.instantiateViewController(withIdentifier: "QuestionTypeReading")
        return QuestionTypeReading
    }()
    lazy var QuestionTypeMultiChoice2Col: UIViewController? = {
        let QuestionTypeMultiChoice2Col = self.storyboard?.instantiateViewController(withIdentifier: "QuestionTypeMultiChoice2Col")
        return QuestionTypeMultiChoice2Col
    }()
    lazy var QuestionTypeFillInLineImage: UIViewController? = {
        let QuestionTypeFillInLineImage = self.storyboard?.instantiateViewController(withIdentifier: "QuestionTypeFillInLineImage")
        return QuestionTypeFillInLineImage
    }()
    lazy var QuestionTypeSingleChoiceImage: UIViewController? = {
        let QuestionTypeSingleChoiceImage = self.storyboard?.instantiateViewController(withIdentifier: "QuestionTypeSingleChoiceImage")
        return QuestionTypeSingleChoiceImage
    }()
    lazy var QuestionTypeSingleChoice: UIViewController? = {
        let QuestionTypeSingleChoice = self.storyboard?.instantiateViewController(withIdentifier: "QuestionTypeSingleChoice")
        return QuestionTypeSingleChoice
    }()
    func displayCurrentTab(_ tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            vc.view.frame = self.viewContainer.bounds
            self.viewContainer.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.QuestionTypeReading.rawValue :
            vc = QuestionTypeReading
        case TabIndex.QuestionTypeMultiChoice2Col.rawValue :
            vc = QuestionTypeMultiChoice2Col
        case TabIndex.QuestionTypeFillInLineImage.rawValue :
            vc = QuestionTypeFillInLineImage
        case TabIndex.QuestionTypeSingleChoiceImage.rawValue :
            vc = QuestionTypeSingleChoiceImage
        case TabIndex.QuestionTypeSingleChoice.rawValue :
            vc = QuestionTypeSingleChoice
        default:
            return nil
        }
        
        return vc
    }
    //
}
