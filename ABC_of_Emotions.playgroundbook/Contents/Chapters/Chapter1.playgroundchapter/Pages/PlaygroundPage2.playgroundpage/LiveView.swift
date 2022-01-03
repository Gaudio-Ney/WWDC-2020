//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import PlaygroundSupport
import SwiftUI
import BookCore
import UIKit

PlaygroundPage.current.liveView = TestVC()
PlaygroundPage.current.needsIndefiniteExecution = true
