//
//  TagSelectionView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/05.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct TagSelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    
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
                        .foregroundColor(Color.init(UIColor.systemBlue))
                }.padding(.vertical)
                
                
                VStack(spacing: 20) {
                    
                    ForEach(0 ..< totalTagCount / 2) { idx in
                        TagRow(leftTag: self.tagList[idx * 2], rightTag: self.tagList[idx * 2 + 1])
                    }
                    
                    HStack(spacing: 10) {
                        TagCapsule(tag: tagList[totalTagCount - 1])
                    }
                    .padding(.horizontal)
                }
                Spacer()
                Spacer()
                
            } .navigationBarTitle(Text("회원가입"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("건너뛰기")
                        .foregroundColor(Color.init(UIColor.appColor(.darkGrayColor)))
                })
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
            
            TagCapsule(tag: leftTag)
            TagCapsule(tag: rightTag)
            
        }.padding(.horizontal)
    }
}

struct TagCapsule: View {
    
    var tag:(icon: String, label: String)
    
    var body: some View {
        HStack {
            
            Image(systemName: tag.icon)
                .foregroundColor(Color.init(UIColor.systemBlue))
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

func calcWidth(leftLabel: String, rightLabel: String) -> (left: Double, right: Double) {
    
    return (0,0)
}
