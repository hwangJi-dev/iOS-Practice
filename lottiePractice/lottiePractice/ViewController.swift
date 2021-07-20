//
//  ViewController.swift
//  lottiePractice
//
//  Created by 황지은 on 2021/07/14.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet var lottieView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLottieAnimation(animationName: "lottie_test")
        // Do any additional setup after loading the view.
    }
    
    //MARK: - LottieAnimtaion 적용
        func makeLottieAnimation(animationName:String){
            

            let lottieAnimationView = AnimationView()
            
            // 적용할 파일 이름 적기 ( .json 확장자는 안적어도 됨!! )
            lottieAnimationView.animation = Animation.named(animationName)
            
            lottieAnimationView.frame = lottieView.bounds
            lottieAnimationView.backgroundColor = .clear
            
            lottieAnimationView.contentMode = .scaleToFill
            lottieAnimationView.loopMode = .playOnce
            
            // loopMode 방식 5개 !
            // playOnce : 한번만 돌고 끝남
            // loop : 처음부터 끝까지 반복
            // autoReverse : 애니메이션이 앞 뒤로 재생되고 멈출때까지 재생
            // repeat(특정숫자) : 특정숫자 값 만큼 반복
            // repeatBackwards(특정숫자) : 특정숫자만큼 뒤로 반복 ex) 2 면 앞뒤앞뒤앞 이렇게 실행됨.
            lottieAnimationView.play()
            lottieView.addSubview(lottieAnimationView)
        }


}

