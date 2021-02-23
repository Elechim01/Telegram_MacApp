//
//  AllChatsView.swift
//  Telegram_MacApp
//
//  Created by Michele Manniello on 22/02/21.
//

import SwiftUI

struct AllChatsView: View {
    @EnvironmentObject var homeData : HomeViewModel
    var body: some View {
//        Side Tab View....
        VStack {
            HStack{
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                })
            }
            .padding()
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search",text:$homeData.search)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(.vertical,8)
            .padding(.horizontal)
            .background(Color.primary.opacity(0.15))
            .cornerRadius(10)
            .padding()
            List(selection : $homeData.selectedrecentMsg){
                ForEach(homeData.msg){ message in
    //             Message View
                    NavigationLink(
                        destination: DetailView(user: message).environmentObject(homeData),
                        label: {
                            RecentCardView(recentMsg: message).environmentObject(homeData)
                        })
                   
                }
            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct AllChatsView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
