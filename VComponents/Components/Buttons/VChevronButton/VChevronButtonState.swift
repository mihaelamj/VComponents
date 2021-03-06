//
//  VChevronButtonState.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 12/23/20.
//

import Foundation

// MARK:- V Chevron Button State
/// Enum that describes state, such as enabled or disabled
public enum VChevronButtonState: Int, CaseIterable {
    case enabled
    case disabled
    
    var isEnabled: Bool {
        switch self {
        case .enabled: return true
        case .disabled: return false
        }
    }
}

// MARK:- V Chevron Button Internal State
enum VChevronButtonInternalState {
    case enabled
    case pressed
    case disabled
    
    init(state: VChevronButtonState, isPressed: Bool) {
        switch (state, isPressed) {
        case (.enabled, false): self = .enabled
        case (.enabled, true): self = .pressed
        case (.disabled, _): self = .disabled
        }
    }
}
