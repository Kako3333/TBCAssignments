import UIKit
import Security

final class KeyChainManager {
    
    enum keyChainError: Error {
        case duplicateItem
        case unknown(status: OSStatus)
    }
    
    static func save(
        username: String,
        password: String
    ) throws {
        let usernameData = username.data(using: .utf8)!
        let passwordData = password.data(using: .utf8)!
        
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username as AnyObject,
            kSecValueData as String: passwordData as AnyObject
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(
            query as CFDictionary,
            nil
        )
        
        guard status != errSecDuplicateItem else {
            throw keyChainError.duplicateItem
        }
        
        guard status == errSecSuccess else {
            throw keyChainError.unknown(status: status)
        }
    }
    
    static func retrieveCredentials() -> (username: String, password: String)? {
            let query: [String: AnyObject] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecReturnAttributes as String: kCFBooleanTrue,
                kSecReturnData as String: kCFBooleanTrue,
                kSecMatchLimit as String: kSecMatchLimitOne
            ]
            
            var item: CFTypeRef?
            let status = SecItemCopyMatching(query as CFDictionary, &item)
            
            guard status == errSecSuccess else {
                return nil
            }
            
            guard let existingItem = item as? [String: AnyObject],
                  let usernameData = existingItem[kSecAttrAccount as String] as? String,
                  let passwordData = existingItem[kSecValueData as String] as? Data,
                  let password = String(data: passwordData, encoding: .utf8) else {
                return nil
            }
            
            print("username \(usernameData), password: \(password)")
            return (username: usernameData, password: password)
        }
}

