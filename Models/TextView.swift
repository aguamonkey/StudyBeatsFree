//
//  TextView.swift
//  Awaken Me
//
//  Created by Gobias LTD on 26/07/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var textStyle: UIFont.TextStyle
    
    
    func makeCoordinator() -> Coordinator {
          Coordinator($text)
      }

      class Coordinator: NSObject, UITextViewDelegate {
          var text: Binding<String>
      
          init(_ text: Binding<String>) {
              self.text = text
          }
          
          func textViewDidChange(_ textView: UITextView) {
              self.text.wrappedValue = textView.text
          }
      }
          

    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.font = UIFont.preferredFont(forTextStyle: textStyle)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.delegate = context.coordinator
        textView.addDoneButton(title: "Done", target: textView, selector: #selector(textView.doneButtonTapped(button:)))
  
        
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.preferredFont(forTextStyle: textStyle)
    }
    
}

extension UITextView {

    func addDoneButton(title: String, target: Any, selector: Selector) {

        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
        toolBar.setItems([flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }

    @objc func doneButtonTapped(button: UIBarButtonItem) {
        self.resignFirstResponder()
    }
}
