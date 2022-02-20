//
//  PostDetailTableViewManager.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 20.02.2022.
//

import UIKit

// MARK: - PostDetailTableViewManager
final class PostDetailTableViewManager: NSObject {

    // MARK: - Private Properties
    private let viewModels: [CommentCell.ViewModel]

    // MARK: - Init
    init(viewModels: [CommentCell.ViewModel]) {
        self.viewModels = viewModels
    }
}

// MARK: - UITableViewDataSource
extension PostDetailTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CommentCell = tableView.dequeueReusableCell(for: indexPath)
        cell.populate(with: viewModels[indexPath.row])
        return cell
    }
}
