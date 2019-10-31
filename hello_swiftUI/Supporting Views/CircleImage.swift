//
//  CircleImage.swift
//  hello_swiftUI
//
//  Created by ks on 2019/10/30.
//  Copyright © 2019 ks. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("WX20191030-173012"))
    }
}
