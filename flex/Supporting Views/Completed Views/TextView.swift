//
//  TextView.swift
//  flex
//
//  Created by Jun suk Bang on 2020/08/13.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    var text : String
    func makeCoordinator() -> Coordinator {
        return TextView.Coordinator(parent1: self)
    }
    
    @EnvironmentObject var obj : observed
    
    func makeUIView(context: UIViewRepresentableContext<TextView>) -> UITextView {
        let view = UITextView()
        view.font = .systemFont(ofSize: 15)
        view.text = self.text
        view.textColor = UIColor.black.withAlphaComponent(0.35)
        view.backgroundColor = .clear
        view.delegate = context.coordinator
        self.obj.size = view.contentSize.height
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.isScrollEnabled = true
        return view
    }
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<TextView>) {
        
    }
    class Coordinator:NSObject, UITextViewDelegate {
        var parent : TextView
        init(parent1: TextView) {
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.obj.size = textView.contentSize.height
            
        }
    }
}

class observed : ObservableObject {
    @Published var size : CGFloat = 0
}
//struct TextView: UIViewRepresentable {
//    @Binding var text : String
//    func makeCoordinator() -> Coordinator {
//        Coordinator.self(self)
//    }
//    func makeUIView(context: Context) -> UITextView {
//        let myTextView = UITextView()
//        myTextView.delegate = context.coordinator
//        myTextView.isEditable = false
//        myTextView.isUserInteractionEnabled = true
//        myTextView.backgroundColor = UIColor(white: 0.0, alpha: 0.05)
//        return myTextView
//    }
//    func updateUIView(_ uiView: UITextView, context: Context) {
//        uiView.text = text
//    }
//    class Coordinator: NSObject, UITextViewDelegate {
//        var parent : TextView
//        init(_ uiTextView: TextView) {
//            self.parent = uiTextView
//        }
//        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//            return true
//        }
//        func textViewDidChange(_ textView: UITextView) {
//            print("text now: \(String(describing: textView.text!))")
//            self.parent.text = textView.text
//        }
//    }
//}

