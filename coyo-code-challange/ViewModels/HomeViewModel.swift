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

    // MARK: - Private Properties
    private let dispatchGroup = DispatchGroup()
    private var cellViewModels: [PostCell.ViewModel] = []
    private var posts: [Post] = []
    private var users: [User] = []

    weak var delegate: HomeViewModelDelegate?

    // MARK: - Accessible Functions
    func configureApiCall() {
        let operationQueue = OperationQueue()
        operationQueue.underlyingQueue = .global()

        operationQueue.addOperation {
            self.dispatchGroup.enter()
            self.fetchPosts()

            self.dispatchGroup.wait()

            self.dispatchGroup.enter()
            self.fetchUser()

            self.dispatchGroup.notify(queue: DispatchQueue.main) {
                //self.delegate?.populateHeaderView(with: self.headerViewModel)
                //self.delegate?.populateTableView(with: self.cellViewModels)
            }
        }
    }

    private func fetchPosts() {
        PostsRequest().execute(
            onSuccess: { [weak self] posts in
                self?.posts = posts
                self?.dispatchGroup.leave()
            }, onError: { [weak self] (_) in
                self?.delegate?.completedWithError()
                self?.dispatchGroup.leave()
            })
    }

    private func fetchUser() {
        UserRequest().execute(
            onSuccess: { [weak self] users in
                self?.users = users
                self?.dispatchGroup.leave()
            }, onError: { [weak self] (_) in
                self?.delegate?.completedWithError()
                self?.dispatchGroup.leave()
            })
    }

    func getPost(index: Int) -> Post {
        return posts[index]
    }

    // MARK: - Private Functions
    private func configure() {
        cellViewModels.removeAll()
        if posts.isEmpty {
            delegate?.showPlaceholderView()
            return
        }
        let viewModels = posts.map({
            PostCell.createViewModel(post: $0, user: users.first(where: {$0.id == }))
        })
        cellViewModels.append(contentsOf: viewModels)
        delegate?.populateTableView(with: cellViewModels)
    }
}
