import Foundation
import UIKit
import Atributika
var listQuestion = [QuestionModel]()
var rlistQuestion = [rQuestionModel]()
var listExplanation = [ExplanationModel]()
class ReadDataJson: NSObject {
    
    static func instance() ->  ReadDataJson{
        return ReadDataJson()
    }
    func readLocalJsonFile(NameJson: String){
        if let urlPath = Bundle.main.url(forResource: NameJson, withExtension: "json") {
            
            do {
                let jsonData = try Data(contentsOf: urlPath, options: .mappedIfSafe)
                
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? Dictionary<String, AnyObject> {
                    for data in json["variants"] as? [AnyObject] ?? [] {
                        for data1 in data["questions"] as? [AnyObject] ?? [] {
                            rlistQuestion.append(rQuestionModel(answers: data1["answers"]as AnyObject))
                            listExplanation.append(ExplanationModel(explanation: data1["explanation"]as AnyObject))
                            if(data1["qtype"] as! Int == -1){
                                listQuestion.append(QuestionModel(qtype: data1["qtype"] as! Int, qtitle: data1["qtitle"] as! String, qcontents: data1["qcontents"] as AnyObject, explanation: data1["explanation"]as AnyObject, answers: data1["answers"]as AnyObject))
                            }
                            else{
                                if(data1["qtitle"] as! String != "")
                                {
                                    listQuestion.append(QuestionModel(qtype: data1["qtype"] as! Int, qtitle: data1["qtitle"] as! String, qcontents: data1["qcontents"] as AnyObject, explanation: data1["explanation"]as AnyObject, answers: data1["answers"]as AnyObject))
                                }
                            }
                        }
                    }
                }
            }
                
            catch let jsonError {
                print(jsonError)
            }
        }
    }
    func readNameJsonFile(NameJson: String) -> String {
        var cName:String = ""
        if let urlPath = Bundle.main.url(forResource: NameJson, withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: urlPath, options: .mappedIfSafe)
               // print(jsonData)
//                let str = String.init(data: jsonData, encoding: .utf8)
//                print(str.index(of: "play"))
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? Dictionary<String, Any> {
                   cName = json["title"] as! String
                }
            }

            catch let jsonError {
                print(jsonError)
            }
        }
        return cName
    }
}
extension UIButton{
    func DesignBtn(){
        self.layer.borderWidth = 1/UIScreen.main.nativeScale
        self.layer.borderColor = UIColor.black.cgColor
    }
    func setFont(){
        self.titleLabel?.font =  UIFont(name: "MyriadPro-Cond", size: 22.0)!
    }
    func setFontBold(){
        self.titleLabel?.font =  UIFont(name: "MyriadPro-BoldCond", size: 22.0)!
    }
}
extension UIView{
    func assignbackground(img:String){
        let imageView = UIImageView(image: UIImage(named: img)!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        self.insertSubview(imageView, at: 0)
    }
    func setBgColor(){
        self.backgroundColor = UIColor(red: 144/255, green: 0/255, blue: 11/255, alpha: 1.0)
    }
}
extension UITextField{
    func setFont(){
        self.font = UIFont(name: "MyriadPro-BoldCond", size: 19.0)!
        self.textAlignment = .center
        self.textColor = UIColor(red: 23/255, green: 0/255, blue: 254/255, alpha: 1.0)
    }
}
extension UILabel{
    func setLabel(text: String){
        let font = UIFont(name: "MyriadPro-Cond", size: 19.0)!
        let all = Style.font(font)
        let b = Style("b").font(UIFont(name: "MyriadPro-BoldCond", size: 19.0)!)
        self.attributedText = text.style(tags: b).styleAll(all).attributedString
        self.textAlignment = .justified
    }
    func setReadLabel(text: String,size: Int){
        let font = UIFont(name: "MyriadPro-Cond", size: CGFloat(size))!
        let all = Style.font(font)
        let b = Style("b").font(UIFont(name: "MyriadPro-BoldCond", size: 19.0)!)
        self.attributedText = text.style(tags: b).styleAll(all).attributedString
        self.textAlignment = .justified
        //self.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    }
    func setTextColor(){
        self.textColor = UIColor(red: 23/255, green: 0/255, blue: 254/255, alpha: 1.0)
    }
    func setTextColorResult(size: Int){
        self.font = UIFont(name: "MyriadPro-Cond", size: CGFloat(size))!
        self.textColor = UIColor(red: 144/255, green: 0/255, blue: 11/255, alpha: 1.0)
    }
    func setFont(size: Int){
        self.font = UIFont(name: "MyriadPro-Cond", size: CGFloat(size))!
    }
    func setFontBold(){
        self.font = UIFont(name: "MyriadPro-BoldCond", size: 28.0)!
    }

}
