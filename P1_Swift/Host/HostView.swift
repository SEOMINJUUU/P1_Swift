//
//  HostView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/03.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct HostView: View {
    @State private var isShowModal: Bool = false
    
    var body: some View {
        
        NavigationView {
            List {
                HStack {
                    Image("Proto_Host_list1")
                }
                HStack {
                    Image("Proto_Host_list1")
                }
                HStack {
                    Image("Proto_Host_list1")
                }
                HStack {
                    Image("Proto_Host_list1")
                }
                HStack {
                    Image("Proto_Host_list1")
                }
                HStack {
                    Image("Proto_Host_list1")
                }
                HStack {
                    Image("Proto_Host_list1")
                }
                HStack(spacing: 50) {
                    
                    Image("Proto_Host_logo1")
                        .padding(10)
                    
                    
                    Text("Apple")
                }
            }
            .navigationBarTitle(Text("제휴브랜드 목록"), displayMode: .inline)
            
        }
        
    }
}

struct HostView_Previews: PreviewProvider {
    static var previews: some View {
        HostView()
    }
}
