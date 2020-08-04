//
//  SignUpView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/04.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @State var password: String = "";
    @State var password_repeat: String = "";
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Spacer()
                VStack(alignment: .leading){
                    
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("대문자 1개 이상")
                    }
                    .foregroundColor(Color.gray)
                    
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                        Text("특수문자 1개 이상")
                    }
                    .foregroundColor(Color.green)
                }
                .font(.footnote)
                Spacer().frame(height: 40)
                
                VStack(alignment: .leading) {
                    
                    Text("비밀번호 입력")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    HStack {
                        TextField("6자리 이상 입력해주세요.", text: $password)
                            .font(.subheadline)
                        Image(systemName: "checkmark.circle")
                            .font(Font.body.weight(.bold))
                            .foregroundColor(Color.green)
                        
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.init(UIColor.lightGray))
                    
                    Spacer().frame(height: 50)
                    
                    Text("비밀번호 확인")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    HStack {
                        TextField("다시 한번 입력해주세요.", text: $password)
                            .font(.subheadline)
                        Image(systemName: "checkmark.circle")
                            .font(Font.body.weight(.bold))
                            .foregroundColor(Color.green)
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.init(UIColor.lightGray))
                }
                
                Spacer().frame(height: 70)
                
                Button(action: {
                    
                }) {
                    Text("계속하기")
                }
                .buttonStyle(EmptyBlueButtonStyle())
                
                Spacer()
                
            }.navigationBarTitle("회원가입", displayMode: .inline)
                .padding(20)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
