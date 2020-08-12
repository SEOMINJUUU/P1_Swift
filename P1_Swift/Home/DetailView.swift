//
//  DetailView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/10.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var location: String = "역삼동"
    var item: Item = Item(image: "pickitem1", name: "바디프렌드 팬텀2 코어" , distance: ["걸어서 5분", "걸어서 5분", "걸어서 15분"], benefits: "100,000원 할인 / LG쿠폰", host: 105, guest: 3515)
    var hosts: [Host] = [
        Host(name: "신나는 아보카도", location: "길현제2동", providing: 117, distance: "걸어서 5분", badge: ["red": "우리 동네 BEST"]),
        Host(name: "오늘도 하하하", location: "길현제2동", providing: 117, distance: "걸어서 5분", badge: ["green": "위치 기반 추천"]),
        Host(name: "내일도 아보카도", location: "길현제2동", providing: 117, distance: "걸어서 5분")
    ]
    
    var page: Int = 0
    
    var body: some View {
        
        VStack {
            
            HomeTitleBar(location: location)
            Spacer()
            ScrollView {
                ItemDetailRow(item: item)
                
                MapView()
                    .frame(height: 200)
                
                VStack(alignment: .leading) {
                    Text("Top 호스트")
                        .bold()
                        .padding()
                    
                    ForEach(0..<3) { idx in
                        HostRow(host: self.hosts[self.page * 3 + idx])
                        Divider()
                            .foregroundColor(Color.gray)
                    }
                }
                
                VStack(alignment: .center) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("10개의 리뷰 더보기")
                    }.font(.subheadline)
                }
                .padding()
                
                Spacer()
                
                Rectangle()
                    .frame(height: 20)
                    .foregroundColor(Color.init(UIColor.systemGray5))
                
                VStack(alignment: .leading) {
                    
                    Text("이 제품과 관련된 다른 제품")
                        .bold()
                        .padding()
                    
                    ScrollView(.horizontal) {
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Image("listitem1")
                                    .resizable()
                                    .scaledToFit()
                                Text("바디프렌드 엘리제")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(Color.gray)
                                Text("바디프렌드 5% 할인 쿠폰")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(Color.blue)
                            }
                            .frame(maxWidth: 170, maxHeight: 170)
                            .padding()
                            
                        }.padding()
                    }
                }
            }
        }
        
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
        //                Group {
        //                    DetailView()
        //                        .previewDevice("iPhone 8")
        //                        .environment(\.colorScheme, .light)
        //
        //                    DetailView()
        //                        .previewDevice("iPhone 11")
        //                        .environment(\.colorScheme, .light)
        //
        //                    DetailView()
        //                        .previewDevice("iPhone 11 Pro")
        //                        .environment(\.colorScheme, .dark)
        //
        //                    DetailView()
        //                        .previewDevice("iPhone 11 Pro Max")
        //                        .environment(\.colorScheme, .dark)
        //                }
    }
}

struct ItemDetailRow: View {
    var item: Item
    
    var body: some View {
        HStack(alignment: .top) {
            Image(item.image)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(item.name)
                    .font(.headline)
                    .bold()
                HStack(spacing: 7) {
                    Text(item.benefits)
                        .foregroundColor(Color.blue)
                }
                .font(.footnote)
                
                HStack {
                    Text("호스트 \(item.host ?? 0)")
                    Text("게스트 \(item.guest ?? 0)")
                }
                .font(.footnote)
                .foregroundColor(Color.gray)
                
                
            }.padding(10)
            
            Spacer()
            
            Image(systemName: "bookmark")
                .foregroundColor(Color.gray)
        }.padding()
    }
}

struct Host: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var providing: Int
    var distance: String
    
    var badge: [String: String]?
}

struct HostRow: View {
    var host: Host
    
    var body: some View {
        VStack {
            //            host.badge.map(BadgeRoundRectangle(color: $0, text: $1))
            //            BadgeRoundRectangle(host.badge.0, host.badge.1)
            
            HStack(spacing: 20) {
                Image("listitem1")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .scaledToFit()
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(host.name)")
                        .font(.subheadline)
                        .bold()
                    
                    Text("\(host.location) / 체험제공 \(host.providing)회")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                }
                
                Spacer()
                
                Text("\(host.distance)")
                    .foregroundColor(Color.blue)
                    .font(.subheadline)
                    .bold()
            }
        }.padding(.horizontal, 20)
    }
}

//struct BadgeRoundRectangle: View {
//    var badge: [String: String]
////    var color: String
////    var text: String
//
//    var body: some View {
//        Text("   \(badge)   ")
//            .font(.caption)
//            .padding(5)
//            .foregroundColor(Color.gray)
//            .overlay(RoundedRectangle(cornerRadius: 40)
//                .stroke(Color.gray, lineWidth: 0.3))
//    }
//}
