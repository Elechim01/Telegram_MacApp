//
//  HomeViewModel.swift
//  Telegram_MacApp
//
//  Created by Michele Manniello on 22/02/21.
//

import SwiftUI

class HomeViewModel : ObservableObject{
    @Published var selectedTab = "All Chats"
    @Published var msg : [RecentMessage] = recentMsgs
//    Selected Recent Tab
    @Published var selectedrecentMsg : String? = recentMsgs.first?.id
    @Published var search = ""
//    Message
    @Published var message = ""
//    Expand View..
    @Published var isExpanded = false
//    Piced Expanded Tab...
    @Published var pickerTab = "Media"
//    sed message
    func sendMessage(user : RecentMessage){
        if message != ""{
            let index = msg.firstIndex { (user) -> Bool in
                return user.id == user.id
            } ?? -1
            if index != -1 {
                msg[index].allMsgs.append(Message(message: message, myMessage: true))
                message = ""
            }
        }
    }
}
