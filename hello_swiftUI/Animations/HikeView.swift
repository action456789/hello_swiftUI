//
//  ContentView.swift
//  hello_swiftUI
//
//  Created by ks on 2019/10/30.
//  Copyright © 2019 ks. All rights reserved.
//

import SwiftUI

// 自定义状态变化添加动画：默认为淡入淡出
extension AnyTransition {
    static var moveAndFade: AnyTransition {
//        AnyTransition.move(edge: .trailing)
        
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                    .animation(nil)
                
                VStack(alignment: .leading) {
                    Text(verbatim: hike.name)
                        .font(.headline)
                    Text(verbatim: hike.distanceText)
                }
                
                Spacer()

                Button(action: {
                    withAnimation {
                        self.showDetail.toggle() // 可以为状态变化添加动画
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
//                        animation(nil) //防止旋转效果动画化
                        .scaleEffect(showDetail ? 1.5: 1)
                        .padding()
//                        .animation(.easeInOut)
//                        .animation(.spring())
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.slide)
//                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: hikeData[0])
                .padding()
            Spacer()
        }
    }
}
