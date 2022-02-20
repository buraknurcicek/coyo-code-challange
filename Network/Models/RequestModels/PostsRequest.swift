//
//  PostsRequest.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

struct PostsRequest: RequestType {
    typealias ResponseType = [Post]
    var data: RequestData {
        return RequestData(path: "https://jsonplaceholder.typicode.com/posts")
    }
}
