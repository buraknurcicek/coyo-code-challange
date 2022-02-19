//
//  Comment.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import Foundation

// MARK: - Comment
struct Comment: Codable {
    let postId, id: Int?
    let name, email, body: String?
}
