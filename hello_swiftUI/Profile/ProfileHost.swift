//
//  ProfileHost.swift
//  hello_swiftUI
//
//  Created by ks on 2019/10/31.
//  Copyright © 2019 ks. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    // 通过@Environment 获取SwiftUI系统级别的设定
    @Environment(\.editMode) var mode
    
    // 获取注入的全局环境变量
    @EnvironmentObject var userData: UserData
    
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
