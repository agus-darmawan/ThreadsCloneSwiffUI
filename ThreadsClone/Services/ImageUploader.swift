//
//  ImageUploader.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import Foundation
import Firebase
import FirebaseStorage
import SwiftUI

struct ImageUploader{
    static func uploadImage(_ image : UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {return nil}
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile/images/\(fileName)")
        
        do{
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        }catch{
            print("DEBUG: error upload image with : \(error.localizedDescription)")
            return nil
        }
    }
}
