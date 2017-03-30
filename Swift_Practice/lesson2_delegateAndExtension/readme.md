-
# Lesson 2 Protocol && Extensions( Category )

## Protocol

* 
* 

## Delegate

* 
* [Examples of Delegates in Swift 3](http://stackoverflow.com/questions/40501780/examples-of-delegates-in-swift-3)

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

# 補充1: 使用 code 進入 ViewController

* 先要了解初始化怎麼寫，那就要搞懂```designated init```以及```convenience init```，請看這篇 [designated init 以及 convenience init 的差別](http://jason9075.logdown.com/posts/285685-swift-note-initialization-rules-convenience-and-designated-initializer-usage)。
* 

# 補充2: 再論 func 中的 _

* swift 的  func 命名類似 Objective-C 的命名，所有 param 都可以寫個讓你知道使用這個方法時，該傳入什麼參數。
* 但有沒有可能我們有時候不想寫參數名稱，讓使用此方法的人直接類似 c++ 船值的方式就好？有！因此 _ 就產生了。
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

-
# Lesson 2 作業

* 接續 Lesson 1 的作業，請使用今天教的方式做一的 view 的類別，並且使用 delegate 設計模式。
* 接續 Lesson 1 的作業， ViewController 請用 category 實作 View 的回呼功能。


-
# 在 Lesson 2 你應該學到

1. Protocol 基本用法
2. Delegate 基本用法
3. Category 基本用法

-
# License
MIT

