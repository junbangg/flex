//
//  KeyboardHost.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/13.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct KeyboardHost<Content: View>: View {
    
    let view: Content

    @State private var keyboardHeight: CGFloat = 0

    private let showPublisher = NotificationCenter.Publisher.init(
        center: .default,
        name: UIResponder.keyboardWillShowNotification
    ).map { (notification) -> CGFloat in
        if let rect = notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect {
            return rect.size.height
        } else {
            return 0
        }
    }

    private let hidePublisher = NotificationCenter.Publisher.init(
        center: .default,
        name: UIResponder.keyboardWillHideNotification
    ).map {_ -> CGFloat in 0}

    // Like HStack or VStack, the only parameter is the view that this view should layout.
    // (It takes one view rather than the multiple views that Stacks can take)
    init(@ViewBuilder content: () -> Content) {
        view = content()
    }

    var body: some View {
        VStack {
            view
            Rectangle()
                .frame(height: keyboardHeight)
                .animation(.default)
                .foregroundColor(.clear)
            }.onReceive(showPublisher.merge(with: hidePublisher)) { (height) in
            self.keyboardHeight = height
        }
    }
}

//struct KeyboardHost_Previews: PreviewProvider {
//    static var previews: some View {
//        KeyboardHost()
//    }
//}
