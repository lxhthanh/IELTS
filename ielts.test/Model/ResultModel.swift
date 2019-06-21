import Foundation
class ResultModel {
    var sQuestion:String = ""
    var isRightAnswer: Bool = false
    var answerValue: String = ""
    var rQuestion: Bool = false
    
    init(sQuestion: String,isRightAnswer: Bool, answerValue: String,rQuestion: Bool){
        self.sQuestion = sQuestion
        self.isRightAnswer = isRightAnswer
        self.answerValue = answerValue
        self.rQuestion = rQuestion
    }
    func setisRightAnswer(isRightAnswer: Bool) {
        self.isRightAnswer = isRightAnswer
    }
    func setrQuestion(rQuestion: Bool) {
        self.rQuestion = rQuestion
    }
    func setanswerValue(answerValue: String) {
        self.answerValue = answerValue
    }
}
