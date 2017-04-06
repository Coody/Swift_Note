
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

* 定義 Dictionary 的方式有兩種，一種是```ooxxDic: Dictionary< Type , Type >```，另一種是中括號```ooxxDic: [Type : Type]```：

```
var objectDic_1: Dictionary< String , Int >
var objectDic_2: [ String : Int ]
```

* 初始化 Dic

```
objectDic_1 = [ String : Int ]()

// 使用
objectDic_1.updateValue( 5 , forKey: "Test")
```

* 定義以及初始化一起用

```
var objectDic_1: Dictionary< String , Int >! = [ String : Int ]()
// 或是
var objectDic_1: [ String : Int ]! = [ String : Int ]()
```

* 直接清空

```
objectDic_1 = [:]
```

* 給值、或是覆蓋、移除

```
// 沒有此 Key 就會建一個、有此 Key 就會覆蓋
objectDic_1["Key"] = Value

// 他法
objectDic_1.updateValue( 123 , forKey: "LHR")

// 移除
objectDic_1.removeValueForKey( "DUB" )
```

* 取得 Keys 或是 Values 的陣列

```
// 取得 Keys
var someArr1 = [String](objectDic_1.keys)

// 取得 Values
var someArr1 = [Int](objectDic_1.values)
```

* for-in

```
for ( keyunit , valueUnit ) in myDict5 {
    print( "\(keyunit): \(valueUnit)" )
}
```

## Set

* 他跟 Array 差別在他沒有順序、且沒有重複的值。
* 裡面要相同型別。
* 定義 Set 、初始化 Set

```
// 
var objectSet: Set<Int>

// 初始化
var objectSet: Set<Int> = [ 5,6,7 ]
```

* 跟陣列使用上有點像，但能夠有數學集合的功能！[詳細請看此](https://itisjoe.gitbooks.io/swiftgo/content/ch1/collection_types.html)。

## 再論 var

### 變數的別名

* 型別的別名，例：

```
// 將 UILabel 給個別名為 CoodyLabel
tyepalias CoodyLabel = UILabel

// 產生一個變數，他是 CoodyLabel 的類型（其實就是 UILabel ）
var newLabel: CoodyLabel?

```

### 變數 ? 以及 ! 的概念

* 變數 ? 以及 ! 使用的時機
	* 如果變數未來可能會是 nil ，那麼就用 ?
	* 如果此變數不會變成 nil ，那就用 !
* 參考：[What is the difference between String? and String! (two ways of creating an optional variable)?](http://stackoverflow.com/questions/24083842/what-is-the-difference-between-string-and-string-two-ways-of-creating-an-opti)



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

* 為何要使用這些方式呢？簡單來說就是要解決變數沒有值的問題（包含一般變數，如： int , float 等......），在 swift 中，他為了安全，所以要求所有變數都要有值，而他使用了 Optional 的方式來達成，這個 Optional 可以想像成是一個 enum，如下：

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

* 請試著用 UITableView 建立一組表格元件、最底下留一個空間放一顆按鈕。
* 請試著建立學生資料類別的陣列，內容為 A 班級、以及 B 班級的學生資料，內部有學號、學生姓名、學生生日。
* 試著將此資料顯示在 TableView 上面，左邊為 Key , 右邊為 Value 。
* 當按下按鈕，使用 Set 集合的功能來比對出同樣生日的學生（請自行設定幾個學生影同樣的生日），並且更新 TableView。

# 在 Lesson 3 你應該學到

1. Array , Dictionary , Set 基本用法
2. UITableView
3. 何時使用 ? ! 的概念

# License
MIT

