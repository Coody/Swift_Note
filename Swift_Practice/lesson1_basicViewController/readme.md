# Lesson 1 Basic ViewController


- swift 結尾沒有分號 ```;``` ，但你要加也可以。
- 請嘗試在 xcode 上建立一個 swift 的專案。
- ```import <UIKit/UIKit.h> 變成 import UIKit```
- property 的值可以設定為 optional ，類似 obj-c 的 nil ，但是他除了物件以外的一般變數都可以選擇 optional (沒有任何值）。
- 有可能（或是不曉得）此 property 是否有值，可以用 ? 的寫法，如下：

	```
	var testString : String? = "Hello" // 此句可以看成：testString 是 String，他可以是空的 ( nil 的 )
	testString = nil // it's ok
	
	```

- property 的寫法
	
	```
	// objective-c
	@property (nonatomic , strong) UIButtin *button
	
	// swift
	strong
	
	```
- function 要用```func```開頭

	如：
	
	```
	func getStart()
	{
		print("Hello Baby!!");
	}
	```
	
- 覆寫要用```override```

	如：
	
	```
	override func viewDidLoad()
	{
		super.viewDidLoad();
	}
	```
- if else 不用 () 

	
