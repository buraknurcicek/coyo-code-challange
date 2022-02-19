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
    private var viewModel: HomeViewModel
    private var dataManager = HomeDataSourceManager(viewModels: [])
    private var alertFactory: AlertFactoryService = AlertHelper()

    // MARK: - Private Properties

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
        alertFactory.delegate = self
        viewModel.delegate = self
        viewModel.fetchData()
    }

    // MARK: - Accessible Functions
    func setDailyForecastTableView(dataSource: UITableViewDataSource) {
        homeView.tableView.dataSource = dataSource
    }

    func reloadTableView() {
        homeView.tableView.reloadData()
    }

    private func showAlert() {
        let alertData = AlertViewData(title: LocalizableManager.general_error_title.value,
                                      message: LocalizableManager.general_error_description.value,
                                      okActionTitle: LocalizableManager.general_ok.value)

        let alert = alertFactory.build(alertData: alertData)
        present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: HomeViewModelProtocol {
    func populateTableView(with viewModels: [PostCell.ViewModel]) {
        dataManager = HomeDataSourceManager(viewModels: viewModels)
        homeView.setTableView(dataSource: dataManager)
        homeView.reloadTableView()
    }

    func completedWithError() {
        showAlert()
    }

    func showPlaceholderView() {
        // TO DO - If is location services auth is denied, show placeholder view
    }
}

extension HomeViewController: AlertActionDelegate {
    func okAction() {
        dismiss(animated: true)
    }
}
