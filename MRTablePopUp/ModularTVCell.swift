//
//  ModularTVCell.swift

//

import UIKit

class ModularTVCell: UITableViewCell {
    
    var selectedBackgroundColor = UIColor.lightGray

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    required override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.titleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {

        if(selected == true){
            self.contentView.backgroundColor = self.selectedBackgroundColor
        }else{
            self.contentView.backgroundColor = UIColor.clear
        }
    }
    
    func setCellWith(title : String) {
        self.titleLabel.text = title
    }
    
}
