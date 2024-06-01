//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 28/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = ContentViewModel()
    var body: some View {
        Group {
            if viewModel.userSesion != nil {
                ThreadTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
