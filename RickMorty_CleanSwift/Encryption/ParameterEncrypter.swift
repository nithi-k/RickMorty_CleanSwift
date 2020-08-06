import Foundation
import Alamofire
import CryptoSwift

class ParameterEncrypter {
    
    private let keyGenerator: GeneratorRandomComponent
    private var aes: AES!
    
    private var key: String!
    
    init(keyGenerator: GeneratorRandomComponent = GeneratorRandomComponent()) {
        self.keyGenerator = keyGenerator
    }
    
    func encrypt(parameters: Parameters) -> Parameters {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            let jsonString = String(data: jsonData, encoding: .utf8)
            
            setRandomKey()
            self.setTestCase()
            
            let queryParams = jsonString
            let encryptedKey = self.encryptedKey(key: self.key)
         
            let encryptedParams = try aes.encrypt(queryParams!.utf8.map {$0}).toBase64()
            
            return [
                "param1": encryptedParams!,
                "param2": encryptedKey
            ]
        } catch {
            return [
                "param1": "",
                "param2": ""
            ]
        }
    }
    
    func setTestCase(){
        
        var errorCount = 0
        let total = 100
        for _ in 0...total {
            let testKey = keyGenerator.randomString(defaultLength: AES.blockSize)
            let encryptedKey = self.encryptedKey(key: testKey)
            let decryptedKey = self.decryptedKey(base64String: encryptedKey)
       
            if !decryptedKey.isSimilarTo(text: testKey){
                         print("FAIL ENCRYPTION")
                         print(testKey)
                        errorCount += 1
            }
        }
        let percent = Double((total - errorCount))/Double(total) * 100
        print("pass = \(percent) percents")
     
//        print("=====================START========================")
//        print("Key:  " + key)
//        print("EncryptedKey:  " + encryptedKey)
//        print("Decrypted:  " + decryptedKey)
//        print("======================END=====================")
                  
        
    }
    func encryptByKey(_ plainText: String, _ encKey: String) -> String {
        guard encKey.utf8.count >= 16 else {
            return ""
        }
        do {
            let index = encKey.index(encKey.startIndex, offsetBy: AES.blockSize)
            
            self.key = String(encKey[..<index])
            self.aes = try AES(key: Array(key.utf8), blockMode: .ECB, padding: .pkcs7)
            let encryptedValue = try aes.encrypt(Array(plainText.utf8)).toBase64()
            return encryptedValue!
        } catch {
            return ""
        }
    }
    
    private func setRandomKey() {
        do {
            self.key = keyGenerator.randomString(defaultLength: AES.blockSize)
            self.aes = try AES(key: Array(key.utf8), blockMode: .ECB, padding: .pkcs7)
        } catch {
            
        }
    }
    
    
    private func encryptedKey(key:String) -> String {
        let rsaEncrypt = RSAEncrypter()
        return rsaEncrypt.encrypt(string: key)
    }
    private func decryptedKey(base64String:String) -> String {
        let rsaDecrypter = RSADecrypter()
        let base64String = rsaDecrypter.decrypt(base64String: base64String)
        let decodedData = Data(base64Encoded: base64String)!
        let decodedString = String(data: decodedData, encoding: .utf8)!
        
        return decodedString
    }
    
    func decrypt(cipherText: String) -> String? {
        let decryptedText = try? cipherText.decryptBase64ToString(cipher: aes)
        return decryptedText
    }
    
}

class GeneratorRandomComponent {
    public func randomString(defaultLength: Int) -> String {
        let letters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString: NSMutableString = NSMutableString(capacity: defaultLength)
        for _ in 0 ... defaultLength - 1 {
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.character(at: Int(rand)))
        }
        return randomString as String
    }
}
