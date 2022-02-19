//
//  HomeViewModel.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import Foundation

// MARK: - HomeViewModelDelegate
protocol HomeViewModelDelegate: AnyObject {
    func populateTableView(with viewModels: [PostCell.ViewModel])
    func completedWithError()
    func showPlaceholderView()
}

// MARK: - HomeViewModel
final class HomeViewModel: NSObject {

    // MARK: - Properties
    private var cellViewModels: [PostCell.ViewModel] = []
    private var posts: [Post] = []
    weak var delegate: HomeViewModelDelegate?

    // MARK: - Accessible Functions
    func fetchData() {
        PostsRequest().execute(
            onSuccess: { [weak self] posts in
                self?.posts = posts
                self?.configure(with: posts)
            }, onError: { [weak self] (_) in
                self?.delegate?.completedWithError()
            })
    }

    func getPost(index: Int) -> Post {
        return posts[index]
    }
    
    // MARK: - Private Functions
    private func configure(with posts: [Post]) {
        cellViewModels.removeAll()
        if posts.isEmpty {
            delegate?.showPlaceholderView()
            return
        }
        let viewModels = posts.map({
            PostCell.createViewModel(with: $0)
        })
        cellViewModels.append(contentsOf: viewModels)
        delegate?.populateTableView(with: cellViewModels)
    }
}
