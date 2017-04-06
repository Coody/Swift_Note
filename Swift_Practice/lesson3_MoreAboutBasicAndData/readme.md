
# Lesson 3 Array , Dictionary , Set , 再論 var

## Array

* 定義 Array 的方式有兩種，一種是```ooxxArray: Array<Type>```，另一種是中括號```ooxxArray: [Type]```：

```
var objectArray_1: Array<Int>
var objectArray_2: [Int]
```

* 初始化 Array

```
objectArray_1 = [Int]()

// 使用
objectArray_1.append(5)
```

* 定義以及初始化一起用

```
var objArray: Array<Int>? = [Int]()
// 或是
var objArray: [Int]? = [Int]()
```

* 直接清空

```
objectArray_1 = []
```

* 特殊給值

```
objectArray_1 = [2...4] = [5,5,5]
// 另外......
objectArray_1 = [2...4] = [5]
// 這樣會變成 2~4 的 index 全部取代成 index:2 那個的 value:5 ，「單一」一個值喔！（不是 index 2~4 都變成 5,5,5 ）
```

* for each ，在 swift 是 for-in

```
var objectArray_1 = [1,2,3,4,5,6,7]
for unit in objectArray_1 {
	print("\(unit) , " , terminator:"")
}
```

* 補充：如果 print 不要使用 newLine ，請用上面的方式```print( ... , terminator:"" )```，請看這篇文章[print without newline in swift 2](http://stackoverflow.com/questions/30865233/print-without-newline-in-swift-2)。

* 使用其實非常直覺簡單，幾乎可以直接上手，如果想要看文件[可看這](https://itisjoe.gitbooks.io/swiftgo/content/ch1/collection_types.html)。

## Dictionary



## 再論 var

* 變數 ? 以及 ! 使用的時機
	* 如果變數未來可能會是 nil ，那麼就用 ?
	* 如果此變數不會變成 nil ，那就用 !
* 參考：[What is the difference between String? and String! (two ways of creating an optional variable)?](http://stackoverflow.com/questions/24083842/what-is-the-difference-between-string-and-string-two-ways-of-creating-an-opti)

* 型別的別名，例：

```
// 將 UILabel 給個別名為 CoodyLabel
tyepalias CoodyLabel = UILabel

// 產生一個變數，他是 CoodyLabel 的類型（其實就是 UILabel ）
var newLabel: CoodyLabel?

```

* implicitly unwrapped optional （隱式解析可選型別），如果你不了解這個是什麼，請看下面的「推薦必看1」。
* 隱式解析可選型別，我個人覺得翻譯的很爛，改成更口語的話，可以說成是「隱含了值的可選型別」，因此如其名，就是他用 ! 代表這個變數有值了（或是應該要有值），所以在使用上，就不用像是一般可選型別（ ? 的寫法）再取值的時後，要額外加上 ! 來取用。例子如下：

```
// 可選型別
let oneString: String? = "Good morning ."
// 需要驚嘆號來取值
let anotherString: String = oneString!

// 如果改成「隱含了值的可選型別」
let twoString: String! = "Good night ."
// 則可以直接使用 不用加上驚嘆號
let finalString: String = twoString
```

* 為何要使用這些方式呢？簡單來說就是要解決變數沒有值的問題（包含一邊變數，如： int 等......），在 swift 中，他為了安全，所以要求所有變數都要有值，而他使用了 Optional 的方式來達成，這個 Optional 可以想像成是一個 enum，如下： 

```
// slightly simplified
enum Optional {
    case none
    case some(Wrapped)
}
```

* 因此你如果給他真正的值，就會是在```case some(Wrapped)```那個。
* 所以，當你要使用一個 Optional 變數、或是從一個 Optional 變數取得其值的時候，你要先```unwrap```他，因為你會知道，他真正的值是在上面```enum```中的 Wrapped 那裡面。
* 因此有兩種方法使用此變數，一種是 Safe Way 、一種是 Unsafe Way ，例子如下：
	* Safe Way（安全的使用、不會 Crash 的）
	
	```
	let possibleString: String? = "Hello"
	if let actualString = possibleString {
    	// actualString is a normal (non-optional) String value
    	// equal to the value stored in possibleString
    	print(actualString)
	}
	else {
    	// possibleString did not hold a value, handle that
    	// situation
	}
	```
	
	* Unsafe Way（不安全的使用、會 Crash！）
	
	```
	// 因為有值，沒事！
	let possibleString: String? = "Hello"
	print(possibleString!)
	
	// 會 Crash !
	let possibleString: String? = nil
	print(possibleString!)
	```
	
* 上面的結論是我幫大家讀了下面幾個「推薦必看」文章後的心得，所以有空最好還是看一下底下的「推薦必看」！
* 推薦必看1：[What is an Optional in Swift](https://drewag.me/posts/2014/07/05/what-is-an-optional-in-swift)
* 推薦必看2：[Uses for Implicitly Unwrapped Optionals in Swift](https://drewag.me/posts/2014/07/05/uses-for-implicitly-unwrapped-optionals-in-swift)
* 參考：[Why create "Implicitly Unwrapped Optionals" ?](http://stackoverflow.com/questions/24006975/why-create-implicitly-unwrapped-optionals)

# Lesson 3 作業

* 


-
# 在 Lesson 3 你應該學到

1. Array , Dictionary , Set 基本用法
2. UITableView
3. 

-
# License
MIT

