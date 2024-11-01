//
//  NewsDetailViewController.swift
//  Assignment19
//
//  Created by Gio Kakaladze on 30.10.24.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var article: NewsModel? {
        didSet {
            configureViewModel()
        }
    }
    
    private var viewModel: NewsDetailViewModel?

    private let detailsTitleLabel: UILabel = {
        let detailsTitleLabel = UILabel()
        detailsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        detailsTitleLabel.textAlignment = .left
        detailsTitleLabel.numberOfLines = 2
        detailsTitleLabel.textColor = .black

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 20.8
        paragraphStyle.maximumLineHeight = 20.8

        let attributedText = NSAttributedString(
            string: "",
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: detailsTitleLabel.font as Any
            ]
        )
        detailsTitleLabel.attributedText = attributedText
        return detailsTitleLabel
    }()

    private let detailsPublishedAt: UILabel = {
        let publishedAt = UILabel()
        publishedAt.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        publishedAt.numberOfLines = 0
        publishedAt.translatesAutoresizingMaskIntoConstraints = false
        return publishedAt
    }()

    private let detailsArticleImage: UIImageView = {
        let articleImage = UIImageView()
        articleImage.layer.cornerRadius = 8
        articleImage.layer.masksToBounds = true
        articleImage.translatesAutoresizingMaskIntoConstraints = false
        articleImage.image = UIImage(named: "pic")
        return articleImage
    }()

    private let detailsContentLabel: UILabel = {
        let detailsContentLabel = UILabel()
        detailsContentLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        detailsContentLabel.numberOfLines = 0
        detailsContentLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailsContentLabel
    }()

    private let detailsPublishedBy: UILabel = {
        let detailsPublishedBy = UILabel()
        detailsPublishedBy.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        detailsPublishedBy.numberOfLines = 0
        detailsPublishedBy.translatesAutoresizingMaskIntoConstraints = false
        return detailsPublishedBy
    }()

    private let detailsBackButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .black
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()

    private let detailsHeaderLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Hot Updates"
        return headerLabel
    }()

    private let detailsView: UIView = {
        let detailsView = UIView()
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        return detailsView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        configureBackButton()
        setupHeaderButton()
        setupDetailsView()
    }

    private func setupHeaderButton() {
        view.addSubview(detailsBackButton)
        view.addSubview(detailsHeaderLabel)

        NSLayoutConstraint.activate([
            detailsBackButton.widthAnchor.constraint(equalToConstant: 15),
            detailsBackButton.heightAnchor.constraint(equalToConstant: 15),
            detailsBackButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            detailsBackButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),

            detailsHeaderLabel.centerYAnchor.constraint(equalTo: detailsBackButton.centerYAnchor),
            detailsHeaderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    private func setupDetailsView() {
        view.addSubview(detailsView)
        detailsView.addSubview(detailsTitleLabel)
        detailsView.addSubview(detailsPublishedAt)
        detailsView.addSubview(detailsArticleImage)
        detailsView.addSubview(detailsContentLabel)
        detailsView.addSubview(detailsPublishedBy)

        NSLayoutConstraint.activate([
            detailsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            detailsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            detailsView.topAnchor.constraint(equalTo: detailsHeaderLabel.bottomAnchor, constant: 20),
            detailsView.heightAnchor.constraint(equalToConstant: 470),

            detailsTitleLabel.heightAnchor.constraint(equalToConstant: 47),
            detailsTitleLabel.leftAnchor.constraint(equalTo: detailsView.leftAnchor, constant: 3),
            detailsTitleLabel.rightAnchor.constraint(equalTo: detailsView.rightAnchor, constant: -3),
            detailsTitleLabel.topAnchor.constraint(equalTo: detailsView.topAnchor),

            detailsPublishedAt.heightAnchor.constraint(equalToConstant: 21),
            detailsPublishedAt.leadingAnchor.constraint(equalTo: detailsTitleLabel.leadingAnchor),
            detailsPublishedAt.trailingAnchor.constraint(equalTo: detailsTitleLabel.trailingAnchor),
            detailsPublishedAt.topAnchor.constraint(equalTo: detailsTitleLabel.bottomAnchor),

            detailsArticleImage.heightAnchor.constraint(equalToConstant: 144),
            detailsArticleImage.topAnchor.constraint(equalTo: detailsPublishedAt.bottomAnchor, constant: 10),
            detailsArticleImage.leadingAnchor.constraint(equalTo: detailsTitleLabel.leadingAnchor),
            detailsArticleImage.trailingAnchor.constraint(equalTo: detailsTitleLabel.trailingAnchor),

            detailsContentLabel.leftAnchor.constraint(equalTo: detailsView.leftAnchor),
            detailsContentLabel.rightAnchor.constraint(equalTo: detailsView.rightAnchor),
            detailsContentLabel.heightAnchor.constraint(equalToConstant: 110),
            detailsContentLabel.topAnchor.constraint(equalTo: detailsArticleImage.bottomAnchor, constant: 3),

            detailsPublishedBy.leftAnchor.constraint(equalTo: detailsView.leftAnchor),
            detailsPublishedBy.topAnchor.constraint(equalTo: detailsContentLabel.bottomAnchor, constant: 5),
        ])
    }

    private func configureBackButton() {
        detailsBackButton.addAction(UIAction(handler: { [weak self] action in
            self?.backButtonAction()
        }), for: .touchUpInside)
    }

    func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }

    private func configureViewModel() {
        guard let article = article else { return }
        viewModel = NewsDetailViewModel(article: article)
        configureDetailsView()
    }

    private func configureDetailsView() {
        guard let viewModel = viewModel else { return }
        
        detailsTitleLabel.text = viewModel.title
        detailsContentLabel.text = viewModel.content
        detailsPublishedAt.text = viewModel.publishedAt
        detailsPublishedBy.text = viewModel.publishedBy
        
        if let imageUrl = viewModel.imageUrl {
            fetchImage(from: imageUrl) { [weak self] image in
                DispatchQueue.main.async {
                    self?.detailsArticleImage.image = image ?? UIImage(named: "pic")

                }
            }
        } else {
            detailsArticleImage.image = UIImage(named: "pic")
        }
    }

    private func fetchImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}



