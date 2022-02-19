//
//  PostDetailView.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 20.02.2022.
//

import UIKit

// MARK: - PostDetailView
final class PostDetailView: UIView {

    // MARK: - Views
    private lazy var containerView = makeContainerView()
    private lazy var titleLabel = makeLabel()
    private lazy var descriptionLabel = makeLabel()
    private lazy var commentCountLabel = makeLabel()
    private lazy var authorLabel = makeLabel()
    private lazy var tableView = makeTableView()

    private enum Constants {
        static let headerHeight: CGFloat = 200
        static let padding: CGFloat = 20
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

// MARK: - PostDetailView
private extension PostDetailView {
    func setupViews() {
        addHeaderView()
        addTableView()
    }

    func addHeaderView() {
        addContainerView()
        addTitleLabel()
        addDescriptionLabel()
        addCommentCountLabel()
        addAuthorLabel()
    }

    func addContainerView() {
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: Constants.headerHeight),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }

    func addTitleLabel() {
        containerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.padding),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding)])
    }

    func addDescriptionLabel() {
        containerView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)])
    }

    func addCommentCountLabel() {
        containerView.addSubview(commentCountLabel)
        NSLayoutConstraint.activate([
            commentCountLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.padding),
            commentCountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding)])
    }

    func addAuthorLabel() {
        containerView.addSubview(authorLabel)
        NSLayoutConstraint.activate([
            authorLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.padding),
            authorLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.padding)])
    }

    func addTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: containerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }

    func makeContainerView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }

    func makeLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "lşfşdlsdl"
        return label
    }

    func makeTableView() -> UIView {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
}
