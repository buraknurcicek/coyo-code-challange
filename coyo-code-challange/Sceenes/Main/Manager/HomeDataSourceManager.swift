//
//  HomeDataSourceManager.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import UIKit

// MARK: - HomeDataSourceManager
final class HomeDataSourceManager: NSObject {

    // MARK: - Private Properties
    private let viewModels: [PostCell.ViewModel]

    // MARK: - Init
    init(viewModels: [PostCell.ViewModel]) {
        self.viewModels = viewModels
    }
}

// MARK: - UITableViewDataSource
extension HomeDataSourceManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostCell = tableView.dequeueReusableCell(for: indexPath)
        cell.populate(with: viewModels[indexPath.row])
        return cell
    }
}