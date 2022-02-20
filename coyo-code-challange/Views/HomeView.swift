//
//  HomeView.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import UIKit

// MARK: - HomeViewDelegate
protocol HomeViewDelegate: AnyObject {
    func refresh()
}

// MARK: - HomeView
final class HomeView: UIView {

    // MARK: - Views
    private lazy var tableView = makeTableView()

    // MARK: - Private Properties
    private let refreshControl = UIRefreshControl()

    weak var delegate: HomeViewDelegate?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    // MARK: - Accessible Functions
    func setTableView(dataSource: UITableViewDataSource) {
        tableView.dataSource = dataSource
    }

    func setTableView(delegate: UITableViewDelegate) {
        tableView.delegate = delegate
    }

    func reloadTableView() {
        tableView.reloadData()
    }

    // MARK: - Private Functions
    @objc private func refresh(_ sender: AnyObject) {
        refreshControl.endRefreshing()
        delegate?.refresh()
    }
}

// MARK: - Private Extensions
private extension HomeView {
    func setupViews() {
        addTableView()
        addRefreshControl()
    }

    func addTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }

    func addRefreshControl() {
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }
}
