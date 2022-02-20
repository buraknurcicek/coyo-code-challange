//
//  CommentsRequest.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 20.02.2022.
//

struct CommentsRequest: RequestType {
    typealias ResponseType = [Comment]
    var data: RequestData {
        return RequestData(path: "https://jsonplaceholder.typicode.com/comments?postId=1")
    }
}
