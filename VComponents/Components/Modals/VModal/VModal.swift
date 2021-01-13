//
//  VModal.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 1/13/21.
//

import SwiftUI

// MARK:- V Modal
public struct VModal<Content, TitleContent>
    where
        Content: View,
        TitleContent: View
{
    // MARK: Properties
    public var model: VModalModel
    
    public var titleContent: (() -> TitleContent)?
    public var content: () -> Content
    
    public var appearAction: (() -> Void)?
    public var disappearAction: (() -> Void)?
    
    // MARK: Initializers
    public init(
        model: VModalModel = .init(),
        @ViewBuilder title titleContent: @escaping () -> TitleContent,
        @ViewBuilder content: @escaping () -> Content,
        onAppear appearAction: (() -> Void)? = nil,
        onDisappear disappearAction: (() -> Void)? = nil
    ) {
        self.model = model
        self.titleContent = titleContent
        self.content = content
        self.appearAction = appearAction
        self.disappearAction = disappearAction
    }
    
    public init(
        model: VModalModel = .init(),
        @ViewBuilder content: @escaping () -> Content,
        onAppear appearAction: (() -> Void)? = nil,
        onDisappear disappearAction: (() -> Void)? = nil
    )
        where TitleContent == Never
    {
        self.model = model
        self.titleContent = nil
        self.content = content
        self.appearAction = appearAction
        self.disappearAction = disappearAction
    }
}

// MARK:- Extension
public extension View {
    func vModal<Content, TitleContent>(
        isPresented: Binding<Bool>,
        modal: @escaping () -> VModal<Content, TitleContent>
    ) -> some View
        where
            Content: View,
            TitleContent: View
    {
        ZStack(content: {
            self
            
            if isPresented.wrappedValue {
                VModalVCRepresentable(
                    isPresented: isPresented,
                    content: _VModal(isPresented: isPresented, modal: modal()),
                    blinding: modal().model.colors.blinding.edgesIgnoringSafeArea(.all),
                    onBackTap: {
                        if modal().model.layout.closeButtonPosition == .backTap {
                            withAnimation { isPresented.wrappedValue = false }
                        }
                    }
                )
            }
        })
    }
}