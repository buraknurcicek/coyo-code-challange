//
//  HeaderView.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 20.02.2022.
//

import UIKit

// MARK: - HeaderView
final class HeaderView: UIView {

    // MARK: - Views
    private lazy var containerView = makeContainerView()
    private lazy var titleLabel = makeBoldLabel()
    private lazy var descriptionLabel = makeBoldLabel()
    private lazy var commentCountLabel = makeRegularLabel()
    private lazy var lineView = makeLineView()

    // MARK: - Private Properties
    private var viewModel: ViewModel?

    private enum Constants {
        static let headerHeight: CGFloat = 200
        static let padding: CGFloat = 20
        static let lineHeight: CGFloat = 1
    }

    // MARK: - ViewModel
    class ViewModel {
        var title: String?
        var description: String?
        var author: String?
        var commentCount: String?
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupViews()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    // MARK: - Accessible Functions
    func populate(with viewModel: ViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        if let commentCount = viewModel.commentCount {
            commentCountLabel.text = "\(LocalizableManager.number_of_comment.value) \(commentCount)"
        }
    }
}

// MARK: - Private Extensions
private extension HeaderView {
    func setupViews() {
        addContainerView()
        addCommentCountLabel()
        addTitleLabel()
        addDescriptionLabel()
        addLineView()
    }

    func addContainerView() {
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: Constants.headerHeight),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)])
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
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: commentCountLabel.bottomAnchor, constant: -Constants.padding)])
    }

    func addCommentCountLabel() {
        containerView.addSubview(commentCountLabel)
        NSLayoutConstraint.activate([
            commentCountLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.padding),
            commentCountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding)])
    }

    func addLineView() {
        containerView.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            lineView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            lineView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: Constants.lineHeight)])
    }

    func makeContainerView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    func makeBoldLabel() -> UILabel {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func makeRegularLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func makeLineView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
