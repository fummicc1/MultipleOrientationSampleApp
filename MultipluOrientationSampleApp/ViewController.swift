import UIKit

class ViewController: UIViewController {

    var circleView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        circleView = UIView(frame: CGRect.zero) // (0, 0, 0, 0)
        circleView?.center = view.center
        circleView?.frame.size = CGSize(width: 160, height: 160)        
        circleView?.layer.cornerRadius = 80
        circleView?.layer.masksToBounds = true
        circleView?.backgroundColor = .red
        guard let circleView = circleView else { return }
        view.addSubview(circleView)
    }

}

