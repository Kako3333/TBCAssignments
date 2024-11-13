//
//  NewsArticleCell.swift
//  Assignment19
//
//  Created by Gio Kakaladze on 30.10.24.
//

import UIKit
import Networking
import Formatter

class NewsArticleCell: UITableViewCell, DateFormatterProtocol {
    
    static let identifier = "NewsArticleCell"
    
    private let articleImage: UIImageView = {
        let articleImage = UIImageView()
        articleImage.layer.cornerRadius = 8
        articleImage.layer.masksToBounds = true
        articleImage.translatesAutoresizingMaskIntoConstraints = false
        articleImage.image = UIImage(named: "pic")
        return articleImage
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .white

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 20.8
        paragraphStyle.maximumLineHeight = 20.8

        let attributedText = NSAttributedString(
            string: "",
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: titleLabel.font as Any
            ]
        )
        titleLabel.attributedText = attributedText
        return titleLabel
    }()
    
    private let authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        authorLabel.textAlignment = .left
        authorLabel.textColor = .white
        authorLabel.text = ""
        return authorLabel
    }()
    
    private let publishedAtLabel: UILabel = {
        let publishedAtLabel = UILabel()
        publishedAtLabel.translatesAutoresizingMaskIntoConstraints = false
        publishedAtLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        publishedAtLabel.textAlignment = .left
        publishedAtLabel.textColor = .white
        publishedAtLabel.text = ""
        return publishedAtLabel
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor(white: 98/255, alpha: 0.35).cgColor,
            UIColor.black.cgColor
        ]
        layer.startPoint = CGPoint(x: 0.5, y: 0)
        layer.endPoint = CGPoint(x: 0.5, y: 1)
        return layer
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    private func setupCell() {
        contentView.addSubview(articleImage)
        setupLabels()
        setupGradientLayer()
        
        NSLayoutConstraint.activate([
            articleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            articleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            articleImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            articleImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    private func setupGradientLayer() {
            gradientLayer.frame = articleImage.bounds
            articleImage.layer.addSublayer(gradientLayer)
        }
    
    private func setupLabels() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(publishedAtLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 48),
            titleLabel.topAnchor.constraint(equalTo: articleImage.topAnchor, constant: 3),
            titleLabel.leftAnchor.constraint(equalTo: articleImage.leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: articleImage.rightAnchor, constant: -10),
            
            authorLabel.leftAnchor.constraint(equalTo: articleImage.leftAnchor, constant: 15),
            authorLabel.bottomAnchor.constraint(equalTo: articleImage.bottomAnchor, constant: -10),
            
            publishedAtLabel.rightAnchor.constraint(equalTo: articleImage.rightAnchor, constant: -15),
            publishedAtLabel.bottomAnchor.constraint(equalTo: articleImage.bottomAnchor, constant: -10),
        ])
    }
    
    func formatDate(_ date: String) -> String {
        return DateFormatterService.shared.formatDate(date)
    }
    
    func configure(with article: NewsModel) {
          titleLabel.text = article.title
          authorLabel.text = article.author ?? "Unknown"
          publishedAtLabel.text = formatDate(article.publishedAt ?? "")
        
          if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
               URLSession.shared.dataTask(with: url) { data, response, error in
                   if let data = data, let image = UIImage(data: data) {
                       DispatchQueue.main.async {
                           self.articleImage.image = image
                       }
                   } else {
                       DispatchQueue.main.async {
                           self.articleImage.image = UIImage(named: "pic")
                       }
                   }
               }.resume()
           } else {
               self.articleImage.image = UIImage(named: "pic")
           }
      }
    
    override func layoutSubviews() {
           super.layoutSubviews()
           gradientLayer.frame = articleImage.bounds
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
