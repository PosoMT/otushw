//
//  AnyTransition.swift
//  
//
//  Created by Pablo on 14.06.2023.
//

import SwiftUI

public extension AnyTransition {
    
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading).combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static var slideDownCurve: AnyTransition {
        let insertion = AnyTransition.move(edge: .top).combined(with: .opacity)
        let removal = AnyTransition.move(edge: .bottom).combined(with: .scale)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
    
