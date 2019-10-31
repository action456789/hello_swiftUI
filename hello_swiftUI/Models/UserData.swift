//
//  UserData.swift
//  hello_swiftUI
//
//  Created by ks on 2019/10/31.
//  Copyright © 2019 ks. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
//  @Published表示需要被 SwiftUI 监听
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
