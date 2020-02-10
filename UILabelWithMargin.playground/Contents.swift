import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
view.backgroundColor = .white

class PaddedLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        var intrinsicContentSize = super.intrinsicContentSize
        intrinsicContentSize.width += 10
        intrinsicContentSize.height += 4
        return intrinsicContentSize
    }
    override func drawText(in rect: CGRect) {
        let newRect = rect.inset(by: UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5))
        super.drawText(in: newRect)
    }
}

class BorderLabel: UIView {
    var label: UILabel?
    static let defaultMargin = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
    static let defaultBorderWidth: CGFloat = 2
    static let defaultCornerRadius: CGFloat = 10
    static let defaultFont = UIFont.systemFont(ofSize: 12)
    func setLabelText(labelText: String, font: UIFont? = nil) {
        let tempLabel = UILabel(frame: CGRect(
            x: Self.defaultMargin.left + Self.defaultMargin.right,
            y: Self.defaultMargin.top + Self.defaultMargin.bottom,
            width: 300,
            height: 300
        ))
        tempLabel.text = labelText
        if let font = font {
            print("font: \(font)")
            tempLabel.font = font
        } else {
            tempLabel.font = Self.defaultFont
        }
        tempLabel.sizeToFit()
        label = tempLabel
        view.addSubview(tempLabel)
    }
}

var borderLabel = BorderLabel(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
print("borderLabel.frame: \(borderLabel.frame)")
print("borderLabel.bounds: \(borderLabel.bounds)")
//borderLabel.setLabelText(labelText: "腹減りまくり", fontSize: 12)
//borderLabel.setLabelText(labelText: "腹減りまくり", fontSize: 30)
borderLabel.setLabelText(labelText: "腹減りまくり", font: UIFont.systemFont(ofSize: 12))
//borderLabel.setLabelText(labelText: "腹減りまくり")
//borderLabel.setLabelText(labelText: "腹減りまくり", font: UIFont.systemFont(ofSize: 30))
print("borderLabel.frame: \(borderLabel.frame)")
print("borderLabel.bounds: \(borderLabel.bounds)")

if let aLabel = borderLabel.label {
    print("aLabel.frame: \(aLabel.frame)")
    print("aLabel.bounds: \(aLabel.bounds)")
    borderLabel.frame = CGRect(
        x: 0,
        y: 0,
        width: aLabel.frame.width + (aLabel.frame.origin.x * 2),
        height: aLabel.frame.height + (aLabel.frame.origin.y * 2)
    )
    borderLabel.layer.borderColor = UIColor.blue.cgColor
    borderLabel.layer.borderWidth = BorderLabel.defaultBorderWidth
    borderLabel.layer.cornerRadius = BorderLabel.defaultCornerRadius
    borderLabel.clipsToBounds = true
    view.frame = CGRect(
        x: 0,
        y: 0,
        width: aLabel.frame.width + (aLabel.frame.origin.x * 2),
        height: aLabel.frame.height + (aLabel.frame.origin.y * 2)
    )
}
view.addSubview(borderLabel)
PlaygroundPage.current.liveView = view
