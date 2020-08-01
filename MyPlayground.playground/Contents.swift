import UIKit

var str = "Hello, playground"

var lottoArrays = Array<Array<Int>>()
var originalNumbers = Array(1 ... 45)
var index = 0
var indexNumbers = Array<Int>()

for _ in 0...3 {
    for _ in 0...5 {
        //index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
        index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
        indexNumbers.append(index)
        originalNumbers.remove(at: index)
    }
    
    lottoArrays.append(indexNumbers)
    indexNumbers.removeAll(keepingCapacity: true)
    originalNumbers = Array(1...45)
}
print(lottoArrays)
print(indexNumbers)
lottoArrays.removeAll()
for _ in 0...3 {
    for _ in 0...5 {
        //index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
        
        index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
        indexNumbers.append(index)
        originalNumbers.remove(at: index)
    }

    lottoArrays.append(indexNumbers)
    indexNumbers.removeAll(keepingCapacity: true)
   
}
print(lottoArrays)
print(indexNumbers)
for i in 0...3 {
        for j in 0...5 {
            //index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
            index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
            lottoArrays[i][j] = originalNumbers[index]
            originalNumbers.remove(at: index)

        }
    }


