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
