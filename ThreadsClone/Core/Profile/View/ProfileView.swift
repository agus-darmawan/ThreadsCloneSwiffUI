//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 28/05/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter : ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack(spacing:20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        VStack (alignment: .leading) {
                            Text("Agus Darmawan")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("agusdarmwn")
                                .font(.subheadline)
                        }
                        Text("Lorem ipsum dolor sit amet, consectetur")
                            .font(.footnote)
                        Text("1K follower")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    CircularProfileImageView()
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                })
                
                VStack{
                    HStack{
                        ForEach(ProfileThreadFilter.allCases) {filter in
                            VStack{
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                
                                if(selectedFilter ==  filter){
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: filterBarWidth,height: 1)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                }else{
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: filterBarWidth,height: 1)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring()){
                                    selectedFilter = filter
                                }
                            }
                        }
                    }
                    LazyVStack {
                        ForEach(0 ... 10, id :\.self){thread in
                            ThreadCell()
                        }
                    }
                }
                .padding(.vertical,8)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
