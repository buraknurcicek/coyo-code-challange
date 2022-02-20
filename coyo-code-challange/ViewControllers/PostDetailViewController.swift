//
//  PostDetailViewController.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 20.02.2022.
//

import UIKit

// MARK: - PostDetailViewController
final class PostDetailViewController: UIViewController {

    // MARK: - Private Properties
    private let postDetailView = PostDetailView()
    private var tableViewManager = PostDetailTableViewManager(viewModels: [])
    private var alertFactory: AlertFactoryProtocol = AlertFactory()
    private var viewModel: PostDetailViewModel

    // MARK: - Init
    init(viewModel: PostDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    // MARK: - Life-Cycle
    override func loadView() {
        super.loadView()
        title = LocalizableManager.post_detail_title.value
        view = postDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchData()
    }

    // MARK: - Private Functions
    private func showAlert() {
        let alertData = AlertViewData(title: LocalizableManager.general_error_title.value,
                                      message: LocalizableManager.general_error_description.value,
                                      okActionTitle: LocalizableManager.general_ok.value)

        let alert = alertFactory.build(alertData: alertData)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - HomeViewModelDelegate
extension PostDetailViewController: PostDetailViewModelDelegate {
    func populateTableView(with viewModels: [CommentCell.ViewModel]) {
        tableViewManager = PostDetailTableViewManager(viewModels: viewModels)
        postDetailView.setTableView(dataSource: tableViewManager)
        postDetailView.reloadTableView()
    }

    func populateHeaderView(with post: Post, commentCount: Int) {
        let viewModel = HeaderView.ViewModel()
        viewModel.title = post.title
        viewModel.description = post.body
        viewModel.commentCount = commentCount.toString
        postDetailView.populateHeaderView(with: viewModel)
    }

    func completedWithError() {
        showAlert()
    }

    func showPlaceholderView() {
        // TO DO - If is location services auth is denied, show placeholder view
    }
}
