//
//  PopupView

//

import UIKit



class PopupView: UIView {
    

    @IBOutlet weak var tableView: ModularTableView!
    
    private var view : UIView!
    private let nibName = "PopupView"
    
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
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    

            


}
