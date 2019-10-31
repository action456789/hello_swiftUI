//
//  LandmarkList.swift
//  hello_swiftUI
//
//  Created by ks on 2019/10/31.
//  Copyright © 2019 ks. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
//    状态是一个值或一组值，可以随时间变化，并影响视图的行为，内容或布局（关联出 View 的状态）
//    @State var showFavoritesOnly = true
    
//    @EnvironmentObject 获取注入的全局环境对象，与environmentObject配合使用
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            //        List {
            //            LandmarkRow(landmark: landmarkData[0])
            //            LandmarkRow(landmark: landmarkData[1])
            //        }
            
            // landmarkData里的元素要实现Identifiable协议
            //            List(landmarkData) { landmark in
            //                if !self.showFavoritesOnly || landmark.isFavorite {
            //                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
            //                        LandmarkRow(landmark: landmark)
            //                    }
            //                }
            //            }
            
            
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                .navigationBarTitle(Text("Landmarks"))
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList(landmark: landmarkData[0])
//                .environmentObject(UserData())
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//        }
        
        LandmarkList()
            .environmentObject(UserData()) // 注入需要被 SwiftUI 监听的全局环境变量
    }
}
