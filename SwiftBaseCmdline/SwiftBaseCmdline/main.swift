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
dic2()
