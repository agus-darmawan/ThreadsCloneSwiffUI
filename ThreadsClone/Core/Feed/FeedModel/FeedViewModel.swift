//
//  FeedViewModel.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    init(){
        Task{try await fetchThreads()}
    }
    func fetchThreads() async throws{
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThread()
    }
    
    private func fetchUserDataForThread() async throws{
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let onwerUid = thread.onwerUid
            let theadUser = try await UserService.fetchUser(withUid: onwerUid)
            
            threads[i].user = theadUser
        }
    }
}
 
