//
//  DetailView.swift
//  Telegram_MacApp
//
//  Created by Michele Manniello on 22/02/21.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var homeData : HomeViewModel
    var user : RecentMessage
    var body: some View {
        
        HStack {
            VStack{
                HStack{
                    Text(user.userName)
                        .font(.title2)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                    })
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        withAnimation{
                        homeData.isExpanded.toggle()
                        }
                    }, label: {
                        Image(systemName: "sidebar.right")
                            .font(.title2)
                            .foregroundColor((homeData.isExpanded ? .blue: .primary))
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
//                Message View
                MessageView(user: user).environmentObject(homeData)
                
                
                HStack(spacing:15){
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "paperplane")
                            .font(.title2)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                   TextField("Enter Message", text: $homeData.message,onCommit:{
                        homeData.sendMessage(user: user)
                    })
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.vertical,8)
                    .padding(.horizontal)
                    .clipShape(Capsule())
                    .background(Capsule().strokeBorder(Color.primary.opacity(0.15)))
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "face.smiling.fill")
                            .font(.title2)
                    })
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "mic")
                            .font(.title2)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding([.horizontal,.bottom])
                .ignoresSafeArea(.all, edges: .all)
            }
            ExpandedView(user: user).environmentObject(homeData)
            .background(BlurView())
            .frame(width: homeData.isExpanded ? nil : 0)
            .opacity(homeData.isExpanded ? 1: 0)
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//Expanded View...
struct ExpandedView: View {
    @EnvironmentObject var homeData : HomeViewModel
    var user : RecentMessage
    var body: some View{
        HStack(spacing:0){
            Divider()
            VStack(spacing:25){
                Image(user.userImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .padding(.top,35)
                Text(user.userName)
                    .font(.title)
                    .fontWeight(.bold)
                HStack{
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Image(systemName: "bell.slash")
                                .font(.title2)
                            Text("Mute")
                        }
                        .contentShape(Rectangle())
                    })
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Image(systemName: "hand.raised.fill")
                                .font(.title2)
                            Text("Block")
                        }
                        .contentShape(Rectangle())
                    })
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Image(systemName: "exclamationmark.triangle")
                                .font(.title2)
                            Text("Report")
                        }
                        .contentShape(Rectangle())
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .foregroundColor(.gray)
                Picker(selection: $homeData.pickerTab , label: Text("Picker"), content: {
                    Text("Media").tag("Media")
                    Text("Links").tag("Links")
                    Text("Audio").tag("Audio")
                    Text("Fiels").tag("Fiels")
                })
                .pickerStyle(SegmentedPickerStyle())
                .labelsHidden()
                .padding(.vertical)
                
                ScrollView{
                    if homeData.pickerTab == "Media"{
//                        Grid Of Photos...
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 10), count: 3), spacing: 10,content: {
                            ForEach(1...8,id: \.self){ index in
                                Image("media\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(3)
                            }
                        })
                    }else{
                        Text("NO \(homeData.pickerTab)")
                    }
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: 300)
//            Horizontal padding = 30
//            Spacing = 30
//             300 - 60 = 240 /30 = 80
        }
    }
}
