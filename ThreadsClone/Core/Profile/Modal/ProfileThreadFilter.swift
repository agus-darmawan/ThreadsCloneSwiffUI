//
//  ProfileThreadFilter.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 31/05/24.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable{
    case threads
    case replies

    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int {return self.rawValue}
}
