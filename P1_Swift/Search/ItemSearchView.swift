//
//  ItemSearchView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/06.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct ItemSearchView: View {
    @State var keyword: String = "안마의자"
    
    var filters: [String] = ["정확도순", "인기순", "거리순", "인기 호스트순", "리워드 할인율순"]
    var brand: Brand = Brand(logo: "Bodyfriend", title: "Bodyfriend", subTitle: "바디프렌드", items: [],  itemCount: 10)
    var items: [Item] = [
        Item(image: "bodyfriend1", name: "바디프렌드 엘리자베스", distance: ["평균 걸어서 3분"], benefits: "바디프렌드 5% 할인 쿠폰"),
        Item(image: "bodyfriend2", name: "바디프렌드 엘리제", distance: ["평균 걸어서 10분"], benefits: "바디프렌드 5% 할인 쿠폰"),
        Item(image: "bodyfriend3", name: "바디프렌드 파라오2 블랙에디션", distance: ["평균 걸어서 5분"], benefits: "제품 구매 시 100,000원 할인"),
        Item(image: "bodyfriend4", name: "바디프렌드 팬텀2 코어", distance: ["평균 걸어서 5분"], benefits: "제품 구매 시 100,000원 할인"),
        Item(image: "bodyfriend1", name: "바디프렌드 팰리스2 코어", distance: ["평균 걸어서 5분"], benefits: "바디프렌드 5% 할인 쿠폰"),
        Item(image: "bodyfriend1", name: "바디프렌드 엘리자베스", distance: ["평균 걸어서 3분"], benefits: "바디프렌드 5% 할인 쿠폰"),
        Item(image: "bodyfriend2", name: "바디프렌드 엘리제", distance: ["평균 걸어서 10분"], benefits: "바디프렌드 5% 할인 쿠폰"),
        Item(image: "bodyfriend3", name: "바디프렌드 파라오2 블랙에디션", distance: ["평균 걸어서 5분"], benefits: "제품 구매 시 100,000원 할인"),
        Item(image: "bodyfriend4", name: "바디프렌드 팬텀2 코어", distance: ["평균 걸어서 5분"], benefits: "제품 구매 시 100,000원 할인"),
        Item(image: "bodyfriend1", name: "바디프렌드 팰리스2 코어", distance: ["평균 걸어서 5분"], benefits: "바디프렌드 5% 할인 쿠폰")
    ]
    var itemCount: Int = 10;
    
    var body: some View {
        
        VStack {
            VStack {
                HStack(spacing: 15) {
                    
                    TextField("", text: $keyword)
                        .frame(height: 40)
                        .modifier(ClearButton(text: $keyword))
                        .padding(.horizontal)
                        .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.gray, lineWidth: 0.3))
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("취소")
                            .font(.headline)
                            .foregroundColor(Color.black)
                    }
                }
                
                
                VStack(alignment: .leading) {
                    Text("추천태그")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                        .padding(.top, 10)
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(filters, id: \.self) { tag in
                                SmallRoundRectangle(text: tag)
                            }
                            Spacer()
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            Spacer()
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("'\(keyword)' 관련 \(itemCount)+")
                        .font(.headline)
                        .padding(.bottom, 20)
                    
                    ForEach(0..<brand.itemCount) { idx in
                        ItemRow(item: self.items[idx])
                        
                        if idx < self.brand.itemCount - 1 {
                            Divider()
                        }
                    }
                    
                    /** List 사용 -> 상품부분만 scroll
                     List(items) { item in
                     ItemRow(item: item)
                     }.padding(-10)
                     */
                }
                .padding(20)
            }
        }
    }
}

struct ItemSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSearchView()
    }
}
