//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 29/05/24.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                Image("user-profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40,height: 40)
                    .clipShape(Circle())
                VStack (alignment : .leading, spacing: 4){
                    HStack {
                        Text("niwayannia21")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        Button{
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla id quam")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16){
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "heart")
                        })
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "bubble.right")
                        })
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "arrow.rectanglepath")
                        })
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "paperplane")
                        })
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                }
                
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell()
}
