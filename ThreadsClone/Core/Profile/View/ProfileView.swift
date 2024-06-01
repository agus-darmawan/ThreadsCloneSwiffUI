//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 28/05/24.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    @State private var selectedFilter : ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
 
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack(spacing:20) {
                ProfileHeaderView(user: user)
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
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    AuthService.shared.signOut()
                }, label: {
                    Image(systemName: "line.3.horizontal")
                })
            }
        }
        .padding(.horizontal)
    }
}


struct ProfileView_Preview : PreviewProvider{
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}

