// The Swift Programming Language

import Foundation

public protocol DateFormatterProtocol {
    func formatDate(_ date: String) -> String
}

public class DateFormatterService {
    
    static public let shared = DateFormatterService()
    
    private init() {}
    
    private let inputDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    private let outputDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMMM yyyy"
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    
    public func formatDate(_ date: String) -> String {
        guard let dateObj = parseDate(from: date) else { return "" }
        return outputDateFormatter.string(from: dateObj)
    }
    
    private func parseDate(from string: String) -> Date? {
        return inputDateFormatter.date(from: string)
    }
}
