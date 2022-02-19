//
//  HomeViewModel.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import Foundation

// MARK: - HomeViewModelProtocol
protocol HomeViewModelProtocol: AnyObject {
    func populateTableView(with viewModels: [PostCell.ViewModel])
    func completedWithError()
    func showPlaceholderView()
}

// MARK: - HomeViewModel
final class HomeViewModel: NSObject {

    // MARK: - Properties
    weak var delegate: HomeViewModelProtocol?

    // MARK: - Functions
    func fetchData() {
        PostsRequest().execute(
            onSuccess: { (posts: [Post]) in
                print(posts)
            },
            onError: { (_) in
                self.delegate?.completedWithError()
            }
        )
    }
}
