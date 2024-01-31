import UIKit

// MARK: - NameView Protocol

protocol NameView {
    func setName(name: String)
    var setNameClosure: ((String) -> Void)? { get set }
}

// MARK: - NameViewModel

final class NameViewModel: NameView {
    var setNameClosure: ((String) -> Void)?
    
    func setName(name: String) {
        setNameClosure?(name)
    }
}
