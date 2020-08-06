import Foundation
import SwiftyRSA

class RSAEncrypter {
    
    private let publicKeyFile: String
    
    init(publicKeyFile: String = "public") {
        self.publicKeyFile = publicKeyFile
    }
    
    func encrypt(string: String) -> String {
        do {
            let clearMessage = try createClearMessage(from: string)
            let publicKey = try getPublicKey()
            let cipherText = try clearMessage.encrypted(with: publicKey, padding: .PKCS1)
            return cipherText.base64String
            
        } catch {
            return ""
        }
    }
    
    private func getPublicKey() throws -> PublicKey {
        let bundle = Bundle(for: type(of: self))
        do {
            return try PublicKey(pemNamed: publicKeyFile, in: bundle)
        } catch {
            throw SwiftyRSAError.notAPublicKey
        }
    }
    
    private func createClearMessage(from string: String) throws -> ClearMessage {
        do {
            return try ClearMessage(string: string, using: .utf8)
        } catch {
            throw SwiftyRSAError.stringToDataConversionFailed
        }
    }
}

