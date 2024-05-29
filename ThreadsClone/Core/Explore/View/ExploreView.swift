//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 28/05/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack {
                    ForEach(0 ... 10, id :\.self){thread in
                        VStack {
                            HStack {
                                Image("user-profile")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40,height: 40)
                                    .clipShape(Circle())
                                VStack(alignment: .leading){
                                    Text("niwayannia21")
                                        .fontWeight(.semibold)
                                    Text("Wayan Nia")
                                }
                                .font(.footnote)
                                
                                Spacer()
                                
                                Text("Follow")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .frame(width: 100, height: 32)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(.systemGray4),lineWidth: 1)
                                        
                                    }
                            }
                            .padding(.horizontal)
                            
                            Divider()
                        }
                        .padding(.vertical,4)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ExploreView()
}
