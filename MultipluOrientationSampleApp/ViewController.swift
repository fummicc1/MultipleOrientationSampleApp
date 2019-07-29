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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        circleView?.center = view.center
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (coordinator) in
            if size.width > size.height {
                // 横向きなら
                self.circleView?.center.x = self.view.center.x + 100
            } else {
                // 縦向きなら
                self.circleView?.center = self.view.center
            }
        }, completion: nil)
    }
    
}

