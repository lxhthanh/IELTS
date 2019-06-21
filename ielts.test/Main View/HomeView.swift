import UIKit
var mWidth = 0
var mHeight = 0
var listResult = [ResultModel]()
class HomeView: UIViewController {

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.setAnimationsEnabled(false)
        mWidth = Int(self.view.frame.width)
        mHeight = Int(self.view.frame.height)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.intent()
        }
        )
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.assignbackground(img:"bg")
        addListResult()
//        for i in 0..<listResult.count{
//            print(listResult[i].sQuestion)
//        }
    }
    func addListResult(){
        for i in 1..<7{
            listResult.append(ResultModel(sQuestion: String(i)+",A", isRightAnswer: false, answerValue: "", rQuestion: false))
            listResult.append(ResultModel(sQuestion: String(i)+",B", isRightAnswer: false, answerValue: "", rQuestion: false))
            listResult.append(ResultModel(sQuestion: String(i)+",C", isRightAnswer: false, answerValue: "", rQuestion: false))
            listResult.append(ResultModel(sQuestion: String(i)+",D", isRightAnswer: false, answerValue: "", rQuestion: false))
            listResult.append(ResultModel(sQuestion: String(i)+",E", isRightAnswer: false, answerValue: "", rQuestion: false))
            listResult.append(ResultModel(sQuestion: String(i)+",F", isRightAnswer: false, answerValue: "", rQuestion: false))
        }
        for i in 7..<14{
            listResult.append(ResultModel(sQuestion: String(i), isRightAnswer: false, answerValue: "", rQuestion: false))
        }
        for i in 14..<18{
            listResult.append(ResultModel(sQuestion: String(i)+",A", isRightAnswer: false, answerValue: "", rQuestion: false))
            listResult.append(ResultModel(sQuestion: String(i)+",B", isRightAnswer: false, answerValue: "", rQuestion: false))
            listResult.append(ResultModel(sQuestion: String(i)+",C", isRightAnswer: false, answerValue: "", rQuestion: false))
            listResult.append(ResultModel(sQuestion: String(i)+",D", isRightAnswer: false, answerValue: "", rQuestion: false))
        }
        for i in 18..<41{
            listResult.append(ResultModel(sQuestion: String(i), isRightAnswer: false, answerValue: "", rQuestion: false))
        }
    }
    func intent()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainView") as! MainView
        self.present(nextViewController, animated:true, completion:nil)
    }
}

