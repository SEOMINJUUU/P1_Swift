//
//  HostView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/03.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct HostView: View {
    //    @State private var isShowModal: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var brands: [String] = ["Apple", "Balmuda", "Bodyfriend", "Cartier", "dyson", "Wesco", "vitra."]
    
    var body: some View {
        
        VStack {
            NavigationView {
                List {
                    
                    ForEach(brands, id: \.self) { brand in
                        HStack(spacing: 10) {
                            
                            Image(brand)
                                .frame(width: 115.0, height: 50)
                            
                            Text(brand)
                        }
                    }
                    
                }
                .navigationBarTitle(Text("제휴브랜드 목록"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("닫기")
                        .foregroundColor(Color.black)
                })
            }
            VStack(alignment: .leading) {
                NotAffiliatedBrand()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct HostView_Previews: PreviewProvider {
    static var previews: some View {
        HostView()
    }
}

struct NotAffiliatedBrand: View {
    
    var body: some View {
        
        Button(action: {
            
        }){
            Text("찾으시는 브랜드가 없으신가요?\n")
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, minHeight: 80)
                .background(Color.black)
        }
        
    }
}
