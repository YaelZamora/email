//
//  MailView.swift
//  Email
//
//  Created by Yael Javier Zamora Moreno on 29/05/23.
//

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    var content: String
    var to: String
    var subject: String
    
    typealias UIViewControllerType = MFMailComposeViewController
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let view = MFMailComposeViewController()
        view.mailComposeDelegate = context.coordinator
        view.setToRecipients([to])
        view.setSubject(subject)
        view.setMessageBody(content, isHTML: false)
        
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: MailView
        
        init(parent: MailView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
        
    }
    
}
