//
//  LoadinView.swift
//  SwiftNewFeatures
//
//  Created by shehan karunarathna on 2022-02-14.
//

import SwiftUI

struct LoadinView: View {
    let url = "https://jsonplaceholder.typicode.com/users"
    @State var users :[User] = []
    var body: some View {
        NavigationView{
            List(users){
                user in
                VStack(alignment:.leading, spacing: 10){
                    Text(user.name)
                        .font(.headline)
                    Text(user.email)
                        .font(.caption)
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
