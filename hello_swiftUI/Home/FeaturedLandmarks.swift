//
//  FeaturedLandmarks.swift
//  hello_swiftUI
//
//  Created by ks on 2019/10/31.
//  Copyright © 2019 ks. All rights reserved.
//

import SwiftUI

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct FeaturedLandmarks_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedLandmarks(landmarks: landmarkData)
    }
}
