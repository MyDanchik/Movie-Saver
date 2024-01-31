import UIKit

// MARK: - YoutubeView

protocol YoutubeView {
    func setYoutube(youtube: String)
    var setYoutubeClosure: ((String) -> Void)? { get set }
}

// MARK: - YoutubeViewModel

final class YoutubeViewModel: YoutubeView {
    var setYoutubeClosure: ((String) -> Void)?
    
    func setYoutube(youtube: String) {
        setYoutubeClosure?(youtube)
    }
}
