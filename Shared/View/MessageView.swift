//
//  MessageView.swift
//  Telegram_MacApp
//
//  Created by Michele Manniello on 23/02/21.
//

import SwiftUI

struct MessageView: View {
    @EnvironmentObject var homeData : HomeViewModel
    var user : RecentMessage
    var body: some View {
        GeometryReader { reader in
            ScrollView{
                ScrollViewReader { proxy in
                    VStack {
                        ForEach(user.allMsgs){ message in
            //                Message CardView
                            
                            MessageCardView(message: message, user: user, width: reader.frame(in: .global).width)
                                .tag(message.id)
                        }
                        .onAppear{
//                            Show Last Message...
                            let lastID = user.allMsgs.last!.id
                            proxy.scrollTo(lastID, anchor: .bottom)
                        }
                        .onChange(of: user.allMsgs, perform: { value in
//                            Same for When new Message Append....
//                            Showing Last Message 
                            let lastID = user.allMsgs.last!.id
                            proxy.scrollTo(lastID, anchor: .bottom)
                        })
                    }
                    .padding(.bottom,30)
                }
            }
        }
    }
}
struct MessageCardView: View {
    var message : Message
    var user : RecentMessage
    var width: CGFloat
    var body: some View{
        HStack(spacing:10){
            if message.myMessage{
                Spacer()
                Text(message.message)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(10)
                    //                MaxWidth....
                    .frame(minWidth: 0,maxWidth: width / 2,alignment: .trailing)
            }else{
                Image(user.userImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .offset(y:20)
                
                
                Text(message.message)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.primary.opacity(0.2))
                    .clipShape(MessageBubble())
//                MaxWidth....
                    .frame(minWidth: 0,maxWidth: width / 2,alignment: .leading)
                Spacer()
            }
        }
    }
}

struct MessageBubble: Shape {
    func path(in rect : CGRect) -> Path {
        return Path{ path in
            let pt1 = CGPoint(x: 0, y: 0)
            let pt2 = CGPoint(x: rect.width, y: 0)
            let pt3 = CGPoint(x: rect.width, y: rect.height)
            let pt4 = CGPoint(x: 0, y: rect.height)
            path.move(to: pt4)
            
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 15)
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 15)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 15)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 15)
            
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
