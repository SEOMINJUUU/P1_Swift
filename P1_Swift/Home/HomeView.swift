//
//  HomeView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/05.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var location: String = "역삼동"
    var bannerCurrent: Int = 1
    var bannerTotal: Int = 5
    
    @State var items: [Item] = [
        Item(image: "pickitem1", name: "웰릭스 건조기", owner: ["랑랑"], distance: ["1분 거리"], benefits: "3,000원 / 5만원 LG쿠폰", tags: ["소음들어보세요","실제세탁보여드림"], bookmarked: false),
        Item(image: "pickitem2", name: "다이슨 청소기", owner: ["랑랑"], distance: ["1분 거리"], benefits: "3,000원 / 5만원 LG쿠폰", tags: ["소음들어보세요","실제세탁보여드림"], bookmarked: false),
        Item(image: "pickitem3", name: "보스 E5000 스피커 세트", owner: ["랑랑"], distance: ["1분 거리"], benefits: "3,000원 / 5만원 LG쿠폰", tags: ["소음들어보세요","실제세탁보여드림"], bookmarked: false),
        Item(image: "pickitem1", name: "웰릭스 건조기", owner: ["랑랑"], distance: ["1분 거리"], benefits: "3,000원 / 5만원 LG쿠폰", tags: ["소음들어보세요","실제세탁보여드림"], bookmarked: false),
        Item(image: "pickitem2", name: "다이슨 청소기", owner: ["랑랑"], distance: ["1분 거리"], benefits: "3,000원 / 5만원 LG쿠폰", tags: ["소음들어보세요","실제세탁보여드림"], bookmarked: false),
        Item(image: "pickitem3", name: "보스 E5000 스피커 세트", owner: ["랑랑"], distance: ["1분 거리"], benefits: "3,000원 / 5만원 LG쿠폰", tags: ["소음들어보세요","실제세탁보여드림"], bookmarked: false),
        Item(image: "pickitem1", name: "웰릭스 건조기", owner: ["랑랑"], distance: ["1분 거리"], benefits: "3,000원 / 5만원 LG쿠폰", tags: ["소음들어보세요","실제세탁보여드림"], bookmarked: false),
        Item(image: "pickitem2", name: "다이슨 청소기", owner: ["랑랑"], distance: ["1분 거리"], benefits: "3,000원 / 5만원 LG쿠폰", tags: ["소음들어보세요","실제세탁보여드림"], bookmarked: false),
        Item(image: "pickitem3", name: "보스 E5000 스피커 세트", owner: ["랑랑"], distance: ["1분 거리"], benefits: "3,000원 / 5만원 LG쿠폰", tags: ["소음들어보세요","실제세탁보여드림"], bookmarked: false)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HomeTitleBar(location: location)
                
                Image("home_banner")
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    Spacer()
                    
                    Text("\(bannerCurrent)/\(bannerTotal)")
                        .font(.caption)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 2)
                        .background(Color.white.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .offset(y: -40)
                        
                }.padding(.horizontal, 15)
                
                
                VStack(alignment: .leading) {
                    
                    Text("오늘의 Bodon 픽!")    // list section title
                        .fontWeight(.semibold)
                        .padding(.horizontal, 20)
                    
                    VStack {
                        
                        List(items) { item in
                            ZStack {
                                PickedItemRow(item:item)
                                NavigationLink(destination: DetailView()) {
                                    EmptyView()
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                        
                    }
                    .padding(.vertical, 10)
                    
                }
                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarTitle(Text(location))
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct Item: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    
    var owner: [String]?
    var distance: [String]?
    var benefits: String?
    
    var tags: [String]?
    var host: Int?
    var guest: Int?
    
    var bookmarked: Bool?
}

struct PickedItemRow: View {
    var item: Item
    
    var hostInfo: some View {
        if let owner = item.owner?[0], let distance = item.distance?[0], let benefits = item.benefits {
            return AnyView(HStack(spacing: 7) {
                Text(owner)
                    .bold()
                    .foregroundColor(Color.orange)
                Text(distance)
                    .bold()
                Text(benefits)
                    .foregroundColor(Color.blue)
            }
            .font(Font.system(size: 12)))
        } else {
            return AnyView(EmptyView())
        }
    }
    
    var body: some View {
        
        HStack(alignment: .center) {
            Image(item.image)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(item.name)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(Color.init(UIColor.darkGray))
                    Spacer()
                    Image(systemName: "bookmark")
                        .padding(.top, 10)
                        .foregroundColor(Color.gray)
                }
                hostInfo
                
                HStack {
                    ForEach(item.tags ?? [], id: \.self) {tag in
                        Text("#\(tag)").font(.caption).foregroundColor(Color.gray)
                    }
                    
                }
            }.padding(10)
            
        }
        
    }
}

struct HomeTitleBar: View {
    @State private var isShowModal: Bool = false
    
    var location: String
    
    var body: some View {
        VStack {
            HStack(spacing: 15){
                Button(action: {}) {
                    Image(systemName: "chevron.down.circle.fill")
                        .font(.title)
                        .foregroundColor(Color("mainColor"))
                }
                Text(location)
                Spacer()
                
                Button(action: {
                    self.isShowModal = true
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.black)
                }
                .sheet(isPresented: self.$isShowModal) {
                    CategorySearchView()
                }
            }
        }
        .padding()
    }
}
