//
//  UserRequest.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 20.02.2022.
//

struct UserRequest: RequestType {
    typealias ResponseType = [User]
    var data: RequestData {
        return RequestData(path: "https://jsonplaceholder.typicode.com/users")
    }
}
