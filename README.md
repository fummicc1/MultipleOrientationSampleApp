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

## 余談

### circleViewも回転時にアニメーションしたい
画面回転時に`viewWillTransition`を使用してcircleViewにアニメーションを実装してきます。

#### ソースコード
```swift
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
```

#### デモ
![demo](https://media.giphy.com/media/PkiHiNXpq6LL1xuaBN/giphy.gif)

