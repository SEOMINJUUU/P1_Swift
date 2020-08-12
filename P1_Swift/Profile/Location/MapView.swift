//
//  MapView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/03.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
//    var coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 37.577271, longitude: 126.890736)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
