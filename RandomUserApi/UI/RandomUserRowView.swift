//
//  RandomUserRowView.swift
//  RandomUserApi
//
//  Created by 홍정표 on 2023/05/15.
//

import SwiftUI

struct RandomUserRowView: View {
    
    var randomUser: RandomUser
    
    init(_ randomUser: RandomUser) {
        self.randomUser = randomUser
    }
    
    var body: some View {
        HStack{
            ProfileImageView(imageURL:  randomUser.profileImageUrl)
             Text(randomUser.name.description)
                .fontWeight(.heavy)
                .font(.system(size: 25))
                .lineLimit(2)
                .minimumScaleFactor(0.5)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading).padding(.vertical)
    }
}

struct RandomUserRowView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserRowView(RandomUser.getDummy())
    }
}
