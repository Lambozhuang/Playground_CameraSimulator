//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import UIKit
import PlaygroundSupport

public enum LiveViewIdentifier: String {
    case introduction
    case aperture
    case lensAndFocus
    case iso
    case shutterSpeed
    
}

public func instantiateLiveView(identifier: LiveViewIdentifier) -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "LiveView", bundle: nil)

    let liveViewController = storyboard.instantiateViewController(withIdentifier: identifier.rawValue)

//    guard let liveViewController = viewController as? LiveViewController else {
//        fatalError("LiveView.storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
//    }


    return liveViewController
}
