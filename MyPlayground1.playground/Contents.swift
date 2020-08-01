import UIKit

var str = "Hello, playground"

typealias Menu = (Name:String,Time:Int,Price:Int)

let Menu01:Menu = ("아메리카노",5,3800)
let Menu02:Menu = ("카페라떼",5,4500)
let Menu03:Menu = ("카페모카",5,5000)
let Menu04:Menu = ("카라멜마끼아또",5,5000)
let Menu05:Menu = ("에스프레소",5,4000)
let Menu06:Menu = ("망고스무디",5,6000)
let Menu07:Menu = ("복숭아아이스티",5,4500)
let Menu08:Menu = ("레모네이드",5,4500)
let Menu09:Menu = ("샌드위치",2,4000)
let Menu10:Menu = ("베이글",1,1500)

var MenuList:[Menu] = [Menu01,Menu02,Menu03,Menu04,Menu05,Menu06,Menu07,Menu08,Menu09,Menu10]

//위 메뉴 중 가격이 4000원 이상인 메뉴의 이름을 순서대로 출력해 주세요

for(name,_,price) in MenuList {
    if price >= 4000 {
        print(name)
    }
}

//모든 음료 가격의 평균을 구하시오
var sum:Int = 0
for(_,_,price) in MenuList {
    sum += price
}
print("음료의 평균은 \(Double(sum)/Double(MenuList.count))")

//가장 빨리 만들 수 있는 메뉴를 구하시오
var fastestfood:String = ""
var fast:Int = 999999999999
for(name,time,_) in MenuList
{
    if(time<fast){
        fastestfood = name
        fast = time
    }
}
print("가장 빨리 만들 수 있는 메뉴는: \(fastestfood)")


//가장 비싼 메뉴를 구하시오
var highestprice:String = ""
var high:Int = 0

for(name,_,price) in MenuList
{
    if(price>high){
        highestprice = name
        high = price
    }
}

print("가장 비싼 메뉴는: \(highestprice)")

