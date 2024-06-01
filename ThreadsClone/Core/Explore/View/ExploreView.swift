//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 28/05/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack {
                    ForEach(viewModel.users) {user in
                        NavigationLink(value: user ){
                            VStack {
                                UserCell(user : user)
                                Divider()
                            }
                            .padding(.vertical,4)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ExploreView()
}
