//
//  AppDelegate.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let post = Post(userId: 1,
                        id: 1,
                        title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                        body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
        let viewModel = PostDetailViewModel(post: post)
        let rootViewController = PostDetailViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
        return true
    }
}

