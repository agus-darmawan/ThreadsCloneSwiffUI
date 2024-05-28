//
//  ThreadsTextViewModifier.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 28/05/24.
//

import SwiftUI

struct ThreadsTextViewModifier: ViewModifier{
    func body(content: Content) -> some View {
    content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
    }
}
