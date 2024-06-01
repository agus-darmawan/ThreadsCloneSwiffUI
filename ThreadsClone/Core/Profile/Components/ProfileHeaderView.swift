//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    init(user : User?){
        self.user = user
    }
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                VStack (alignment: .leading) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(user?.username ??  "")
                        .font(.subheadline)
                }
                if let bio = user?.bio{
                    Text(bio)
                        .font(.footnote)
                }
                Text("1K follower")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            CircularProfileImageView()
        }
    }
}


struct ProfileHeaderView_Preview : PreviewProvider{
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}

