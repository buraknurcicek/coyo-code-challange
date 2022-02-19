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
    func completedWithError(_ error: String)
    func showPlaceholderView()
}

// MARK: - HomeViewModel
final class HomeViewModel: NSObject {

    weak var delegate: HomeViewModelProtocol?

    func fetchData() {
        let viewModel = PostCell.ViewModel()
        viewModel.title = "lfwdf"
        viewModel.description = ".dmöfds.fmö.sdsömd.fdö.mf"
        
        let viewModel1 = PostCell.ViewModel()
        viewModel1.title = "lfwdf"
        viewModel1.description = ".dmöfds.fmö.sdsömd.fdö.mf"
        
        self.delegate?.populateTableView(with: [viewModel, viewModel1])
    }
}
