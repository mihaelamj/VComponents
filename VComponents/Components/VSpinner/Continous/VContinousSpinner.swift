//
//  VSpinnerContinous.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 18.12.20.
//

import SwiftUI

// MARK:- V Spinner Continous
struct VSpinnerContinous: View {
    // MARK: Properties
    private let model: VSpinnerContinousModel
    
    @State private var isAnimating: Bool = false
    
    // MARK: Initializers
    init(model: VSpinnerContinousModel) {
        self.model = model
    }
}

// MARK:- Body
extension VSpinnerContinous {
    var body: some View {
        Circle()
            .trim(from: 0, to: model.layout.legth)
            .stroke(
                model.colors.spinner,
                style: .init(lineWidth: model.layout.thickness, lineCap: .round)
            )
            .frame(width: model.layout.dimension, height: model.layout.dimension)
            .rotationEffect(.init(degrees: isAnimating ? 360 : 0))
            .animation(model.behavior.animation.repeatForever(autoreverses: false))
            .onAppear(perform: { isAnimating.toggle() })
    }
}

struct VSpinnerContinous_Previews: PreviewProvider {
    static var previews: some View {
        VSpinnerContinous(model: .init())
    }
}