//
//  RandomUserViewModel.swift
//  RandomUserApi
//
//  Created by 홍정표 on 2023/05/15.
//

import Foundation
import Combine
import Alamofire

//ObervableObject로 값의 변화를 관찰해줌
class RandomUserViewModel: ObservableObject{
    
    //MARK: Properties
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    var baseURL = "https://randomuser.me/api/?results=100"
    //생성 할때 서버와 통신
    init(){
        fetchRandomUser()
    }
    
    func fetchRandomUser(){
        AF.request(baseURL)
            .publishDecodable(type: RandomUserResponse.self) // model type에 맞춰 decode
            .compactMap{ $0.value } // filtering 및 optional 해제
            .map{ $0.results } // 필터링
            .sink(receiveCompletion: { completion in
                switch completion{
                case .failure(let error):
                    print("error: \(error)")
                case .finished:
                    print("complete : \(completion)")
                }
            }, receiveValue: { receivedValue in
                print("receivedValue : \(receivedValue.count)")
                self.randomUsers = receivedValue // 구독되어 있는 randomUser에 값 넣어주기
            }).store(in: &subscription) // 해제
    }
}
