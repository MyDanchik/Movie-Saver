import UIKit

// MARK: - RatingView Protocol

protocol RatingView {
    func setRating(rating: String)
    var setRatingClosure: ((String) -> Void)? { get set }
}

// MARK: - RatingViewModel

final class RatingViewModel: RatingView {
    var setRatingClosure: ((String) -> Void)?
    
    func setRating(rating: String) {
        setRatingClosure?(rating)
    }
}
