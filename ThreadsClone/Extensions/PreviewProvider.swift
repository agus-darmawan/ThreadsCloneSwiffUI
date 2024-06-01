//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    let user = User(
        id: NSUUID().uuidString,
        fullname: "Agus Darmawan", 
        email: "wayanagus.dr@gmmail.com",
        username: "agusdarmawn",
        profileImageUrl: nil,
        bio: nil
    )
}
