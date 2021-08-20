//
//  ViewController.swift
//  musicLink
//
//  Created by 황지은 on 2021/08/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpToConnectYoutubeMusic(_ sender: Any) {
        let youtubeMusic = "youtubemusic://"
        let youtubeMusicURL = NSURL(string: youtubeMusic)
        
        //canOpenURL(_:) 메소드를 통해서 URL 체계를 처리하는 데 앱을 사용할 수 있는지 여부를 확인
                if (UIApplication.shared.canOpenURL(youtubeMusicURL! as URL)) {
            
                    //open(_:options:completionHandler:) 메소드를 호출해서 유튜브 뮤직 앱 열기
                    UIApplication.shared.open(youtubeMusicURL! as URL)
                }
                //사용 불가능한 URLScheme일 때(유튜브 뮤직이 설치되지 않았을 경우)
                else {
                    print("No youtubeMusic installed.")
                }
    }
    
    @IBAction func touchUpToConnectYoutubeMusicPlaylist(_ sender: Any) {
        let youtubeMusicPlaylist = "youtubemusic://watch?list=PL-R6OzpWHAfZSw_b6MHPG5rkLY_mqBtOh&feature=share"
        let youtubeMusicPlaylistURL = NSURL(string: youtubeMusicPlaylist)
        
        //canOpenURL(_:) 메소드를 통해서 URL 체계를 처리하는 데 앱을 사용할 수 있는지 여부를 확인
        if (UIApplication.shared.canOpenURL(youtubeMusicPlaylistURL as! URL)) {
            
                    //open(_:options:completionHandler:) 메소드를 호출해서 유튜브 뮤직 앱 열기
                    UIApplication.shared.open(youtubeMusicPlaylistURL! as URL)
                }
                //사용 불가능한 URLScheme일 때(유튜브 뮤직이 설치되지 않았을 경우)
                else {
                    print("No melon installed.")
                }
    }
   // http://kko.to/apGzAuf40
    //kko.to/apGzAuf40
    @IBAction func touchUpToConnectMelon(_ sender: Any) {
    
        let melon = "Meloniphone://plylstTypeCode=M20002&plylstSeq=416388554"
        let melonURL = NSURL(string: melon)
        
        //canOpenURL(_:) 메소드를 통해서 URL 체계를 처리하는 데 앱을 사용할 수 있는지 여부를 확인
                if (UIApplication.shared.canOpenURL(melonURL! as URL)) {
            
                    //open(_:options:completionHandler:) 메소드를 호출해서 멜론 앱 열기
                    UIApplication.shared.open(melonURL! as URL)
                }
                //사용 불가능한 URLScheme일 때(멜론 앱이 설치되지 않았을 경우)
                else {
                    print("No melon installed.")
                }
    }
}

