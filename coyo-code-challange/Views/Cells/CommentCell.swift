//
//  CommentCell.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 20.02.2022.
//

import UIKit

// MARK: - CommentCell
final class CommentCell: UITableViewCell, ReusableView {

    // MARK: - Views
    private lazy var containerView = makeContainerView()
    private lazy var nameLabel = makeBoldLabel()
    private lazy var emailLabel = makeRegularLabel()
    private lazy var bodyLabel = makeRegularLabel()

    private var viewModel : ViewModel?

    private enum Constants {
        static let borderWidth: CGFloat = 1
        static let containerRadius: CGFloat = 8
        static let padding: CGFloat = 10
        static let labelHeight: CGFloat = 25
    }

    // MARK: - ViewModel
    class ViewModel {
        var name: String?
        var email: String?
        var body: String?
    }

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    // MARK: - Accessible Functions
    static func createViewModel(with comment: Comment) -> ViewModel {
        let viewModel = ViewModel()
        viewModel.name = comment.name
        viewModel.email = comment.email
        viewModel.body = comment.body
        return viewModel
    }

    func populate(with viewModel: ViewModel) {
        nameLabel.text = viewModel.name
        emailLabel.text = viewModel.email
        bodyLabel.text = viewModel.body
    }
}

private extension CommentCell {
    func setupViews() {
        addContainerView()
        addNameLabel()
        addEmailLabel()
        addBodyLabel()
    }

    func addContainerView() {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.padding),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.padding)])
    }

    func addNameLabel() {
        containerView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.padding),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.padding),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding),
            nameLabel.heightAnchor.constraint(equalToConstant: Constants.labelHeight)])
    }

    func addEmailLabel() {
        containerView.addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.padding),
            emailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding),
            emailLabel.heightAnchor.constraint(equalToConstant: Constants.labelHeight)])
    }

    func addBodyLabel() {
        containerView.addSubview(bodyLabel)
        NSLayoutConstraint.activate([
            bodyLabel.bottomAnchor.constraint(equalTo: emailLabel.topAnchor, constant: -Constants.padding),
            bodyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            bodyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.padding / 2)])
    }

    func makeContainerView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = Constants.containerRadius
        view.layer.borderWidth = Constants.borderWidth
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }

    func makeBoldLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }

    func makeRegularLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }
}
