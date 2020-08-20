//
//  ChatView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/13.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct Chat: Identifiable {
    var id = UUID()
    var itemImage: String
    var profileImage: String
    
    let name: String
    var badge: Bool?
    var message: String
    
    var time: String
    var unreadCount: Int?
}
struct ChatView: View {
    
    var chatList: [Chat] = [
        Chat(itemImage: "pickitem1", profileImage: "pickitem2", name: "랑랑", message: "보내드린 장소에서 가능합니다!", time: "18:22", unreadCount: 2),
        Chat(itemImage: "pickitem1", profileImage: "pickitem3", name: "난회사원", badge: true, message: "앗 감사합니다!ㅠㅠ", time: "13:10"),
        Chat(itemImage: "pickitem3", profileImage: "pickitem2", name: "나는야 아보카도", message: "넘넘 감사해요!!!!", time: "08:40", unreadCount: 16),
        Chat(itemImage: "listitem1", profileImage: "pickitem2", name: "hahaha", message: "보내드린 장소에서 가능합니다!", time: "어제"),
        Chat(itemImage: "bodyfriend1", profileImage: "pickitem2", name: "보돈보돈해", message: "바디프렌드 엘리제 제품 사용해보고 싶어요!", time: "어제"),
        Chat(itemImage: "listitem1", profileImage: "pickitem2", name: "마카롱냠", message: "좋은 설명 감사합니다:)", time: "어제"),
        Chat(itemImage: "pickitem1", profileImage: "pickitem2", name: "신나는 아보카도", message: "얼른 구매해야겠어요ㅠㅠ감사합니다!", time: "어제")]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("채팅")
                    .font(Font.system(size: 20))
                    .bold()
                    .padding()
                
                Spacer()
                
                List(chatList) { chat in
                    ZStack {
                        ChatRow(chat: chat)
                        NavigationLink(destination: MessageView()) {
                            EmptyView()
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            .navigationBarTitle(Text("채팅"))
//            .edgesIgnoringSafeArea(.bottom)
        }
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

struct ChatRow: View {
    var chat: Chat
    
    var body: some View {
        HStack {
            ZStack {
                CircleImage(image: Image(chat.itemImage))
                    .frame(height: 80)
                
                CircleImage(image: Image(chat.profileImage))
                    .frame(height: 25)
                    .padding([.leading, .top], 45)
            }
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(chat.name)
                            .font(Font.system(size: 16))
                        
                        chat.badge.map({_ in Image("badge")})
                    }
                    Text(chat.message)
                        .font(Font.system(size: 12))
                        .foregroundColor(Color.gray)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 10) {
                    Text(chat.time)
                        .font(.caption)
                        .foregroundColor(Color.init(UIColor.systemGray3))
                    chat.unreadCount.map({_ in BlueCircleNumber(unreadCount: chat.unreadCount!)})
                }
            }
        }
    }
}

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.init(UIColor.systemGray6), lineWidth: 2))
    }
}

struct BlueCircleNumber: View {
    var unreadCount: Int
    
    var body: some View {
        Text(" \(unreadCount) ")
            .font(Font.system(size: 12))
            .padding(3)
            .foregroundColor(Color.white)
            .background(Color("mainColor"))
            .clipShape(Capsule())
    }
}
