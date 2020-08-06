import Foundation
import RxSwift

struct Context {
    let flow: String
}

class BasePresenter: NSObject, AnalyticLogable {
    var analytic: GAInterface = GA.default
    var localizedKeyInitial = "common_%@"
    var disposeBag = DisposeBag()
    
    func cancelAllRequests() {
        disposeBag = DisposeBag()
    }
    
    func createError(_ body: String, type: CustomerServiceErrorType? = nil) -> ScreenError {
        let combineString = String(format: localizedKeyInitial, body)
        let screenError = ScreenError(localizedKey: combineString)
        if let type = type {
            screenError.type = type
        }
        return screenError
    }
}
