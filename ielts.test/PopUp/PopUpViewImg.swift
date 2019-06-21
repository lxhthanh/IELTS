import UIKit
var sEq = ""
class PopUpViewImg: UIViewController {
    var NameImg = ""
    var listPoint = [String]()
    var width:Int = 0
    var height:Int = 0
    var viewImg:UIView!
    var myview:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickView(_:)))
        tapGesture.delegate = self as? UIGestureRecognizerDelegate
        self.view.addGestureRecognizer(tapGesture)
        showAnimate()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ReadData()
    }
    func ReadData(){
        for data in listQuestion[Position].answers as? [AnyObject] ?? []{
            for data1 in data["acontents"] as? [AnyObject] ?? []{
                for datatexts in data1["texts"] as? [AnyObject] ?? []{
                    NameImg = (datatexts as! String)
                    viewImg = UIView(frame: CGRect(x: 16, y: (mHeight - (Int(getImgHeight(name: NameImg)) - mHeight/5))/2, width: mWidth - 32, height: Int(getImgHeight(name: NameImg)) - mHeight/5))
                    self.view.addSubview(viewImg)
                    width = Int(self.viewImg.frame.width)
                    height = Int(self.viewImg.frame.height)
                    viewImg.assignbackground(img: NameImg)
                }
            }
        }
        for data in listQuestion[Position].qcontents as? [AnyObject] ?? []{
            let type = data["type"] as! Int
            if(type == 130)
            {
                for datatexts in data["texts"] as? [AnyObject] ?? []{
                    listPoint.append((datatexts as! String))
                }
            }
        }
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
    @objc func clickView(_ sender: UIView) {
        removeAnimate()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.viewImg)
        CheckPoint(iPointX: Int(location.x), iPointY: Int(location.y))
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        myview.removeFromSuperview()
    }
    func CheckPoint(iPointX: Int, iPointY: Int){
        for i in 0..<listPoint.count{
            let arr = listPoint[i].components(separatedBy: ":")
            let arr1 = arr[7].components(separatedBy: ",")
            let iX1 = Int(arr1[0])!*width/Int(getImgWidth(name: NameImg))
            let iX2 = Int(arr1[2])!*width/Int(getImgWidth(name: NameImg))
            let iY1 = Int(arr1[1])!*height/Int(getImgHeight(name: NameImg))
            let iY2 = Int(arr1[3])!*height/Int(getImgHeight(name: NameImg))
            if((iX1 <= iPointX && iX2 >= iPointX) &&  (iY1 <= iPointY && iY2 >= iPointY)){
                sEq = arr[5]
                bShowLabel = true
                myview = UIView(frame: CGRect(x: iX1, y: iY1, width: iX2 - iX1, height: iY2 - iY1))
                myview.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 138/255, alpha: 0.8)
                self.viewImg.addSubview(myview)
                break
            }
        }
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
