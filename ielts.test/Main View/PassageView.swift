import UIKit

class PassageView: UIViewController {

    @IBOutlet weak var tvClose: UIButton!
    @IBOutlet weak var popview: UIView!
    @IBOutlet weak var viewpage: UIView!
    @IBOutlet weak var tvName: UILabel!
    @IBAction func onclickClose(_ sender: Any) {
        removeAnimate()
        iSize = iSize + 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        showAnimate()
        setUpPop()
        tvName.text = cName
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tvName.text = cName
        displayCurrentTab(TabIndex.QuestionTypeReading.rawValue)
    }
    func CheckTypeQuestion(iPos: Int){
        switch iPos {
        case -1:
            displayCurrentTab(TabIndex.QuestionTypeReading.rawValue)
        default:
            break
        }
    }
    //View Page//
    enum TabIndex : Int {
        case QuestionTypeReading = 0
    }
    var currentViewController: UIViewController?
    lazy var QuestionTypeReading: UIViewController? = {
        let QuestionTypeReading = self.storyboard?.instantiateViewController(withIdentifier: "QuestionTypeReading")
        return QuestionTypeReading
    }()
    func displayCurrentTab(_ tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            vc.view.frame = self.viewpage.bounds
            self.viewpage.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.QuestionTypeReading.rawValue :
            vc = QuestionTypeReading
        default:
            return nil
        }
        
        return vc
    }
    //
    
    //Set Popup View//
    func setUpPop(){
        tvName.setTextColor()
        tvName.setFont(size: 22)
        popview.frame = CGRect(x: 16, y: 32, width: mWidth-32, height: mHeight-64 )
        popview.assignbackground(img: "bg_passage")
        let width = self.popview.frame.width
        let height = self.popview.frame.height
        tvClose.frame = CGRect(x: width-50, y: 0, width: 45, height: 45 )
        viewpage.frame = CGRect(x: 16, y: height/3*2, width: width, height: height/3*2)
        tvName.frame = CGRect(x: 16, y: height/11*3, width: width, height: height/13 )
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
}
