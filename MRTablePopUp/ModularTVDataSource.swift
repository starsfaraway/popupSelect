//
//  Modular TableView Data Source


import UIKit

class ModularTVDataSource: NSObject, UITableViewDataSource {
    
    var tableViewData : NSArray?
    
    var titleTextColor = UIColor.black
    var cellSelectedColor = UIColor.lightGray

    
    override init() {
        
        super.init()
    }
    
    //MARK: ROWS
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "modularCell", for: indexPath) as! ModularTVCell
        cell.setCellWith(title: (tableViewData?.object(at: indexPath.row) as! String?)!)
        cell.selectedBackgroundColor = self.cellSelectedColor
        cell.titleLabel.textColor = self.titleTextColor

        return cell
    }
    
    
    //MARK: SECTIONS
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.tableViewData?.count ?? 0
    }
    
    //UI
    
    func updateAppearance(color1: UIColor, color2: UIColor) {
        self.titleTextColor = color1
        self.cellSelectedColor = color2
    }
    
}
