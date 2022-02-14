//
//  LoadinView.swift
//  SwiftNewFeatures
//
//  Created by shehan karunarathna on 2022-02-14.
//

import SwiftUI

struct LoadinView: View {
    @StateObject var viewModel  = LoadingViewModel()
    @State var users :[User] = []
    @State var searchTxt = ""


    var body: some View {
        NavigationView{
            VStack{
                List(viewModel.users){
                    user in
                    VStack(spacing: 10){
                        HStack{
                            AsyncImage(url: URL(string: "https://picsum.photos/200/300"), scale: 1.0){
                                phase in
                                if let image = phase.image{
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                } else{
                                    Image(systemName: "house.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.gray)
                                }
                            }
                            VStack{
                                Text(user.name)
                                    .font(.headline)
                                Text(user.email)
                                    .font(.caption)
                            }
                        }
                       
                      
                    }
                }
    //            .frame(maxWidth:.infinity)
                // adding refresh control
                .refreshable (action: {
                    await viewModel.fetchUsers()
                })
                .searchable(text: $searchTxt) {
                    ForEach(viewModel.users.filter({ user in
                        searchTxt == "" ? true : user.email.lowercased().contains(searchTxt.lowercased())
                    })){user in
                        Text(user.name)

                    }
                       
                }
            }
           
            .navigationTitle("Pull to refresh")
           
        }
    }
}

struct LoadinView_Previews: PreviewProvider {
    static var previews: some View {
        LoadinView()
    }
}
