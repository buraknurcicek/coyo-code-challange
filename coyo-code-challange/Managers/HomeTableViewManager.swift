//
//  HomeTableViewManager.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import UIKit

// MARK: - HomeTableViewManagerDelegate
protocol HomeTableViewManagerDelegate: AnyObject {
    func didSelect(indexPath: IndexPath)
}

// MARK: - HomeTableViewManager
final class HomeTableViewManager: NSObject {

    // MARK: - Private Properties
    var viewModels: [PostCell.ViewModel]

    weak var delegate: HomeTableViewManagerDelegate?

    private enum Constant {
        static let numberOfRows: Int = 10
    }

    // MARK: - Init
    init(viewModels: [PostCell.ViewModel]) {
        self.viewModels = viewModels
    }
}

// MARK: - UITableViewDataSource
extension HomeTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constant.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostCell = tableView.dequeueReusableCell(for: indexPath)
        cell.populate(with: viewModels[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(indexPath: indexPath)
    }
}
