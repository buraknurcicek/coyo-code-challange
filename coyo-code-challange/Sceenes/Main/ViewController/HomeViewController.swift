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
        title = "Main"
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
}

extension HomeViewController: HomeViewModelProtocol{
    func populateTableView(with viewModels: [PostCell.ViewModel]) {
        dataManager = HomeDataSourceManager(viewModels: viewModels)
        homeView.setTableView(dataSource: dataManager)
        homeView.reloadTableView()
    }

    func completedWithError(_ error: String) {
        // TODO - Show Alert
    }
    
    func showPlaceholderView() {
        // TODO - If is location services auth is denied, show placeholder view
    }
}
