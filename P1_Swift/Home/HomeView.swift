//
//  HomeView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/05.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var benefits: String
    var image: String
}

struct HomeView: View {
    var location: String = "역삼동"
    @State var items: Array<Item> = [
        Item(name: "웰릭스 건조기", location: "상암동", benefits: "웰릭스 5% 할인 쿠폰", image: "pickitem1"),
        Item(name: "다이슨 청소기", location: "상암동", benefits: "다이슨 5% 할인 쿠폰", image: "pickitem2"),
        Item(name: "보스_스피커 세트", location: "상암동", benefits: "동일 제품 구매시 20,000원 할인", image: "pickitem3"),
        Item(name: "웰릭스 건조기", location: "상암동", benefits: "웰릭스 5% 할인 쿠폰", image: "pickitem1"),
        Item(name: "다이슨 청소기", location: "상암동", benefits: "다이슨 5% 할인 쿠폰", image: "pickitem2"),
        Item(name: "보스_스피커 세트", location: "상암동", benefits: "동일 제품 구매시 20,000원 할인", image: "pickitem3")]
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack {
                    HStack(spacing: 15){
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image(systemName: "chevron.down")
                                .font(.headline)
                                .foregroundColor(Color.init(UIColor.darkGray))
                        }
                        Text(location)
                        Image(systemName: "circle.fill")
                            .foregroundColor(Color.blue)
                            .font(.system(size: 7))
                            .padding([.top, .leading], -10)
                        Spacer()
                        Image(systemName: "magnifyingglass")
                    }
                }
                .padding()
                
                VStack(alignment: .center, spacing: 10) {
                    Text("우리집에서\n수익을 얻어요")
                        .multilineTextAlignment(.center)
                    Text("내가 가지고 있는 제품을 보여주면 다양한 리워드를 얻을 수 있어요")
                        .font(.caption)
                        .padding(10)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("보돈러를 위한 혜택보기")
                            .font(.footnote)
                    }
                    .frame(width: 160, height: 30)
                    .background(Color.blue)
                    .cornerRadius(20)
                    
                    
                }.padding(.vertical, 30)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                
                Spacer()
                Text("보고싶어요")
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(Color.blue)
                    .padding(.bottom, 10)
                
                VStack(alignment: .leading) {
                    
                    Text("오늘의 Bodon 픽!\n")
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                        .padding(.bottom, -20)
                    
                    List(items) { item in
                        ItemRow(item: item)
                    }
                    
                }
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

struct ItemRow: View {
    var item: Item
    
    var body: some View {
        HStack(alignment: .top) {
            Image(item.image)
            VStack(alignment: .leading, spacing: 3) {
                Text(item.name).font(.subheadline)
                Text(item.location).font(.caption).foregroundColor(Color.gray)
                Text(item.benefits).font(.caption).foregroundColor(Color.blue)
            }.padding(10)
            
            Spacer()
            Image(systemName: "bookmark")
                .padding(15)
                .foregroundColor(Color.gray)
        }
    }
}
