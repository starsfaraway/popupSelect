//
//  ModularTVCHeader.swift

//

import UIKit

class ModularTVCHeader: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    private var view : UIView!
    private let nibName = "ModularTVCHeader"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup() {
        view = self.loadViewFromNib()
        view.frame = self.bounds
        self.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        self.titleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        self.closeButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

}
