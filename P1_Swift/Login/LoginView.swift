//
//  LoginView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/03.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var email: String = ""
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "xmark")
                        .font(Font.title.weight(.regular))
                }.foregroundColor(Color.black)
                Spacer()
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                
                Spacer().frame(height: 80)
                Text("보여주고 돈벌어요")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer().frame(height: 80)
                
                
                Text("먼저 로그인이 필요해요")
                    .font(.subheadline)
                    .foregroundColor(Color.init(UIColor.darkGray))
                
                TextField("이메일 주소를 입력해주세요.", text: $email)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.init(UIColor.lightGray))
                Spacer()
                
                
                Button(action: {
                    
                }) {
                    Text("계속하기")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, minHeight: 45)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                    )
                }.padding(.vertical, 10)
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("이미 계정이 있으신가요? 로그인 하기")
                            .font(.caption)
                            .underline()
                    }
                    
                    Spacer()
                }
                Spacer()
                
            }
            
            
            Rectangle()
                .frame(height: 1.5)
                .foregroundColor(Color.gray)
                .padding(.vertical, 20.0)
            Text("간편 로그인")
                .font(.caption)
                .fontWeight(.bold)
                .frame(width: 90)
                .background(Color.white)
                .foregroundColor(Color.init(UIColor.darkGray))
                .padding(.vertical, -35)
            
            
            VStack {
                Button(action: {
                    
                }) {
                    Text("카카오톡으로 로그인")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, maxHeight: 45)
                .background(Color.yellow)
                .foregroundColor(Color.white)
                .cornerRadius(5)
                .padding(.vertical, 5)
                
                Button(action: {
                    
                }) {
                    Text("네이버로 로그인")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, maxHeight: 45)
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(5)
                .padding(.vertical, 5)
                
                Button(action: {
                    
                }) {
                    Text("페이스북으로 로그인")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, maxHeight: 45)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(5)
                .padding(.vertical, 5)
            }
        }.padding(20)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
