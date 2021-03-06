//
//  AffiliateItemListView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/04.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct Brand {
    var logo: String
    var title: String
    var subTitle: String
    var items: [String]
    var itemCount: Int
}

struct AffiliateItemListView: View {
    var brand: Brand = Brand(logo: "artek", title: "artek", subTitle: "aretk", items: ["listitem1", "listitem1", "listitem1", "listitem1", "listitem1", "listitem1", "listitem1"], itemCount: 7 )
    @State var keyword: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ScrollView {
                    
                    VStack{
                        HStack(spacing: 15){
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("뒤로")
                                    .font(.headline)
                                    .foregroundColor(Color.init(UIColor.darkGray))
                            }
                            TextField("", text: $keyword)
                                .frame(height: 40)
                                .modifier(ClearButton(text: $keyword))
                                .padding(.trailing)
                                .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.gray, lineWidth: 0.3))
                            
                        }
                        
                        Spacer()
                            .frame(height: 20)
                        
                        HStack {
                            Image("\(brand.logo)")

                            VStack(alignment: .leading) {
                                Text(brand.title)
                                    .font(.body)
                                    .fontWeight(.bold)
                                
                                Text("제휴상품 \(brand.itemCount)개")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.gray)
                            }
                            Spacer()
                        }
                        
                        Spacer()
                            .frame(height: 40)
                        
                        VStack(alignment: .leading) {
                            
                            ForEach(0..<brand.itemCount / 2) { row in // create number of rows
                                HStack {
                                    ItemTile(image: self.brand.items[row * 2])
                                    ItemTile(image: self.brand.items[row * 2 + 1])
                                }
                            }
                            
                            if brand.itemCount % 2 != 0 {
                                HStack {
                                    ItemTile(image: brand.items[brand.itemCount - 1])
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                NotAffiliatedBrand()
            }
            .navigationBarHidden(true)
            .navigationBarTitle(Text(brand.title))
            .edgesIgnoringSafeArea(.bottom)
            
            
        }
    }
}

struct AffiliateItemListView_Previews: PreviewProvider {
    static var previews: some View {
        AffiliateItemListView()
    }
}

struct ItemTile: View {
    var image: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image!)
                .resizable()
                .frame(maxWidth: 160, maxHeight: 160)
                .clipped()
            VStack(alignment: .leading, spacing: 2) {
                Text("제품 이름").font(.subheadline).fontWeight(.medium
                )
                Text("간단한 정보").font(.footnote).foregroundColor(Color.gray)
            }.padding([.leading, .bottom], 15)
        }
        
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String
    
    public func body(content: Content) -> some View {
        HStack {
            content
            Button(action: {
                self.text = ""
            }) {
                Image(systemName: "multiply.circle.fill")
                    .font(Font.footnote)
                    .foregroundColor(.black)
            }
        }
    }
}
