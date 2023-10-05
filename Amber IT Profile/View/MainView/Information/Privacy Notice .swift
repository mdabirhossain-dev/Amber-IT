//
//  Privacy Notice .swift
//  Amber IT Profile
//
//  Created by Tanvir Rahman on 5/10/23.
//

import SwiftUI


struct PrivacyNotice: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        ZStack{
            Color("AdaptiveBackgroundColor2")
            ScrollView(.vertical) {
                VStack(alignment: .leading){
                    Text("PRIVACY NOTICE")
                        .foregroundColor(Color(red: 0.91, green: 0.2, blue: 0.19))
                        .font(.custom(FontManager.Poppins.semiBold, size: 22))
                        .padding(.bottom)
                    
                    Text("DEMOS PRIVACY POLICY: \n Demos follows the relevant legal requirements and takes all reasonable precautions to safeguard personal information. \n    INTRODUCTIO \n Demos is committed to protecting your privacy and security. This policy explains how and why we use your personal data, to ensure you remain informed and in control of your information.\n You can decide not to receive communications or change how we contact you at any time. If you wish to do so please contact us by emailing hello@demos.co.uk, writing to 76 Vincent Square, London, SW1 2PD or 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).\n We will never sell your personal data, and will only ever share it with organisations we work with where necessary and if its privacy and security are guaranteed. Personal information submitted to Demos is only used to contact you regarding Demos activities. \n Information about visitors to the Demos website domain is automatically logged for the purposes of statistical analysis. Such information includes the IP address from which you visit, referral address, and other technical information such as browser type and operating system. Your email address is not automatically logged without your knowledge.\n We will not distribute, sell, trade or rent your personal information to third parties. Demos may provide aggregate statistics about our website’s users, traffic patterns and related site information to reputable third-parties such as Demos’s funding bodies or potential partners. Such statistical information will not include personally identifying information. \n    Questions \n Any questions you have in relation to this policy or how we use your personal data should be sent to hello@demos.co.uk for the attention of Demos’ Head of External Affairs.\n    ABOUT US \n Your personal data (i.e. any information which identifies you, or which can be identified as relating to you personally) will be collected and used by Demos (charity no:1042046, company registration no: 2977740)./n /uTHE INFORMATION WE COLLECT /nPersonal data you provide.\n    We collect data you provide to us. This includes information you give when joining as a member or signing up to our newsletter, placing an order or communicating with us. For example: \n personal details (name, job title, organisation and email) when you sign up to our newsletter and / or events.\n financial information (payment information such as credit/debit card or direct debit details, when making donations or paying for a service. Please see section 8 for more information on payment security); and\n    details of Demos events you have attended.\n   Sensitive personal data\n   We do not normally collect or store sensitive personal data (such as information relating to health, beliefs or political affiliation) about those signed up to Demos’s newsletter. However there are some situations where this will occur (e.g. if you have an accident on one of our events). If this does occur, we’ll take extra care to ensure your privacy rights are protected. \n   Accidents or incidents\n    If an accident or incident occurs on our property, at one of our events or involving one of our staff then we’ll keep a record of this (which may include personal data and sensitive personal data).\n   HOW WE USE INFORMATION \n    We only ever use your personal data with your consent, or where it is necessary in order to: \n    enter into, or perform, a contract with you; \n comply with a legal duty;\n protect your vital interests; \n for our own (or a third party’s) lawful interests, provided your rights don’t override these. \n In any event, we’ll only use your information for the purpose or purposes it was collected for (or else for closely related purposes). \n    Administration")
                        .foregroundColor(.white)
                        .font(.custom(FontManager.Poppins.medium, size: 10))
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal,10)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                HStack{
            Button{
                self.presentationMode.wrappedValue.dismiss()
            }label: {
                Image("arrow-left")
                    .foregroundColor(.white)
                
            }
            Text("Privacy Notice")
                .font(.custom(FontManager.Poppins.semiBold, size: 18))
                .foregroundColor(.white)
        }
        )
        
        
    }
}

struct PrivacyNotice_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyNotice()
    }
}
