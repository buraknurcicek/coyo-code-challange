//
//  PostDetailViewModel.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 20.02.2022.
//

import Foundation

// MARK: - PostDetailViewModelDelegate
protocol PostDetailViewModelDelegate: AnyObject {
    func populateTableView(with viewModels: [CommentCell.ViewModel])
    func completedWithError()
    func showPlaceholderView()
}

// MARK: - PostDetailViewModel
final class PostDetailViewModel: NSObject {

    // MARK: - Private Properties
    private var cellViewModels: [CommentCell.ViewModel] = []
    private var post: Post
    private var comments: [Comment] = []

    weak var delegate: PostDetailViewModelDelegate?

    // MARK: - Init
    init(post: Post) {
        self.post = post
    }

    // MARK: - Accessible Functions
    func fetchData() {
        CommentsRequest().execute(
            onSuccess: { [weak self] comments in
                self?.comments = comments
                self?.configure(with: comments)
            }, onError: { [weak self] (_) in
                self?.delegate?.completedWithError()
            })
    }

    // MARK: - Private Functions
    private func configure(with comments: [Comment]) {
        cellViewModels.removeAll()
        if comments.isEmpty {
            delegate?.showPlaceholderView()
            return
        }
        let viewModels = comments.map({
            CommentCell.createViewModel(with: $0)
        })
        cellViewModels.append(contentsOf: viewModels)
        delegate?.populateTableView(with: cellViewModels)
    }
}
