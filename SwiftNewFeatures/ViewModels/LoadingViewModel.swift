//
//  LoadingViewModel.swift
//  SwiftNewFeatures
//
//  Created by shehan karunarathna on 2022-02-14.
//

import Foundation
class LoadingViewModel : ObservableObject{
    @Published var users : [User] = []
    let urlString:String = "https://jsonplaceholder.typicode.com/users"
    
    init() {
        Task.init {
                    await fetchUsers()
                }
//        await fetchUsers(urlString: urlString)
    }
    func fetchUsers() async{
        let session = URLSession(configuration: .default)
        guard let url = URL(string: urlString) else { return  }
        do{
           
//            let task = try await session.data(from: url)
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }

            let users = try JSONDecoder().decode([User].self, from:data)
            self.users = users
        }catch let error{
            print(error)
        }
    }
}

