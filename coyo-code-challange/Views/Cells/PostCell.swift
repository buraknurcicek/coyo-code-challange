//
//  PostCell.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import UIKit

// MARK: - PostCell
final class PostCell: UITableViewCell, ReusableView {

    // MARK: - Views
    private lazy var containerView = makeContainerView()
    private lazy var postImageView = makeImageView()
    private lazy var postAuthorLabel = makeRegularLabel()
    private lazy var postAuthorEmailLabel = makeRegularLabel()
    private lazy var postTitleLabel = makeBoldLabel()
    private lazy var postDescriptionLabel = makeRegularLabel()

    // MARK: - Private Properties
    private var viewModel : ViewModel?

    private enum Constants {
        static let padding: CGFloat = 10
        static let containerRadius: CGFloat = 15
        static let borderWidth: CGFloat = 1
        static let imageSize: CGFloat = 30
        static let labelHeight: CGFloat = 25
    }

    // MARK: - ViewModel
    class ViewModel {
        var title: String?
        var description: String?
        var author: String?
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
    static func createViewModel(post: Post, user: User) -> ViewModel {
        let viewModel = ViewModel()
        viewModel.title = post.title
        viewModel.description = post.body
        viewModel.author = user.name
        return viewModel
    }

    func populate(with viewModel: ViewModel) {
        postTitleLabel.text = viewModel.title
        postDescriptionLabel.text = viewModel.description
        postAuthorLabel.text = viewModel.author
    }
}

// MARK: - Private Extensions
private extension PostCell {
    func setupViews() {
        addContainerView()
        addPostImageView()
        addPostTitleLabel()
        addPostDescriptionLabel()
        addPostAuthorLabel()
    }

    func addContainerView() {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.padding),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.padding)])
    }

    func addPostImageView() {
        containerView.addSubview(postImageView)
        NSLayoutConstraint.activate([
            postImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize),
            postImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize),
            postImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            postImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.padding / 2)])
    }

    func addPostTitleLabel() {
        containerView.addSubview(postTitleLabel)
        NSLayoutConstraint.activate([
            postTitleLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: Constants.padding / 2),
            postTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.padding),
            postTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding)])
    }

    func addPostDescriptionLabel() {
        containerView.addSubview(postDescriptionLabel)
        NSLayoutConstraint.activate([
            postDescriptionLabel.topAnchor.constraint(equalTo: postTitleLabel.bottomAnchor, constant: Constants.padding / 2),
            postDescriptionLabel.leadingAnchor.constraint(equalTo: postTitleLabel.leadingAnchor),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: postTitleLabel.trailingAnchor)])
    }

    func addPostAuthorLabel() {
        containerView.addSubview(postAuthorLabel)
        postAuthorLabel.textAlignment = .center
        NSLayoutConstraint.activate([
            postAuthorLabel.trailingAnchor.constraint(equalTo: postDescriptionLabel.trailingAnchor),
            postAuthorLabel.leadingAnchor.constraint(equalTo: postDescriptionLabel.leadingAnchor),
            postAuthorLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: Constants.padding),
            postAuthorLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.padding),
            postAuthorLabel.heightAnchor.constraint(equalToConstant: Constants.labelHeight)])
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

    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = VisualContentsManager.ic_coyo_logo.value
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Constants.imageSize / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    func makeBoldLabel() -> UILabel {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func makeRegularLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
