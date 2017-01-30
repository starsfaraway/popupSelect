//
//  ModularTableView.swift

//

import UIKit

class ModularTableView: UITableView {

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        

        self.register(UINib.init(nibName: "ModularTVCell", bundle: nil), forCellReuseIdentifier: "modularCell")
        self.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        
        self.rowHeight = 60.0

    }
    



}
