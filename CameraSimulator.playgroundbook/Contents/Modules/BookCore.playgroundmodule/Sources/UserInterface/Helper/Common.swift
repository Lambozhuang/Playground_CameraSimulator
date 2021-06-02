//
//  Common.swift
//  BookCore
//
//  Created by Lambo.T.Zhuang on 2021/4/16.
//

import Foundation
import UIKit

var referenceWidth: CGFloat = 0.0

public enum ApertureSize {
    case small
    case medium
    case large
}

public var currentApertureChoice: ApertureSize = .small

public enum LensModel {
    case wide
    case common
    case telephoto
    
    var focalLengthRange: [Int] {
        switch self {
        case .wide:
            return wideFocalLengthRange
        case .common:
            return commonFocalLengthRange
        case .telephoto:
            return telephotoFocalLengthRange
        }
    }
    
    
}

public var currentLensChoice: LensModel = .wide

let wideFocalLengthRange: [Int] = [18, 20, 24, 27]
let commonFocalLengthRange: [Int] = [29, 35, 50, 69]
let telephotoFocalLengthRange: [Int] = [70, 93, 98, 135]

let focusDistance: [String] = [
    "-",
    "--",
    "---",
    "----",
    "-----",
    "------",
    "-------",
    "--------",
    "---------",
    "----------",
]

let isoRange_1: [String] = [
    "100",
    "200",
    "400",
    "800",
    "1600",
    "3200",
    "6400",
    "12800",
    "20000",
    "25600",
    "32000"
]

public var currentISOChoice_1: Int = 0

let isoRange_2: [String] = [
    "200",
    "400",
    "1000",
    "2500",
    "10000"
]

let exposureTime: [String] = [
    "1/30",
    "1/20",
    "1/10",
    "1/5",
    "1/2",
    "1",
    "2",
    "4"
]

let exposureTimePicName: [String] = [
    "1:30",
    "1:20",
    "1:10",
    "1:5",
    "1:2",
    "1",
    "2",
    "4"
]

public var currentISOChoice_2: Int = 0

public var currentExposureTimeChoice: Int = 0


public var apertureStart: Bool = false

public var lensAndFocusStart: Bool = false

public var isoStart: Bool = false

public var shutterSpeedStart: Bool = false

