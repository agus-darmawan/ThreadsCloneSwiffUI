//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 29/05/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView()
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
    }
}

#Preview {
    UserCell()
}
