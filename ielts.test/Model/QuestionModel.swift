import Foundation
class QuestionModel {
    var qtype: Int = 0
    var qtitle: String = ""
    var qcontents: AnyObject
    var explanation: AnyObject
    var answers: AnyObject
    
    init(qtype: Int, qtitle: String,qcontents: AnyObject,explanation: AnyObject,answers: AnyObject){
        self.qtype = qtype
        self.qtitle = qtitle
        self.qcontents = qcontents
        self.explanation = explanation
        self.answers = answers
    }
}
