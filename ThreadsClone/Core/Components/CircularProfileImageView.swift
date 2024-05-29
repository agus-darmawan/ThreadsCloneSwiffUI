//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 29/05/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("user-profile")
            .resizable()
            .scaledToFit()
            .frame(width: 40,height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
