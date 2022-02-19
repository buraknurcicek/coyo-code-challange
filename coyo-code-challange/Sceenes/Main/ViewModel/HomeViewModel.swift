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
    private var cellViewModels: [PostCell.ViewModel] = []

    weak var delegate: HomeViewModelProtocol?

    // MARK: - Functions
    func fetchData() {
        PostsRequest().execute(
            onSuccess: { [weak self] posts in
                self?.configure(with: posts)
            }, onError: { [weak self] (_) in
                self?.delegate?.completedWithError()
            })
    }

    private func configure(with posts: [Post]) {
        let viewModels = posts.map({
            PostCell.createViewModel(with: $0)
        })
        cellViewModels.append(contentsOf: viewModels)
        delegate?.populateTableView(with: cellViewModels)
    }
}
