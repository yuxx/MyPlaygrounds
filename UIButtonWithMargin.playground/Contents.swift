import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
view.backgroundColor = .white
class BorderedButton: UIButton {
    override var intrinsicContentSize: CGSize {
        var intrinsicContentSize = super.intrinsicContentSize
        intrinsicContentSize.width += 10
        intrinsicContentSize.height += 4
        return intrinsicContentSize
    }
}

let defRect = CGRect(x: 0, y: 0, width: 300, height: 300)
let button = UIButton(frame: defRect)
guard let label = button.titleLabel else {
    exit(0)
}
button.setTitle("あたしゃねえ、許さないよ", for: .normal)
let boldFont = UIFont.systemFont(ofSize: 12, weight: .bold)
let regulerFont = UIFont.systemFont(ofSize: 12)
label.font = boldFont
button.setTitleColor(.white, for: .normal)
button.backgroundColor = .red
button.layer.cornerRadius = 10
let margin = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 6)
button.contentEdgeInsets = margin
button.sizeToFit()
view.addSubview(button)
PlaygroundPage.current.liveView = view
