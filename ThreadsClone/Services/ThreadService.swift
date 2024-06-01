//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    static func uploadThread(_ thread:Thread) async throws{
        guard let threadData = try? Firestore.Encoder().encode(thread) else {return}
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
   }
}
