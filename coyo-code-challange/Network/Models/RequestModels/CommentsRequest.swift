//
//  CommentsRequest.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 20.02.2022.
//

struct CommentsRequest: RequestType {

    typealias ResponseType = [Comment]

    let postId: Int

    var data: RequestData {
        return RequestData(path: "https://jsonplaceholder.typicode.com/comments?postId=\(postId)")
    }
}
