//
//  HomeView.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import UIKit

// MARK: - HomeView
final class HomeView: UIView {

    // MARK: - Views
    lazy var tableView = makeTableView()

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

    func reloadTableView() {
        tableView.reloadData()
    }
}

// MARK: - Private Extensions
private extension HomeView {
    func setupViews() {
        addTableView()
    }

    func addTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        return tableView
    }
}
