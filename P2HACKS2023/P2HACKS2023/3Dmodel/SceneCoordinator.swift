//
//  SceneCoordinator.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/17.
//

import Foundation
import SceneKit

class SceneCoordinator: NSObject, SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        renderer.debugOptions = [.renderAsWireframe]
    }
}
