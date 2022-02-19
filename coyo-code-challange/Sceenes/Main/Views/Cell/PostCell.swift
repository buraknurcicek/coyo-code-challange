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
    private lazy var postTitleLabel = makeTitleLabel()
    private lazy var postDescriptionLabel = makeDescriptionLabel()

    // MARK: - ViewModel
    class ViewModel {
        var title: String?
        var description: String?
    }

    private enum Constants {
        static let padding: CGFloat = 10
        static let spacing: CGFloat = 5
        static let containerHeight: CGFloat = 110
        static let containerRadius: CGFloat = 15
        static let borderWidth: CGFloat = 1
        static let labelHeight: CGFloat = 40
    }

    private var viewModel : ViewModel?

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
        addPostTitleLabel()
        addPostDescriptionLabel()
    }

    func addContainerView() {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.padding),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.padding),
            containerView.heightAnchor.constraint(equalToConstant: Constants.containerHeight)])
    }

    func addPostTitleLabel() {
        containerView.addSubview(postTitleLabel)
        NSLayoutConstraint.activate([
            postTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.padding),
            postTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.padding),
            postTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding),
            postTitleLabel.heightAnchor.constraint(equalToConstant: Constants.labelHeight)])
    }

    func addPostDescriptionLabel() {
        containerView.addSubview(postDescriptionLabel)
        NSLayoutConstraint.activate([
            postDescriptionLabel.topAnchor.constraint(equalTo: postTitleLabel.bottomAnchor, constant: Constants.spacing),
            postDescriptionLabel.leadingAnchor.constraint(equalTo: postTitleLabel.leadingAnchor),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: postTitleLabel.trailingAnchor),
            postDescriptionLabel.heightAnchor.constraint(equalToConstant: Constants.labelHeight)])
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

    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func makeDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
