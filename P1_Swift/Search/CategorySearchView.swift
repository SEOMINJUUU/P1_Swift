//
//  CategorySearchView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/06.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct CategorySearchView: View {
    @State var keyword: String = "바디프렌드"
    
    var tags: [String] = ["주방", "자동차 용품", "아기"]
    var brand: Brand = Brand(logo: "Bodyfriend", title: "Bodyfriend", subTitle: "바디프렌드", items: [],  itemCount: 10)
    var items: [Item] = [
        Item(image: "bodyfriend1", name: "바디프렌드 엘리자베스", owner: "", distance: "평균 걸어서 3분", benefits: "바디프렌드 5% 할인 쿠폰", tags: []),
        Item(image: "bodyfriend2", name: "바디프렌드 엘리제", owner: "", distance: "평균 걸어서 10분", benefits: "바디프렌드 5% 할인 쿠폰", tags: []),
        Item(image: "bodyfriend3", name: "바디프렌드 파라오2 블랙에디션", owner: "", distance: "평균 걸어서 5분", benefits: "제품 구매 시 100,000원 할인", tags: []),
        Item(image: "bodyfriend4", name: "바디프렌드 팬텀2 코어", owner: "", distance: "평균 걸어서 5분", benefits: "제품 구매 시 100,000원 할인", tags: []),
        Item(image: "bodyfriend1", name: "바디프렌드 팰리스2 코어", owner: "", distance: "평균 걸어서 5분", benefits: "바디프렌드 5% 할인 쿠폰", tags: []),
        Item(image: "bodyfriend1", name: "바디프렌드 엘리자베스", owner: "", distance: "평균 걸어서 3분", benefits: "바디프렌드 5% 할인 쿠폰", tags: []),
        Item(image: "bodyfriend2", name: "바디프렌드 엘리제", owner: "", distance: "평균 걸어서 10분", benefits: "바디프렌드 5% 할인 쿠폰", tags: []),
        Item(image: "bodyfriend3", name: "바디프렌드 파라오2 블랙에디션", owner: "", distance: "평균 걸어서 5분", benefits: "제품 구매 시 100,000원 할인", tags: []),
        Item(image: "bodyfriend4", name: "바디프렌드 팬텀2 코어", owner: "", distance: "평균 걸어서 5분", benefits: "제품 구매 시 100,000원 할인", tags: []),
        Item(image: "bodyfriend1", name: "바디프렌드 팰리스2 코어", owner: "", distance: "평균 걸어서 5분", benefits: "바디프렌드 5% 할인 쿠폰", tags: [])
    ]
    var itemCount: Int = 10;
    
    var body: some View {
        
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
            .padding(.horizontal, 20)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("'바디프렌드' 관련 제품 \(itemCount)")
                        .font(.headline)
                        .padding(.bottom, 30)
                    
                    
                    Text("브랜드")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    BrandRow(brand: brand)
                    
                    
                    Text("제품")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    
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

struct CategorySearchView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySearchView()
    }
}

struct BrandRow: View {
    var brand: Brand
    var body: some View {
        HStack {
            Image(brand.logo)
                .resizable()
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(brand.title)
                    .font(.subheadline)
                Text(brand.subTitle)
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                Text("제휴상품 총 \(brand.itemCount)개")
                    .font(.footnote)
                    .foregroundColor(Color.blue)
            }
        }
        .padding()
    }
}

struct ItemRow: View {
    var item: Item
    
    var body: some View {
        HStack(alignment: .center) {
            Image(item.image)
                .resizable()
                .frame(width: 85, height: 85)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(item.name)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(Color.init(UIColor.darkGray))
                
                Text(item.distance)
                    .font(.caption)
                    .bold()
                    .foregroundColor(Color.init(UIColor.lightGray))
                Text(item.benefits)
                    .foregroundColor(Color.blue)
                    
                    .font(Font.system(size: 12))
                HStack {
                    ForEach(item.tags, id: \.self) {tag in
                        Text("#\(tag)").font(.caption).foregroundColor(Color.gray)
                    }
                }
            }
            .padding(10)
            Spacer()
            
            Image(systemName: "bookmark")
                .padding(.top, 10)
                .foregroundColor(Color.gray)
        }
    }
}
