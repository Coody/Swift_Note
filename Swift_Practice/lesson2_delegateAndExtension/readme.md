
# Lesson 2 Protocol , Extensions( Category ) , Delegate

## Protocol

* 例子：

```
// 寫法
protocol SomeProtocol {
    // protocol definition goes here
}

// 在 struct 中使用
struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}

// 在 class 中使用
class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // class definition goes here
}

```

* 可以在 Protocol 中使用 property ，甚至可以使用 static property
* 使用方式：

```
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}
// { get set } 表示 gettable , 以及 settable
// { get } 表示 gettable
```
* Protocol 中的 optional 用法如下（ swift 3.x ），[詳細請看此](http://stackoverflow.com/questions/24032754/how-to-define-optional-methods-in-swift-protocol)：

```
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}
// 感覺 swift 沒有 optional 的方法，只要訂出來都必須要實作。
```

* [官方 Protocol 文件](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html)


## Extensions
* [Extensions 參考資料](http://stackoverflow.com/questions/24142829/how-to-create-swift-class-for-category)
* Extensions 就是 Objective-c 中的 Category ，但是更強大且簡易
* Extension 只要被寫出來，不用 import 也可以使用，如：

```
import UIKit
extension UIButton{

	func changeButtonCornerAndColor(color: UIColor, lineWidth: CGFloat){
	
		
	
	}

}

import UIKit
class ViewController: UIViewController{

	var button : UIButton!
	
	override func viewDidLoad(){
	
		super.viewDidLoad()
		
		button.changeButtonCornerAndColor( UIColor.read , lineWidth:8.0 )
	
	}

}
```
* [官方 Extension 範例](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Extensions.html)

## Delegate

* 使用 Protocol 開出介面
* 裡面有個變數為

```
var delegate:OoxxDelegate?
```

* 方法使用

```
private func pressedBtn(_ sender:AnyObject ){
	delegate?.pressedBtn( sender )
}
```

* Class 使用 Delegate 設計模式的例子：

```
// here is the protocol for creating the delegation:
protocol AudioPlayerDelegate {
    func playPauseDidTap()
    func playlistDidTap()
}

class AudioPlayerView: UIView {
    //MARK:- IBOutlets
    @IBOutlet weak private var btnPlayPause: UIButton!
    @IBOutlet weak private var btnPlaylist: UIButton!

    // MARK:- Delegate
    var delegate:AudioPlayerDelegate?

    // IBActions
    @IBAction private func playPauseTapped(_ sender: AnyObject) {
        delegate?.playPauseDidTap()
    }

    @IBAction private func playlistTapped(_ sender: AnyObject) {
        delegate?.playlistDidTap()
    }
}
```

* ViewController 使用此類別的例子：

```
class ViewController: UIViewController {

}

extension ViewController: AudioPlayerDelegate {
    func playPauseDidTap() {
        print("play/pause tapped!!")
    }

    func playlistDidTap() {
        // note that is should do a different behavior in each viewController...
        print("list tapped!!")
    }
}

```

* [Examples of Delegates in Swift 3](http://stackoverflow.com/questions/40501780/examples-of-delegates-in-swift-3)

# 補充1: 使用 code 進入 ViewController

* 先要了解初始化怎麼寫，那就要搞懂```designated init```以及```convenience init```，請看這篇 [designated init 以及 convenience init 的差別](http://jason9075.logdown.com/posts/285685-swift-note-initialization-rules-convenience-and-designated-initializer-usage)。
* [What are convenience required initializers in Swift?](http://stackoverflow.com/questions/26922694/what-are-convenience-required-initializers-in-swift)
* 三個規則：
	* designated init 必須自行呼叫 super 的 designated init 。
	* convenience init 必須呼叫其他的 init 方法。
	* convenience init 最終必須呼叫 designated init 方法。
	* 我的感覺：這有點類似我們在寫類別的介面時，會開出很多方法讓外部使用，但是內部實作時，最終都會導到同一個方法來實作的感覺。
* 簡單來說， convenience init 就字面上的意思就是「方便使用」的 init， designated init 就字面上就是最終設計來初始化的方法。
* 由上面的解釋可以知道， designated init 是最重要的，因此你在實作 designated init 時，請記得要把所有此 class 的 properties 都要 initialized ，[可以看看這篇的人所問的問題](http://stackoverflow.com/questions/24521876/swift-subclassing-how-to-override-init)。
* 繼承 ViewController 的初始化方法請用以下的寫法來實作，[詳細可看這](http://stackoverflow.com/questions/26923003/how-do-i-make-a-custom-initializer-for-a-uiviewcontroller-subclass-in-swift)，寫法如下：

```
class ViewController: UIViewController {
    convenience init() {
        self.init(imageURL: nil)
    }
    
    init(imageURL: NSURL?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    // xcode 7 && 8
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
```


# 補充2: 再論 func 中的 _

* swift 的  func 命名類似 Objective-C 的命名，所有 param 都可以寫個讓你知道使用這個方法時，該傳入什麼參數。
* 但有沒有可能我們有時候不想寫參數名稱，讓使用此方法的人直接類似 c++ 傳值的方式就好？有！因此 _ 就產生了。
* 例子：

```
// 不使用 _
func myFunc( name:String , age:String ){
}

myFunc( "Milo" , age: "I'm a really old wizard" ) // 為何第一個可以不用？因為第一個 param 內建 _

// 使用 _ 
func myFunc(name:String, _ age:String){
}

myFunc( "Milo" , "I'm a really old wizard" )  // 第二個 param 可以不用 age:"ooxx" 了

```
* 詳細可以看這篇 [What is _: in Swift telling me?](http://stackoverflow.com/questions/30876068/what-is-in-swift-telling-me)


# Lesson 2 作業

* 接續 Lesson 1 的作業，請使用今天教的方式做一的 view 的類別，包含作業 1 的畫面，並且使用 delegate 設計模式讓 ViewController 使用 delegate 來處理流程。
* 接續 Lesson 1 的作業， ViewController 請用 category 實作 View 的回呼功能。


-
# 在 Lesson 2 你應該學到

1. Protocol 基本用法
2. Delegate 基本用法
3. Category 基本用法

[--> 下一課，Lesson 3 Array , Dictionary , Set , 再論 var](https://github.com/Coody/Swift_Note/tree/master/Swift_Practice/lesson3_MoreAboutBasicAndData)

-
# License
MIT

