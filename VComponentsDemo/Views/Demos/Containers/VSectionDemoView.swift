//
//  VSectionDemoView.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 1/10/21.
//

import SwiftUI
import VComponents

// MARK:- V Section Demo View
struct VSectionDemoView: View {
    // MARK: Properties
    static let navigationBarTitle: String = "Section"
    
    @State private var form: VTableDemoView.Form = .free
    
    // Copied from VSection's preview
    private struct Row: Identifiable {
        let id: Int
        let color: Color
        let title: String

        static let count: Int = 20
    }
    
    private var rows: [Row] {
        (0..<Row.count).map { i in
            .init(
                id: i,
                color: [.red, .green, .blue][i % 3],
                title: spellOut(i + 1)
            )
        }
    }
    
    private func spellOut(_ i: Int) -> String {
        let formatter: NumberFormatter = .init()
        formatter.numberStyle = .spellOut
        return formatter.string(from: .init(value: i))?.capitalized ?? ""
    }
    
    private  func rowContent(title: String, color: Color) -> some View {
        HStack(spacing: 10, content: {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(color.opacity(0.8))
                .frame(dimension: 32)

            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body)
                .foregroundColor(ColorBook.primary)
        })
    }
}

// MARK:- Body
extension VSectionDemoView {
    var body: some View {
        DemoView(type: .freeform, title: Self.navigationBarTitle, controller: controller, content: {
            VSection(title: "Lorem ipsum dolor sit amet", data: rows, content: { row in
                rowContent(title: row.title, color: row.color)
            })
                .frame(height: form.height)
        })
    }
    
    private var controller: some View {
        VSegmentedPicker(
            selection: $form,
            title: "Section Height",
            subtitle: form.subtitle
        )
            .frame(height: 90, alignment: .top)
    }
}

// MARK:- Preview
struct VSectionDemoView_Previews: PreviewProvider {
    static var previews: some View {
        VSectionDemoView()
    }
}
