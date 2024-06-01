//
//  ThreadCreateViewModel.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import Foundation
import Firebase

class ThreadCreateViewModel : ObservableObject {
    @Published var caption = ""
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let thread = Thread(onwerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
