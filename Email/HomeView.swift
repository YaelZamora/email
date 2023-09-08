//
//  HomeView.swift
//  Email
//
//  Created by Yael Javier Zamora Moreno on 29/05/23.
//

import SwiftUI
import MessageUI

struct HomeView: View {
    @State private var sendEmail = false
    let constants = Constants.shared
    
    var body: some View {
        VStack{
            if MFMailComposeViewController.canSendMail(){
                Button{
                    sendEmail.toggle()
                } label: {
                    Text(constants.sendButtonText)
                }
            } else {
                Text(constants.noSupportText).multilineTextAlignment(.center)
            }
        }
        .sheet(isPresented: $sendEmail){
            MailView(content: constants.contentPreText, to: constants.email, subject: constants.subject)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
