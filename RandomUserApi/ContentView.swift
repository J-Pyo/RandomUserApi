//
//  ContentView.swift
//  RandomUserApi
//
//  Created by 홍정표 on 2023/05/15.
//

import SwiftUI

struct ContentView: View {
    //값 변화를 알기 위해 ObservedObject사용해줌
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        List(randomUserViewModel.randomUsers){ user in
            RandomUserRowView(user)
        }
//        List(0...100, id:\.self){ index in
//            RandomUserRowView()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
