//
//  CategorySearchView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/06.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct CategorySearchView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var keyword: String = ""
    
    var tags: [String] = ["주방", "자동차 용품", "아기"]
    var categoryList: [(String, String)] = [
        ("category1","가구"), ("category2","주방용품"), ("category3","액티비티"),
        ("category4","가전"), ("category5","모빌리티"), ("category6","반려동물"),
        ("category7","가전"), ("category8","주방용품"), ("category9","홈데코"),
        ("category10","여행/캠핑"), ("category11","실버"), ("category12","홈피트니스")]
    
    let col: Int = 3
    var row: Int = 4
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 15) {
                    
                    TextField("", text: $keyword)
                        .frame(height: 40)
                        .padding(.trailing)
                        .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.gray, lineWidth: 0.3))
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("취소")
                            .font(.headline)
                            .foregroundColor(Color.black)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("추천태그")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                        .padding(.vertical, 5)
                    HStack {
                        ForEach(tags, id: \.self) { tag in
                            SmallRoundRectangle(text: tag)
                        }
                        Spacer()
                    }
                }
                Spacer()
                
                VStack{
                    ForEach(0..<row) { rIdx in
                        HStack{
                            ForEach(0..<self.col) { cIdx in
                                CategoryCell(category: self.categoryList[rIdx * 3 + cIdx])
                            }
                        }
                    }
                }
                Spacer()
                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarTitle(Text("검색"))
            .padding()
            
        }
    }
}

struct CategorySearchView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySearchView()
    }
}

struct SmallRoundRectangle: View {
    var text: String
    
    var body: some View {
        Text("   \(text)   ")
            .font(.caption)
            .padding(5)
            .foregroundColor(Color.gray)
            .overlay(RoundedRectangle(cornerRadius: 40)
                .stroke(Color.gray, lineWidth: 0.3))
    }
}

struct CategoryCell: View {
    var category: (image: String, label: String)
    
    var body: some View {
        VStack {
            Image(category.image)
            Text(category.label)
                .font(.subheadline)
        }
    }
}

