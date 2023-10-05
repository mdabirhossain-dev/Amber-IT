//
//  FeedBackView.swift
//  Amber IT Profile
//
//  Created by Tanvir Rahman on 4/10/23.
//

import SwiftUI

struct FeedBackView: View {
    @State private var feedbackText: String = ""
    @State private var feedbackIsPressed: [Bool] = [false, false, false, false, true]
    var body: some View {
        VStack{
            VStack{
                Text("Give Feedback")
                    .font(.custom(FontManager.Poppins.bold, size: 16))
                Text("Rate your exprience")
                    .font(.custom(FontManager.Poppins.medium, size: 14))
            }.padding(.bottom, 40)
            HStack{
                Image("face1")
                    .resizable()
                    .frame(width: 39.48738, height: 39.48739)
                    .foregroundColor(feedbackIsPressed[0] ? Color.red : Color.white)
                    .padding(.horizontal, 5)
                    .onTapGesture {
                        withAnimation {
                            feedBackValueUpdate(index: 0)
                        }
                    }
                Image("face2")
                    .resizable()
                    .frame(width: 39.48738, height: 39.48739)
                    .foregroundColor(feedbackIsPressed[1] ? Color.red : Color.white)
                    .padding(.horizontal, 5)
                    .onTapGesture {
                        withAnimation {
                            feedBackValueUpdate(index: 1)
                        }
                    }

                Image("face3")
                    .resizable()
                    .frame(width: 39.48738, height: 39.48739)
                    .foregroundColor(feedbackIsPressed[2] ? Color.red : Color.white)
                    .padding(.horizontal, 5)
                    .onTapGesture {
                        withAnimation {
                            feedBackValueUpdate(index: 2)
                        }
                        
                    }

                Image("face4")
                    .resizable()
                    .frame(width: 39.48738, height: 39.48739)
                    .foregroundColor(feedbackIsPressed[3] ? Color.red : Color.white)
                    .padding(.horizontal, 5)
                    .onTapGesture {
                        withAnimation {
                            feedBackValueUpdate(index: 3)
                        }
                        
                    }

                Image("face5")
                    .resizable()
                    .frame(width: 39.48738, height: 39.48739)
                    .foregroundColor(feedbackIsPressed[4] ? Color.red : Color.white)
                    .padding(.horizontal, 5)
                    .onTapGesture {
                        withAnimation {
                            feedBackValueUpdate(index: 4)
                        }
                    }
            }
            
            VStack{
                Text("Do you have any thoughts you’d like to share?")
                    .font(.custom(FontManager.Poppins.medium, size: 14))
                
                TextEditor(text: $feedbackText)
                    .background(Color(red: 0.82, green: 0.82, blue: 0.82))
                    .cornerRadius(10)
                    .font(.custom(FontManager.Poppins.medium, size: 12))
                    .frame(height: 153)
                    .border(.red)
                    .padding(.horizontal)
                
                Button{
                    
                }label: {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(red: 1, green: 0, blue: 0))
                        .overlay(
                            Text("Send Feedback")
                                .font(.custom(FontManager.Poppins.semiBold, size: 12))
                                .foregroundColor(.white)
                        )
                        .frame(width: 182, height: 32)
                    
                }//.padding(.horizontal, 10)
                .padding(.top, 5)
            }.padding(.top, 40)
            Spacer()
        }.padding(.top, 60)
    }
    private func feedBackValueUpdate(index: Int){
      
        for i in 0..<feedbackIsPressed.count {
            if i == index {
                feedbackIsPressed[i] = true
            }else{
                feedbackIsPressed[i] = false
            }
        }
    }
}

struct FeedBackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedBackView()
    }
}
