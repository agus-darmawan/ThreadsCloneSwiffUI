//
//  ThreadTabView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 28/05/24.
//

import SwiftUI

struct ThreadTabView: View {
    @State private var selectedTab = 0
    @State private var showThreadCreationView = false
    var body: some View {
        TabView(selection: $selectedTab){
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab  == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear{selectedTab = 0}
                .tag(0)
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear{selectedTab = 1}
                .tag(1)
            Text("")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear{selectedTab = 2}
                .tag(2)
            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab  == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear{selectedTab = 3}
                .tag(3)
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab  == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear{selectedTab = 4}
                .tag(4)
        }
        .onChange(of: selectedTab) { oldValue, newValue in
                   showThreadCreationView = selectedTab == 2
            }
        .sheet(isPresented: $showThreadCreationView,onDismiss:{
            selectedTab = 0
        }, content: {
            ThreadCreationView()
        })
        .tint(.black)
    }
}

#Preview {
    ThreadTabView()
}
