//
//  MapPinAnnotationRepository.swift
//  InkVision
//
//  Created by Bruno Thuma on 28/11/21.
//  Credits to Vinicius Couto

import Foundation

final class MapPinAnnotationRepository {
    func pins() -> [MapPinAnnotation] {
        [
            MapPinAnnotation.fixtureSpot(),
            MapPinAnnotation.fixtureStopper(),
        ]
    }
}
