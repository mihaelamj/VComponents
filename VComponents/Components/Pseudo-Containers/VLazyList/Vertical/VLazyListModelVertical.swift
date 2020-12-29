//
//  VLazyListModelVertical.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 19.12.20.
//

import SwiftUI

// MARK:- V Lazy List Model Vertical
public struct VLazyListModelVertical {
    public let layout: Layout
    
    public init(
        layout: Layout = .init()
    ) {
        self.layout = layout
    }
}

// MARK:- Layout
extension VLazyListModelVertical {
    public struct Layout {
        public let alignment: HorizontalAlignment
        public let showsIndicators: Bool
        
        public init(
            alignment: HorizontalAlignment = .center,
            showsIndicators: Bool = true
        ) {
            self.alignment = alignment
            self.showsIndicators = showsIndicators
        }
    }
}