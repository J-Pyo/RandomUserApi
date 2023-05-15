//
//  ProfileImageView.swift
//  RandomUserApi
//
//  Created by 홍정표 on 2023/05/15.
//

import SwiftUI
import URLImage

struct ProfileImageView: View {
    
    var imageURL: URL
    
    var body: some View {
        URLImage(imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }.clipShape(Circle())
            .frame(width: 50, height: 60)
            .overlay(Circle().stroke(Color.init(.yellow), lineWidth: 2 ))
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        let url: URL = URL(string: "https://randomuser.me/api/portraits/women/75.jpg")!
        ProfileImageView(imageURL: url)
    }
}
