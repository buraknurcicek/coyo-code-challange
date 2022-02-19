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

    weak var delegate: HomeViewModelProtocol?

    func fetchData() {

        PostsRequest().execute { (posts: [Post]) in
            self.delegate?.completedWithError()
        } onError: { (error: Error) in
            print("rşekr")
        }
    }
}
