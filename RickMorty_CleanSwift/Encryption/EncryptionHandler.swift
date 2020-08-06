import Foundation
import Alamofire
import ObjectMapper

class EncryptionHandler {
    
    private var enc: ParameterEncrypter
    
    init() {
        self.enc = ParameterEncrypter()
    }
    
    func getParameters(request: [String: Any]) -> Parameters {
        #if DEBUG
            return enc.encrypt(parameters: request)
        #else
            return enc.encrypt(parameters: request)
        #endif
    }
    
    func getResultString (result: String ) -> String? {
        if ProcessInfo.processInfo.arguments.contains("ui-testing") {
            return result
        }
        #if DEBUG
            return enc.decrypt(cipherText: result)
        #elseif STUBBY
            return result
        #else
            return enc.decrypt(cipherText: result)
        #endif
    }
    
}

