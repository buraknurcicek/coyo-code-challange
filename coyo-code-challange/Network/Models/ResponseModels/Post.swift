//
//  Post.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

// MARK: - Post
struct Post: Codable {
    let userId, id: Int?
    let title, body: String?
}
