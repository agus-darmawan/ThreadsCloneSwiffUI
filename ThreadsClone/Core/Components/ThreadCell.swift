//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 29/05/24.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: thread.user, size: .small)
                VStack (alignment : .leading, spacing: 4){
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(thread.timestamp.timestampToString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        Button{
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    Text(thread.caption)
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


struct ThreadCellView_Preview : PreviewProvider{
    static var previews: some View {
        ThreadCell(thread: dev.thread)
    }
}
