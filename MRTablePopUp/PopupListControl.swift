//
//  PopupListControl
//  MRCountryCode
//

//

import UIKit

protocol PopupListControlDelegate {
    func selected(item: ListedObject)
}

public struct ListedObject {
    var title : String?
    var index: Int?
}

class PopupListControl: UIControl, UITableViewDelegate {
    
    private var themeColor1 : UIColor?
    private var themeColor2 : UIColor?
    private var rowHeight : Int?
    private var font : UIFont?
    
    private var titleText : String?
    private var closeButtonText : String?
    private var closeButtonImage : UIImage?
    private var modHeader : ModularTVCHeader?
    
    var delegate : PopupListControlDelegate?
    

    private var popUpView : PopupView?
    private let tvDataSource = ModularTVDataSource()
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.popUpView = PopupView(frame: frame)
        self.addSubview(self.popUpView!)
        self.setupPopupViewTableView()

    }
    
    required init(frame: CGRect, primaryColor: UIColor?, secondaryColor: UIColor?, title: String?, dismissTitle: String?,dismissImage: UIImage?) {
        super.init(frame: frame)
        self.popUpView = PopupView(frame: frame)
        self.addSubview(self.popUpView!)
        self.setupPopupViewTableView()
        self.titleText = title
        //FIXME: CAN"T SET COLORS WITHOUT DELAY & RELOAD
        self.delayWithSeconds(0.02) {
            self.themeColor1 = primaryColor
            self.themeColor2 = secondaryColor
            self.closeButtonText = dismissTitle
            self.closeButtonImage = dismissImage
            self.setupPopupViewColors(theme1: primaryColor!, theme2: secondaryColor!)
            self.popUpView?.tableView.reloadData()
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: UI
    
    func setupPopupViewTableView() {
        self.popUpView?.tableView.dataSource = self.tvDataSource
        self.popUpView?.tableView.delegate = self
        self.popUpView?.tableView.bounces = false
    }
    
    func setupPopupViewColors(theme1: UIColor, theme2: UIColor) {
        self.modHeader?.titleLabel.textColor = theme1
        self.modHeader?.closeButton.titleLabel?.textColor = theme1
        self.modHeader?.backgroundColor = theme2
        self.tvDataSource.updateAppearance(color1: theme1, color2: theme2)
        self.popUpView?.tableView.separatorColor = theme2

    }
    
    
    func updateData(dataArray: NSArray) {
        self.tvDataSource.tableViewData =  dataArray
        
    }
    
    internal func dimissPopupView() {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0.0
        }) { (success) in
            self.removeFromSuperview()
        }
    }

    //TableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let retVal = ListedObject(title: self.tvDataSource.tableViewData?.object(at: indexPath.row) as? String, index: indexPath.row)
        self.delegate?.selected(item: retVal)
        self.dimissPopupView()
    }
    
    //MARK: HEADER
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        self.modHeader = ModularTVCHeader()
        
        self.modHeader?.backgroundColor = self.themeColor2
        
        self.modHeader?.titleLabel.text = titleText ?? "Items"
        self.modHeader?.titleLabel.textColor = self.themeColor1
        
        modHeader?.backgroundColor = self.themeColor2
        if let text = closeButtonText {
            self.modHeader?.closeButton.setTitle(text, for: UIControlState.normal)
            self.modHeader?.closeButton.setTitleColor(self.themeColor1, for: UIControlState.normal)
            self.modHeader?.closeButton.tintColor = self.themeColor1}
        else if let pic = closeButtonImage {
            self.modHeader?.closeButton.setImage(pic, for: UIControlState.normal)}

        self.modHeader?.closeButton.addTarget(self, action: #selector(self.dimissPopupView), for: UIControlEvents.touchUpInside)
        return modHeader
    }
    
    
    //Utitlity
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }

}
