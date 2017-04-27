
# Lesson 4 再論 func , 閉包(Closure)

## func
* func ```$函式名稱``` ( ```$參數標籤1```  ```$參數名稱1```:```$型別1``` , ```...已此類推``` ){ ... }

```
// 例一：
func test( name:String , age:Int ){
}
// 使用上：
abc.test( name:"Bob" , age:43 );


// 例二：
func test( _ name:String , _ age:Int ){
}
// 使用上：
abc.test( "Bob" , 43 );


// 例三：
func test( setName name:String , setAge age:Int ){
}
// 使用上
abc.test( setName:"Bob" , setAge:43 );


// Q: 為何會有這樣的設計？
// A: 為了口語化！
func sendMail( from sendEmailAddress: String , to receiveEmailAddress: String ){
}
// 使用起來就如下，整句看起來就非常的口語化：
mailBox.sendMail( from: coody@mail.com  to: Bob@mail.com )
```

* 使用 ... 來建立可變量參數。
* 一個 func 只能有一個可變量參數。
* func 如果有預設值的參數，且野有可變量參數，那必須要把可變量參數放再 func 參數的最後面。

```
func sumNumbers( numbers: Double... ) -> Double {
	var total: Double = 0
	for number in numbers {
		total = total + number
	}
	return total;
}
```

* 使用 inout 改變輸入參數的值。
* 在型別前面加上 inout 。
* 在使用的時候變數加上 & 傳入。

```
// 例：
func getRealCatAge( catAge:inout Float ){
    let tempCatAge:Float = catAge*365.0
    var realCatAge:Float = 1.0;
    if tempCatAge <= 30 {
        realCatAge = 1;
    }
    else if tempCatAge > 30 && tempCatAge <= 140 {
        realCatAge = 1.0 + (tempCatAge - 30)/10
    }
    else if tempCatAge > 140 && tempCatAge <= 340 {
        realCatAge = 12.0 + ( tempCatAge - 140 )/10
    }
    else if tempCatAge > 340 && catAge < 2{
        realCatAge = 23.0
    }
    else{
        realCatAge = 30.0 + ( catAge - 2 )*5
    }
    catAge = realCatAge
}

// 使用：
var age: Float = 8
self.getRealCatAge(catAge: & age)
print( age )
```


# Lesson 4 作業
* 

# 在 Lesson 4 你應該學到

1. 

# License
MIT

