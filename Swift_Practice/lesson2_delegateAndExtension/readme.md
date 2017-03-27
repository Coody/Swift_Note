-
# Lesson 2 Protocol && Extensions( Category )

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

-
# Lesson 2 作業


-
# 在 Lesson 2 你應該學到


-
# License
MIT

