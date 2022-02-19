//
//  PostDetailViewController.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 20.02.2022.
//

import UIKit

// MARK: - PostDetailViewController
final class PostDetailViewController: UIViewController {

    // MARK: - Private Properties
    private let postDetailView = PostDetailView()
    private var viewModel: PostDetailViewModel

    // MARK: - Init
    init(viewModel: PostDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    // MARK: - Life-Cycle
    override func loadView() {
        super.loadView()
        title = LocalizableManager.post_detail_title.value
        view = postDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
    }
}
