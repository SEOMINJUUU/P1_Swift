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
    var page: Int = 0
    
    @State var items: [Item] = [
        Item(image: "pickitem1", name: "웰릭스 건조기", owner: "랑랑", distance: "1분 거리", benefits: "3,000원 / 5만원 LG쿠폰", tags: ["소음들어보세요","실제세탁보여드림"]),
        Item(image: "pickitem2", name: "다이슨 청소기", owner: "랑랑", distance: "1분 거리", benefits: "3,000원 / 5만원 LG쿠폰", tags: ["소음들어보세요","실제세탁보여드림"]),
        Item(image: "pickitem3", name: "보스 E5000 스피커 세트", owner: "랑랑", distance: "1분 거리", benefits: "3,000원 / 5만원 LG쿠폰", tags: ["소음들어보세요","실제세탁보여드림"])
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack {
                    HStack(spacing: 15){
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image(systemName: "chevron.down.circle.fill")
                                .font(.title)
                                .foregroundColor(Color.init(UIColor.systemBlue))
                        }
                        Text(location)
                        Spacer()
                        Image(systemName: "magnifyingglass")
                    }
                }
                .padding()
                
                Image("Home_Banner")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 30)
                //                    .frame(maxWidth: .infinity) // TODO: size
                
                
                VStack(alignment: .leading) {
                    
                    Text("오늘의 Bodon 픽!")
                        
                        .fontWeight(.semibold)
                        .padding(.horizontal, 20)
                        
                    VStack{
                        PickedItemRow(item: items[page * 3])
                        Divider()
                        PickedItemRow(item: items[page * 3 + 1])
                        Divider()
                        PickedItemRow(item: items[page * 3 + 2])
                        
//                        ForEach(0..<3) { idx in
//                            ItemRow(item: self.items[idx])
//                            if idx < 2 {
//                                Divider()
//                            }
//                        }
                    }
                    .padding(.vertical, 10)
                    
                }
                HStack {
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill").foregroundColor(Color.gray)
                    Image(systemName: "circle.fill").foregroundColor(Color.gray)
                }.font(.system(size: 6))
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
    
    var owner: String
    var distance: String
    var benefits: String
    
    var tags: [String]
}

struct PickedItemRow: View {
    var item: Item
    
    var body: some View {
        HStack(alignment: .center) {
            Image(item.image)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(item.name)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(Color.init(UIColor.darkGray))
                HStack(spacing: 7) {
                    Text(item.owner)
                        .bold()
                        .foregroundColor(Color.orange)
                    Text(item.distance)
                        .bold()
                    Text(item.benefits)
                        .foregroundColor(Color.blue)
                }
                .font(Font.system(size: 12))
                HStack {
                    ForEach(item.tags, id: \.self) {tag in
                        Text("#\(tag)").font(.caption).foregroundColor(Color.gray)
                    }
                    
                }
            }.padding(10)
            
            
            Image(systemName: "bookmark")
                .padding(.top, 10)
                .foregroundColor(Color.gray)
        }
    }
}
