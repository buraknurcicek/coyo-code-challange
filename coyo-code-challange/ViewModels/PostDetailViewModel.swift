//
//  PostDetailViewModel.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 20.02.2022.
//

import Foundation

// MARK: - PostDetailViewModel
final class PostDetailViewModel: NSObject {

    // MARK: - Private Properties
    private var post: Post

    // MARK: - Init
    init(post: Post) {
        self.post = post
    }

    // MARK: - Accessible Functions
    func fetchData() {
        
    }
}
