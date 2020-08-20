//
//  DetailView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/10.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        Image(systemName: "chevron.left")
            .foregroundColor(Color.black)
        }
    }
    
    var item: Item = Item(image: "bodyfriend4", name: "바디프렌드 팬텀2 코어" , distance: ["걸어서 5분", "걸어서 5분", "걸어서 15분"], benefits: "제품 구매 시 50,000원 할인", host: 105, guest: 3515)
    var hosts: [Host] = [
        Host(image: "host1", name: "신나는 뚱이", location: "길현제2동", providing: 117, distance: "걸어서 5분", tags: ["직접사용해보세요", "언제든지방문가능"]),
        Host(image: "host2", name: "오늘도 하하하", location: "길현제2동", providing: 117, distance: "걸어서 5분", tags: ["타제품과비교가능"]),
        Host(image: "host3", name: "내일도 아보카도", location: "길현제2동", providing: 117, distance: "걸어서 15분", tags: ["프라이빗한공간에서체험가능"])
    ]
    
    var relativeItems: [Item] = [
        Item(image: "bodyfriend1", name: "바디프렌드 엘리제", benefits: "바디프렌드 5% 할인 쿠폰"),
        Item(image: "bodyfriend2", name: "바디프렌드 엘리제", benefits: "바디프렌드 5% 할인 쿠폰"),
        Item(image: "bodyfriend3", name: "바디프렌드 엘리제", benefits: "바디프렌드 5% 할인 쿠폰"),
        Item(image: "bodyfriend4", name: "바디프렌드 엘리제", benefits: "바디프렌드 5% 할인 쿠폰")]
    
    var page: Int = 0
    
    var body: some View {
        
        VStack {
            HStack {
                btnBack
                Spacer()
            }.padding(.horizontal)
            
            
            ScrollView {
                ItemDetailRow(item: item)
                Spacer()
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
                    
                    RelativeItemsRow(relativeItems: relativeItems)
                }
                
            }
            .navigationBarTitle(Text("상세페이지"))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
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
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(item.name)
                    .font(.headline)
                    .bold()
                HStack(spacing: 7) {
                    Text(item.benefits ?? "")
                        .foregroundColor(Color.blue)
                }
                .font(.footnote)
                
                HStack {
                    Text("호스트 \(item.host ?? 0)")
                    Text("게스트 \(item.guest ?? 0)")
                }
                .font(.footnote)
                .foregroundColor(Color.gray)
                
            }.padding(15)
            Spacer()
            
            Image(systemName: "bookmark")
                .foregroundColor(Color.gray)
                .padding(10)
        }.padding()
    }
}

struct Host: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var location: String
    var providing: Int
    var distance: String
    
    var tags: [String]?
}

struct HostRow: View {
    var host: Host
    
    var body: some View {
        VStack {
            //            host.badge.map(BadgeRoundRectangle(color: $0, text: $1))
            //            BadgeRoundRectangle(host.badge.0, host.badge.1)
            
            HStack(spacing: 20) {
                Spacer()
                Image(host.image)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .scaledToFit()
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("\(host.name)")
                            .font(.subheadline)
                            .bold()
                        Spacer()
                        Text("\(host.distance)")
                            .foregroundColor(Color.blue)
                            .font(.subheadline)
                            .bold()
                    }
                    Text("체험제공 \(host.providing)회")
                        .font(.caption)
                        .foregroundColor(Color.blue)
                    
                    HStack {
                        ForEach(host.tags ?? [], id: \.self) {tag in
                            Text("#\(tag)").font(.caption).foregroundColor(Color.gray)
                        }
                    }
                }
                
                Spacer()
                
            }
        }
        .padding(.vertical, 10)
    }
}

struct RelativeItemsRow: View {
    var relativeItems: [Item]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: -20) {
                ForEach(relativeItems) { item in
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .shadow(color: Color.init(UIColor.systemGray4), radius: 5)
                            .frame(width: 140, height: 140)
                        
                        Text(item.name)
                            .font(.footnote)
                            .bold()
                            .foregroundColor(Color.gray)
                        Text(item.benefits ?? "")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(Color.blue)
                    }
                    .frame(maxWidth: 170, maxHeight: 170)
                    .padding()
                }
            }
        }
    }
}
