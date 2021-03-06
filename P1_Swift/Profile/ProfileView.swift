//
//  ProfileView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/11.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State var isShowModal: Bool = true
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: LocationSettingView()) {
                    Text("내 동네 설정")
                }
                NavigationLink(destination: CertificationView()) {
                    Text("동네 인증하기")
                }
            }
        } .sheet(isPresented: self.$isShowModal) {
            LoginView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
