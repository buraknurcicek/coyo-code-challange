//
//  HomeViewController.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import UIKit

// MARK: - HomeViewController
final class HomeViewController: UIViewController {

    // MARK: - Private Properties
    private let homeView = HomeView()
    private var tableViewManager = HomeTableViewManager(viewModels: [])
    private var alertFactory: AlertFactoryProtocol = AlertFactory()
    private var viewModel: HomeViewModel

    // MARK: - Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    // MARK: - Life-Cycle
    override func loadView() {
        super.loadView()
        title = LocalizableManager.main_title.value
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        viewModel.configureApiCall()
    }

    // MARK: - Private Functions
    private func setDelegates() {
        homeView.delegate = self
        alertFactory.delegate = self
        tableViewManager.delegate = self
        viewModel.delegate = self
    }

    private func showAlert() {
        let alertData = AlertViewData(title: LocalizableManager.general_error_title.value,
                                      message: LocalizableManager.general_error_description.value,
                                      okActionTitle: LocalizableManager.general_ok.value)

        let alert = alertFactory.build(alertData: alertData)
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Navigation
    private func pushToPostDetail(index: Int) {
        let viewModel = PostDetailViewModel(post: viewModel.getPost(index: index))
        let controller = PostDetailViewController(viewModel: viewModel)
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
    func populateTableView(with viewModels: [PostCell.ViewModel]) {
        tableViewManager.viewModels = viewModels
        homeView.setTableView(dataSource: tableViewManager)
        homeView.setTableView(delegate: tableViewManager)
        homeView.reloadTableView()
    }

    func completedWithError() {
        showAlert()
    }

    func showPlaceholderView() {
        // TO DO - If is location services auth is denied, show placeholder view
    }
}

// MARK: - HomeTableViewManagerDelegate
extension HomeViewController: HomeTableViewManagerDelegate {
    func didSelect(indexPath: IndexPath) {
        pushToPostDetail(index: indexPath.row)
    }
}

// MARK: - HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
    func refresh() {
        viewModel.configureApiCall()
    }
}

// MARK: - HomeViewDelegate
extension HomeViewController: AlertActionDelegate {
    func okAction() {
        dismiss(animated: true)
    }
}
