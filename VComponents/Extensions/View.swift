//
//  View.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 18.12.20.
//

import Foundation
import SwiftUI

// MARK:- Conditional Modifiers
extension View {
    @ViewBuilder func `if`<Transform: View>(
        _ condition: Bool, transform: (Self) -> Transform
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder func `if`<IfContent: View, ElseContent: View>(
        _ condition: Bool,
        ifTransform: (Self) -> IfContent,
        elseTransform: (Self) -> ElseContent
    ) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }
    
    @ViewBuilder func ifLet<V, Transform: View>(
        _ value: V?,
        transform: (Self, V) -> Transform
    ) -> some View {
        if let value = value {
            transform(self, value)
        } else {
            self
        }
    }
}

// MARK:- Frame
extension View {
    func frame(dimension: CGFloat, alignment: Alignment = .center) -> some View {
        frame(
            width: dimension, height: dimension,
            alignment: alignment
        )
    }
    
    func frame(size: CGSize, alignment: Alignment = .center) -> some View {
        frame(
            width: size.width, height: size.height,
            alignment: alignment
        )
    }
    
    func frame(size: SizeConfiguration, alignment: Alignment = .center) -> some View {
        frame(
            minWidth: size.min.width, idealWidth: size.ideal.width, maxWidth: size.max.width,
            minHeight: size.min.height, idealHeight: size.ideal.height, maxHeight: size.max.height,
            alignment: alignment
        )
    }
}

struct SizeConfiguration {
    let min, ideal, max: CGSize
}