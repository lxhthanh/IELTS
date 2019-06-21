import UIKit

class ResultView: UIViewController {

    @IBAction func onclickCheck(_ sender: Any) {
    }
    @IBAction func onclickOther(_ sender: Any) {
    }
    @IBOutlet weak var tvOtherTest: UIButton!
    @IBOutlet weak var tvCheckResult: UIButton!
    @IBOutlet weak var tvrEmoji: UILabel!
    @IBOutlet weak var tvEmoji: UILabel!
    @IBOutlet weak var tvr3D: UILabel!
    @IBOutlet weak var tv3DPrinting: UILabel!
    @IBOutlet weak var tvrThailand: UILabel!
    @IBOutlet weak var tvThailand: UILabel!
    @IBOutlet weak var tvEqScores: UILabel!
    @IBOutlet weak var tvBrandScores: UILabel!
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var tvYourProgress: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
            Design()
    }
    func Design(){
        tvYourProgress.setTextColor()
        tvYourProgress.setFont(size: 19)
        tvBrandScores.setTextColorResult(size: 19)
        tvThailand.setTextColorResult(size: 19)
        tv3DPrinting.setTextColorResult(size: 19)
        tvEmoji.setTextColorResult(size: 19)
        tvrThailand.setTextColorResult(size: 17)
        tvr3D.setTextColorResult(size: 17)
        tvrEmoji.setTextColorResult(size: 17)
        tvEqScores.setFontBold()
        tvOtherTest.setFont()
        tvCheckResult.setFont()
        v1.setBgColor()
    }
}
