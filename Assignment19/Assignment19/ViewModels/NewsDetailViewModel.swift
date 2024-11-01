//
//  NewsDetailViewModel.swift
//  Assignment19
//
//  Created by Gio Kakaladze on 30.10.24.
//
import UIKit

class NewsDetailViewModel {
    private var article: NewsModel

    var title: String {
        return article.title ?? ""
    }

    var publishedAt: String {
        return article.publishedAt
    }

    var content: String {
        return article.content ?? ""
    }

    var publishedBy: String {
        return "Published By: \(article.source?.name ?? "")"
    }

    var imageUrl: URL? {
        guard let imageUrlString = article.urlToImage else { return nil }
        return URL(string: imageUrlString)
    }

    init(article: NewsModel) {
        self.article = article
    }
}

