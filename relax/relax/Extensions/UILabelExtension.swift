import Foundation
import UIKit

extension UILabel {
    
    func textDropShadow() {
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
    }
}


