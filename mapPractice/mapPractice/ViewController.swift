//
//  ViewController.swift
//  mapPractice
//
//  Created by 황지은 on 2020/06/13.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit
import NMapsMap

class ViewController: UIViewController {

    var locationManager:CLLocationManager!
    var myMarker = NMFMarker()
    var mapView : NMFMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
        
        var coord = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        print("위도:\(coord.lat), 경도:\(coord.lng)")
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        //포그라운드일 때 위치 추적 권한 요청(알림 발생)
        locationManager.requestWhenInUseAuthorization()
        //배터리에 맞게 권장되는 최적의 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //위치 업데이트
        locationManager.startUpdatingLocation()
        
        //위,경도 가져오기
        let coor = locationManager.location?.coordinate
        
        
    myMarker.position = NMGLatLng(lat: 37.5670135, lng: 126.978374)
    myMarker.mapView = mapView
      
    }
    
    

}

extension ViewController {
    
    func move(at coordinate: CLLocationCoordinate2D?){
     guard let coordinate = coordinate else {
                return
            }
            
            print("move = \(coordinate)")
            
            let latitude = coordinate.latitude
            let longitude = coordinate.longitude
        
            let NMGL = NMGLatLng.init(lat: latitude, lng: longitude)
            
        let camera = NMFCameraUpdate.init(scrollTo: NMGL, zoomTo: 14.0)
       
        mapView.moveCamera(camera)
            
        myMarker.position = NMGLatLng(lat: latitude, lng: longitude)
        myMarker.captionText = "My position"
        myMarker.mapView = mapView
        
        print(camera)
        print(longitude)
    
        }
    }
     
    extension ViewController: CLLocationManagerDelegate {
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let firstLocation = locations.first else {
                return
            }
            
            move(at: firstLocation.coordinate)
        }
    }

