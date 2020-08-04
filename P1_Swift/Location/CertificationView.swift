//
//  CertificationView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/03.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct CertificationView: View {
    var current: String = "상암동"
    
    var body: some View {
        NavigationView {
            VStack {
                
                MapView().frame(minHeight: 400)
                
                VStack{
                    Spacer()
                    Text("현재 위치는 '\(current)' 입니다.")
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("동네 인증 완료하기")
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.bottom, 15)
                    
                    Button(action: {
                        
                    }) {
                        Text("인증하는 이유는 무엇인가요?")
                            .font(.caption)
                            .fontWeight(.medium)
                            .underline()
                    }
                    .foregroundColor(Color.gray)
                    Spacer()
                    
                }.padding(20)
                
            }.navigationBarTitle("동네 인증하기", displayMode: .inline)
        }
        
    }
}

struct CertificationView_Previews: PreviewProvider {
    static var previews: some View {
        CertificationView()
    }
}
