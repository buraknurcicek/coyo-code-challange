//
//  PostCell.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import UIKit

// MARK: - PostCell
final class PostCell: UITableViewCell, ReusableView {

    // MARK: - Private Properties
    private lazy var containerView = makeContainerView()
    private lazy var postImageView = makeImageView()
    private lazy var postTitleLabel = makeBoldLabel()
    private lazy var postDescriptionLabel = makeRegularLabel()

    private var viewModel : ViewModel?

    private enum Constants {
        static let padding: CGFloat = 10
        static let containerRadius: CGFloat = 15
        static let borderWidth: CGFloat = 1
        static let imageSize: CGFloat = 60
    }

    // MARK: - ViewModel
    class ViewModel {
        var title: String?
        var description: String?
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
    static func createViewModel(with post: Post) -> ViewModel {
        let viewModel = ViewModel()
        viewModel.title = post.title
        viewModel.description = post.body
        return viewModel
    }

    func populate(with viewModel: ViewModel) {
        postTitleLabel.text = viewModel.title
        postDescriptionLabel.text = viewModel.description
    }
}

// MARK: - Private Extensions
private extension PostCell {
    func setupViews() {
        addContainerView()
        addPostImageView()
        addPostTitleLabel()
        addPostDescriptionLabel()
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
            postImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.padding),
            postImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.padding),
            postImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.padding)])
    }

    func addPostTitleLabel() {
        containerView.addSubview(postTitleLabel)
        NSLayoutConstraint.activate([
            postTitleLabel.topAnchor.constraint(equalTo: postImageView.topAnchor),
            postTitleLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: Constants.padding),
            postTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding)])
    }

    func addPostDescriptionLabel() {
        containerView.addSubview(postDescriptionLabel)
        NSLayoutConstraint.activate([
            postDescriptionLabel.bottomAnchor.constraint(equalTo: postImageView.bottomAnchor),
            postDescriptionLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: Constants.padding),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding)])
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
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func makeRegularLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
