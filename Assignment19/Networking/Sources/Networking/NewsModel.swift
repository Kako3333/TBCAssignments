//
//  NewsModel.swift
//  Assignment19
//
//  Created by Gio Kakaladze on 30.10.24.
//
import UIKit

public struct NewsModel: Decodable {
    public let source: Source?
    public let author: String?
    public let title: String?
    public let description: String?
    public let url: String?
    public let urlToImage: String?
    public let publishedAt: String?
    public let content: String?
}

public struct Source: Decodable {
   public let id: String?
   public let name: String?
}

public struct NewsResponseData: Decodable {
    public let status: String?
    public let totalResults: Int?
    public let articles: [NewsModel]
}











