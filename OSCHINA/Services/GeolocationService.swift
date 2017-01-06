//
//  GeolocationService.swift
//  RxExample
//
//  Created by Carlos García on 19/01/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation
import CoreLocation
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

class GeolocationService {
    
    static let instance = GeolocationService()
    fileprivate (set) var authorized: Driver<Bool>
    fileprivate (set) var location: Driver<CLLocationCoordinate2D>
    
    fileprivate let locationManager = CLLocationManager()
    
    fileprivate init() {
        
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        authorized = Observable.deferred { [weak locationManager] in
                let status = CLLocationManager.authorizationStatus()
                guard let locationManager = locationManager else {
                    return Observable.just(status)
                }
                return locationManager
                    .rx_didChangeAuthorizationStatus
                    .startWith(status)
            }
            .asDriver(onErrorJustReturn: CLAuthorizationStatus.NotDetermined)
            .map {
                switch $0 {
                case .AuthorizedAlways:
                    return true
                default:
                    return false
                }
            }
        
        location = locationManager.rx_didUpdateLocations
            .asDriver(onErrorJustReturn: [])
            .flatMap {
                return $0.last.map(Driver.just) ?? Driver.empty()
            }
            .map { $0.coordinate }
        
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
}
