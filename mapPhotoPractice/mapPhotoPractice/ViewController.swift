//
//  ViewController.swift
//  mapPhotoPractice
//
//  Created by 황지은 on 2021/06/29.
//

import UIKit
import MapKit


class ViewController: UIViewController,MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self;
        let location = CLLocationCoordinate2D(
            latitude: 51.50007773,
            longitude: -0.1246402
        )

        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)

        mapView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Big Ben"
        annotation.subtitle = "London"



        var overlay = MKCircle (center: location, radius: 500)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        view.backgroundColor = .red
        mapView.addSubview(view)
        mapView.addOverlay(overlay)
        mapView.addAnnotation(annotation)

    }

    func mapView(
        mapView: MKMapView!, rendererForOverlay
        overlay: MKOverlay!) -> MKOverlayRenderer! {
        if (overlay.isKind(of: MKCircle.self))
            {
                var circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.strokeColor = UIColor.green
                circleRenderer.fillColor = UIColor(
                    red: 0,
                    green: 1.0,
                    blue: 0,
                    alpha: 0.5)

                return circleRenderer
            }
            return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

