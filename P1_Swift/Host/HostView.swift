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
    
    var brandsKor: [String] = ["애플","버뮤다","바디프렌드","까르띠에","다이슨","웨스코","비트라"]
    var brandsEng: [String] = ["Apple","Balmuda","Bodyfriend","Cartier","dyson","Wesco","vitra."]
    var brandsCount: Int = 7
    
    var body: some View {
        
        VStack {
            NavigationView {
                List {
                    ForEach(0..<brandsCount) { idx in
                        HStack(spacing: 10) {
                            
                            Image(self.brandsEng[idx])
                                .frame(width: 115.0, height: 50)
                            VStack(alignment: .leading) {
                                Text(self.brandsKor[idx])
                                    .foregroundColor(Color.gray)
                                Text(self.brandsEng[idx])
                            }.font(.footnote)
                        }.padding()
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
//        .edgesIgnoringSafeArea(.bottom)
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
                .background(Color.blue)
                .clipShape(TopRounded())
//                .cornerRadius(radius: 20)
        }
        
    }
}

struct TopRounded: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 25, height: 25))
    return Path(path.cgPath)
    }
}
