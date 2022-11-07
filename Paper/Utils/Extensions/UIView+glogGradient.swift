import UIKit

extension UIView {
    func glogGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.Gradient1!.cgColor, UIColor.Gradient2!.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.layer.insertSublayer(gradient, at: 0)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}
