//
//  NewsFeedViewController.swift
//  Assignment19
//
//  Created by Gio Kakaladze on 30.10.24.
//
import UIKit
import SwiftUI

public class NewsFeedViewController: UIViewController {
    
    let newsFeedViewModel = NewsFeedViewModel()
    let pageCountConstant = 10

    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Latest News"
        return headerLabel
    }()
    
    private let newsTableView: UITableView = {
        let newsTableView = UITableView()
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        newsTableView.register(NewsArticleCell.self, forCellReuseIdentifier: NewsArticleCell.identifier)
        newsTableView.separatorStyle = .none
        return newsTableView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        
        newsFeedViewModel.fetchNewsData(pageNumber: 1) { [weak self] _ in
                self?.newsTableView.reloadData()
            }
        
        setupUI()
    }
    
    private func setupUI() {
        setupHeaderLabel()
        setupTableView()
        newsTableView.reloadData()
    }
    
    private func setupHeaderLabel() {
        view.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21)
        ])
    }
    
    private func setupTableView() {
        view.addSubview(newsTableView)
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        NSLayoutConstraint.activate([
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newsTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 11)
        ])
    }
}

extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeedViewModel.newsCount
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = newsTableView.dequeueReusableCell(withIdentifier: NewsArticleCell.identifier, for: indexPath) as? NewsArticleCell else {
            fatalError(":(((((((((")
        }
        
        if indexPath.row == newsFeedViewModel.newsCount - 1 {
            newsFeedViewModel.checkForAdditionalNewsFeed {
                tableView.reloadData()
            }
        }
        
        let article = newsFeedViewModel.article(at: indexPath.row)
        cell.configure(with: article)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = newsFeedViewModel.article(at: indexPath.row)
        let detailVC = NewsDetailViewController()
        detailVC.article = article
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


