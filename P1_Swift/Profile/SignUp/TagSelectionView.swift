//
//  TagSelectionView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/05.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct TagSelectionView: View {
    
    @State var isShowModal: Bool = false
    
    var tagCount: Int = 0
    let totalTagCount: Int = 11
    let tagList: [(icon: String, label: String)] =
        [
            ("car.fill", "자동차 용품"), ("flame.fill", "주방용품"), ("briefcase.fill", "사무 용품"),
            ("music.note", "오디오 / 스피커 제품"), ("headphones", "Hi-Fi / 헤드셋"), ("bag.fill", "가방 / 캐리어"),
            ("hare.fill", "애완동물 / 펫 제품"), ("house.fill", "가정용품"), ("mic.fill", "마이크 / 재택근무"),
            ("sportscourt.fill", "액티비티 / 레저용품"), ("desktopcomputer", "전자제품 / IT 용품")]
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                VStack(spacing: 10) {
                    Spacer()
                    
                    Text("\(tagCount)")
                        .font(.largeTitle)
                    Text("최소 5개 이상의 태그를 선택해주세요 :)")
                        .font(.subheadline)
                    
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 3)
                            .foregroundColor(Color.init(UIColor.systemGray5))
                        Rectangle()
                            .frame(width: 50, height: 3)
                            .foregroundColor(Color("mainColor"))
                    }.padding(.vertical)
                    
                    
                    VStack(spacing: 20) {
                        
                        ForEach(0 ..< totalTagCount / 2) { idx in
                            TagRow(leftTag: self.tagList[idx * 2], rightTag: self.tagList[idx * 2 + 1])
                        }
                        
                        HStack(spacing: 10) {
                            TagCapsuleWithIcon(tag: tagList[totalTagCount - 1])
                        }
                        .padding(.horizontal)
                    }
                    Spacer()
                    Spacer()
                    
                    
                    
                } .navigationBarTitle(Text("회원가입"), displayMode: .inline)
                    .navigationBarItems(trailing: Button(action: {
                        self.isShowModal = true
                    }) {
                        Text("건너뛰기")
                            .foregroundColor(Color.init(UIColor.appColor(.darkGrayColor)))
                    })
                
                if $isShowModal.wrappedValue {
                    GeometryReader{_ in
                        CustomModalPopups()
                    }
                }
            }
        }
    }
}

struct TagSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TagSelectionView()
    }
}

struct TagRow: View {
    var leftTag: (icon: String, label: String)
    var rightTag: (icon: String, label: String)
    
    var body: some View {
        HStack(spacing: 10) {
            
            TagCapsuleWithIcon(tag: leftTag)
            TagCapsuleWithIcon(tag: rightTag)
            
        }.padding(.horizontal)
    }
}

struct TagCapsuleWithIcon: View {   // TODO: selected tagCapsule color
    
    var tag:(icon: String, label: String)
    
    var body: some View {
        HStack {
            
            Image(systemName: tag.icon)
                .foregroundColor(Color("mainColor"))
                .padding(.leading, 10)
            
            Spacer()
            
            Text(tag.label)
                .font(.caption)
                .foregroundColor(Color.init(UIColor.darkGray))
            Spacer()
            
        }.padding(10)
            
            .background(Color.init(UIColor.systemGray5))
            .clipShape(Capsule())
    }
}

struct CustomModalPopups: View {
    @State private var isShowModal = true
    
    var body: some View {
        
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 15) {
                Spacer()
                ZStack{
                    Image(systemName: "tag.fill")
                        .foregroundColor(Color("mainColor"))
                    Image(systemName: "tag.fill")
                    .foregroundColor(Color.white)
                    .padding([.leading], -7)
                    Image(systemName: "tag.fill")
                        .foregroundColor(Color("mainColor"))
                        .padding([.leading], -14)
                }
                .font(.title)
                
                Text("5개 이상의 태그가 필요해요")
                    .font(.headline)
                    .bold()
                Text("회원님의 취향에 꼭 맞는 제품을\n추천해드리려구요!")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                
                Divider()

                Button(action: {
                    self.isShowModal.toggle()   // TODO: dismiss modal
                }) {
                    Text("알겠어요")
                    .foregroundColor(Color("mainColor"))
                }
            }
            .frame(width: 280, height: 180)
            .padding()
            .background(Color.white)
            .cornerRadius(5).shadow(radius: 20)
        }
        
    }
}
