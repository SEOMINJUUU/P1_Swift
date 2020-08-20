//
//  MessageView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/13.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct MessageView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var message: String = ""
    
    var name: String = "랑랑"
    var item: Item = Item(image: "pickitem1", name: "웰릭스 건조기", tags: ["소음들어보세요", "실제세탁보여드림"])
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        Image(systemName: "chevron.left")
            .foregroundColor(Color.black)
        }
    }
    
    var body: some View {
        VStack {
            PickedItemRow(item: item)
                .padding()
            Divider()
            
            Spacer()
            
            //            ScrollView {
            VStack {
                
                ZStack {
                    Divider()
                    Text("기분좋은 인사와 함께 대화를 시작해주세요!")
                        .font(.caption)
                        .bold()
                        .foregroundColor(Color.gray)
                        .background(Color.white)
                }
                GeometryReader {_ in
                    List(msgs) { msg in
                        
                        msgCell(data: msg)
                    }
                }
            }
            //            }
            Divider()
            chatBottomView(message: message).padding(.horizontal)
            
            
        }
        .navigationBarTitle(Text(name), displayMode: .inline)
        .navigationBarItems(leading: btnBack, trailing: Image(systemName: "ellipsis").rotationEffect(Angle(degrees: 90)))
        .navigationBarBackButtonHidden(true)
        
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

struct msgData: Identifiable {
    var id = UUID()
    var msg: String
    var myMsg: Bool
}

var msgs = [msgData(msg: "안녕하세요! 건조기 제품을 보고싶어 연락드립니다. 내일 저녁 7시에 시간 괜찮으신가요?", myMsg: true),
            msgData(msg: "넵 장소는 방배동 괜찮으세요?", myMsg: false),
            msgData(msg: "네 좋아요~ 제가 약속일정 만들겠습니다!", myMsg: true)]

struct msgCell: View {
    var data: msgData
    
    var body: some View {
        HStack {
            if data.myMsg {
                Spacer()
                Text(data.msg)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } else {
                Text(data.msg)
                    .padding()
                    .background(Color.init(UIColor.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }.font(.callout)
    }
}


struct chatBottomView: View {
    @State var message: String
    
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "plus.circle")
            }
            ZStack(alignment: .trailing) {
                TextField("메세지를 입력하세요.", text: $message)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 3)
                    .font(Font.system(size: 12))
                    .overlay(RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.gray, lineWidth: 0.3))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "smiley")
                }.padding(.trailing, 10)
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "paperplane.fill").rotationEffect(Angle(degrees: 45))
            }
        }.foregroundColor(Color.gray)
        
    }
}
