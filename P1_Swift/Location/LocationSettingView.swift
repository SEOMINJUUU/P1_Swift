//
//  LocationSettingView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/04.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct LocationSettingView: View {
    @State var value: Float = 0.0
    var near: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack(alignment: .bottom) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("문정동").foregroundColor(Color.white)
                    }
                    .buttonStyle(SelectedButtonStyle())
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("상암동")
                    }
                    .buttonStyle(UnselectedButtonStyle())
                }
                
                Spacer()
                Text("근처 동네 \(near)개")
                Slider(value: $value)
                    .padding(.horizontal, 40)
                
                Spacer()
                Spacer()
                
                Image("buildings")
                
                
            }.navigationBarTitle(Text("내 동네 설정하기"), displayMode: .inline)
                
                .edgesIgnoringSafeArea(.bottom)
            
            
        }
    }
}

struct LocationSettingView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSettingView()
    }
}


struct SelectedButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.body)
            .frame(width: 120, height: 10)
            .padding(20)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(10)
    }
}

struct UnselectedButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 100, height: 30)
            .font(.footnote)
            .foregroundColor(Color.init(UIColor.darkGray))
            .background(Color.init(UIColor.systemGray5))
            .cornerRadius(10)
    }
}
