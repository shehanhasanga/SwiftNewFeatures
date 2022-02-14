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
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.caption)
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
