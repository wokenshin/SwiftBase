//
//  main.swift
//  SwiftBaseCmdline
//
//  Created by HanKibou on 2023/3/18.
//

import Foundation

//print("Hello, World!")
func base() {
    //变量
    var age = 1
    age = 10//变量可以重复赋不同值
    print(age)

    //常量
    let season = 4
    //season = 5 //常量只能赋值一次
    print(season)

    //声明一个变量的时候可以指定该量所属的类型,这样该变量就不能被赋值为其他类型 var xxx : type = value
    var day : Int = 7
    print(day)
    //day=3.5//会报错
    day = 10
    print(day)

    //定义数组
    let nameArr: [String] = ["kibou", "kenshin"];
    //print(nameArr[0])
    //print(nameArr[1])

    //语法 for 变量名 in 集合
    for name in nameArr {
        print(name)
    }
}

// 定义一个无参数 无返回值的函数
func add() {
    print(3+4)
}

// 定义一个有参数的函数
func add(a:Int, b:Int) {// 有点不爽、为什么不沿用oc的函数定义方式呢？毕竟OC是方括号、这里的写法其实已经很好了、因为后面调用函数的时候会带上参数名
    print(a+b)
}

// 给函数参数设置默认值,用 = 赋上默认值即可
func add2(a:Int=0, b:Int=0) {
    print(a+b)
}

// 带返回值的函数
func add3(a:Int=0, b:Int=0) -> Int {
    return a+b
}

//执行函数
//add()
//add(a: 100, b: 200)
//add2()
//add2(a: 2, b: 2);
//print(add3())
//print(add3(a: 2,b: 5))

//函数语法   func funcName(参数1, 参数2...) -> 返回值类型{...}   其中参数、返回值 没有可以省略、参数可以有默认值

// 给函数参数设置别名，让函数参数意义更加清晰，这样做之后，调用函数时参数前的参数必须是别名
func add4(num1 a:Int,num2 b:Int) {
    print(a+b)//注意 函数内部还是使用 a、b
}
//add4(num1: 1, num2: 2)//调用函数时、参数前的使用的是别名而不是a、b

func array1() {
//    创建一个空数组
    var numArr = [Int]()
    numArr.append(0)
    numArr.append(1)
    numArr.append(2)//这里的添加元素的方式有点像cpp
    for num in numArr {//遍历数组
        print(num)
    }
}

func array2() {
    let numArr = [1,2,3];//自动推断出 var numArr 为 整形数组
    for num in numArr {//遍历数组
        print(num)
    }
}

//array1()
//array2()

func dic1() {
//    创建一个空的字典
    var dic = [String:Int]()//String代表key、Int代表value 这里和OC的字典不对、OC的字典的value并不支持int类型
    dic["age"] = 33
    dic["salary"] = 20000
    
    for (key, value) in dic {//遍历字典 注意 这里的 key value是固定写法
        print("key:\(key), value:\(value)")//注意这里的写法 是一个整体字符串 “x\(变量1)x\(变量2)x\(变量3)”
    }
    //也可以直接打印
    print(dic)
}

func dic2() {
//    类型推断
    var dic = ["name":"kibou", "like":"basketball"]
    dic["love"] = "toma"
    dic["xxx"] = "yyy"
    for(key, value) in dic {
        print("key:\(key), value:\(value)")
    }
    
    //移除某个键值对
    dic.removeValue(forKey: "xxx")
    print(dic)
}

//dic1()
//dic2()

//面向对象
class Person {//注意 这里是定义类 左边没有圆括号
    //成员变量
    var name: String = ""//在定义属性后必须要给一个初始值、如果不给定、必须在构造函数中指定初始值
    var age: Int = 0
    
    //定义属性（就是重写 成员的 set get方法）【新知识】
    var Age:Int {
        set(value){
            if value > 150 {
                self.age = 150
            } else if value < 0 {
                self.age = 0
            } else {
                self.age = value
            }
        }
        get{
            return self.age
        }
    }
    
    //类变量
    static var like:String = "girl"
    
    //闭包
    var func1:()->Void = {
        print("我是一个无参数、无返回值的闭包")
    }
    
    var func2:(String, Int)->String = {str, num in // 注意这里用 in 隔开 左边是形式参数
        return "我是一个带参数、带返回值的闭包：\(str), \(num)"
    }
    
    
    //成员方法
    func sayHello() {
        print("你好， 我的名字叫\(name), 我今年\(age)岁了。")
    }
    
    //类方法
    static func sleep() {
        print("我想睡觉了")
    }
}

let p = Person()
//p.sayHello()
p.name = "kibou"
//p.sayHello()

p.Age = 160//注意 这里是p.Age  不是p.age
//p.sayHello()
//print(Person.like)
//Person.sleep()

//p.func1()//调用闭包
let str = p.func2("kenshin", 20)
//print(str)

//引用传递函数定义

//下面的写法会报错、因为num1 和 num2 是不可变参数 要想可变 必须在 参数后面添加 inout 修饰符
//func swap(num1:Int, num2:Int) {
//    let tmp = num1
//    num1 = num2;
//    num2 = tmp;
//}

func swap (num1:inout Int, num2:inout Int) {//注意 参数修饰之间只有一个冒号:
    let tmp = num1;
    num1 = num2;
    num2 = tmp;
}

var a = 10;
var b = 20;
//print("修改前 a:\(a),b:\(b)")
swap(num1: &a, num2: &b)//这里调用swap的时候会带上&符、其实就是【引用传递】的意思
//print("修改后 a:\(a),b:\(b)")

//泛型 定义函数 这样的话就可以交换两个相同的任意类型的变量了
func swap2<T> (num1:inout T, num2:inout T) {//注意！ 这里用 T 代表任意类型 即 泛型
    let tmp = num1;
    num1 = num2;
    num2 = tmp
}
var str1 = "kenshin"
var str2 = "kibou"
//print("修改前 str1:\(str1), str2:\(str2)")
swap2(num1: &str1, num2: &str2)
//print("修改前 str1:\(str1), str2:\(str2)")

//初始化
class Person2 {
    var name: String = "哈哈"
    var age: Int
    
    //如果声明变量的时候不给默认值、那么初始化方法里面一定要给，不然会报错
    init() {//swift的初始化方法 和 C++的构造函数名字并不相同
        name = "婴儿"
        age = 0
    }
    
    //重载初始化方法 【重载：方法名相同、参数不同】
    init(myAge: Int) {
        age = myAge
    }
    
    //析构方法
    deinit {//注意 这里并没有 圆括号
        print("当我被释放的时候会执行该方法")
    }
}

var p2 = Person2()//此时 这里的Person2() 就会调用初始化方法
print("我的年龄是：\(p2.age), 我的名字是:\(p2.name)")

var p3 = Person2(myAge: 18)//调用带参数的初始化方法
print("我的年龄是：\(p3.age), 我的名字是:\(p3.name)")

var p4: Person2? = Person2()//为了能够让对象置空、所以定义了可选类型 此时【引用计数】为1、即p4的值指向了当前创建的对象
p4 = nil//当p4=nil 时、此时【引用计数】为0、即 创建的对象没有任何一个变量指向它，所以它就释放了

class MyPerson {
    var age:Int
    var name: String
    
    init() {
        age = 0
        name = "小孩"
    }
    
    func play() {
        print("我是MyPerson play")
    }
}

class Teacher: MyPerson {
    var obj:String
    
    override init() {
        obj = "语文"
        super.init()//调用父类的初始化 必须放在最后一行，要确保当前类的其他成员已经被初始化【有个疑问？如果当前成员的初始化依赖于父类成员的初始化怎么办？】
    }
    
    override func play() {
        print("我是Teacher play")
    }
}

let t = MyPerson()
t.play()

//PS 结构体也可以像类一样使用，但是【结构体是深拷贝、类是浅拷贝】
//   swift 的 类实例赋值是浅拷贝、即 不同的变量指向同一个对象(同一个内存地址)
//   swift 的 结构体实例赋值是深拷贝 即 不同的变量指向不同的对象(即每次赋值的时候都会重新分配内存，不同的变量指向不同的内存地址)
/*
 比如
 var obj1 = Obj()
 var obj2 = obj1   //这里的两个变量 实际上指向同一片内存
 
 var structObj1 = StructObj()
 var structObj2 = structObj1 //这里的两个变量 实际上指向不同的内存，这里的拷贝就会重新开辟内存空间
 
 */
