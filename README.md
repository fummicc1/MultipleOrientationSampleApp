# MultipleOrientationSampleApp

## viewDidLoadでframeをCenterに設定しても、レイアウトが確定していないので期待したレイアウトとならない。

### ソースコード
```swift
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
```

### デモ
![demo](https://media.giphy.com/media/XfW5dXZ1m1XbukKxqs/giphy.gif)

## viewWillLayoutSubviewsのメソッド内でレイアウト処理を実装すれば、この時点ではsuperViewのframeが正確に取得できるので期待したレイアウトになる。

### ソースコード

```swift
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
}
```

### デモ
![demo](https://media.giphy.com/media/kf4K7XFeTLjPkkSsXR/giphy.gif)
