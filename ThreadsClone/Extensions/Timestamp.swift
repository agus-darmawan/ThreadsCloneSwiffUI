//
//  Timestamp.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import Foundation
import Firebase

extension Timestamp {
    func timestampToString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second,.minute,.hour,.day,.month]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to : Date()) ?? ""
    }
}
