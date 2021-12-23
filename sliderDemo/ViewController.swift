import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var mixImage: UIImageView!
    
    func ballLocation (degrees: CGFloat){
        ballImage.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi / 180 * degrees).translatedBy(x: 0, y: 145)
        ballImage.alpha = CGFloat(degrees / 360)
    }
    
    let mixImageView = ["001","002","003","004","005"]
    var index = 0
 
    override func viewDidLoad() {
        super.viewDidLoad()
//        ballLocation(degrees: 270)
}

    @IBAction func fusionSlider(_ sender: UISlider) {

          ballLocation(degrees: CGFloat(sender.value))

        leftImage.frame.origin.x = CGFloat(136 + 0.4 * sender.value)
        rightImage.frame.origin.x = CGFloat(526 - 0.4 * sender.value)
        
        leftImage.alpha = CGFloat(360 - sender.value)/360
        rightImage.alpha = CGFloat(360 - sender.value) / 360
        
    }
   
    @IBAction func theLastBtn(_ sender: UIButton) {
        index = (index + mixImageView.count - 1) % mixImageView.count
        let name = mixImageView[index]
        print(index, name)
        mixImage.image = UIImage(named: name)
       
    }
    @IBAction func theNextBtn(_ sender: UIButton) {
        index = (index + 1) % mixImageView.count
        let name = mixImageView[index]
        mixImage.image = UIImage(named: name)
    }
    
}
