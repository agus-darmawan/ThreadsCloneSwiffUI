//
//  Thread.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread:  Identifiable, Codable, Hashable{
    @DocumentID var threadId: String?
    let onwerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    var user: User?
}
