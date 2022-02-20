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
    private var user: User?

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
                self?.configure(with: posts)
            }, onError: { [weak self] (_) in
                self?.delegate?.completedWithError()
            })
    }

    private func fetchUser() {
        UserRequest().execute(
            onSuccess: { [weak self] users in
                self?.user = users.first(where: {$0.id == 1})

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
