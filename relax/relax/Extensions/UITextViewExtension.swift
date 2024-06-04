import Foundation
import UIKit

extension UITextView {
    
    func addWhiteBorder() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
}
