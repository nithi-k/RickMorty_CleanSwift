import Foundation
import SwiftyRSA

class RSADecrypter {
    
    private let privateKeyFile: String
    
    init(file: String = "private") {
        self.privateKeyFile = file
    }
    
    func decrypt(base64String: String) -> String {
        do {
            let encryptedMessage =  try createEncryptedMessage(from: base64String)
            let privateKey = try getPrivateKey()
            let text = try encryptedMessage.decrypted(with: privateKey, padding: .PKCS1)
            return text.base64String
            
        } catch {
            return ""
        }
    }
    
    private func getPrivateKey() throws -> PrivateKey {
        let bundle = Bundle(for: type(of: self))
        do {
            return try PrivateKey(pemNamed: privateKeyFile, in: bundle)
        } catch {
            throw SwiftyRSAError.notAPublicKey
        }
    }
    
    private func createEncryptedMessage(from base64String: String) throws -> EncryptedMessage {
          do {
              return try EncryptedMessage(base64Encoded: base64String)
          } catch {
              throw SwiftyRSAError.stringToDataConversionFailed
          }
      }
}

