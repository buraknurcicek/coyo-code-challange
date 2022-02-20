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

    // MARK: - Private Properties
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
        if let name = viewModel.name {
            nameLabel.text = "\(LocalizableManager.general_author.value) \(name)"
        }
        emailLabel.text = viewModel.email
        bodyLabel.text = viewModel.body
    }
}

// MARK: - Private Extensions
private extension CommentCell {
    func setupViews() {
        addContainerView()
        addEmailLabel()
        addNameLabel()
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
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding)])
    }

    func addBodyLabel() {
        containerView.addSubview(bodyLabel)
        NSLayoutConstraint.activate([
            bodyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            bodyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.padding / 2),
            bodyLabel.bottomAnchor.constraint(equalTo: emailLabel.topAnchor, constant: -Constants.padding)])
    }

    func addEmailLabel() {
        containerView.addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.padding),
            emailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding),
            emailLabel.heightAnchor.constraint(equalToConstant: Constants.labelHeight)])
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
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }

    func makeRegularLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }
}
