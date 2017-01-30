//
//  ViewController.swift

//

import UIKit



class ViewController: UIViewController, PopupListControlDelegate {


    
    @IBOutlet weak var showPopupView: UIButton!
    
    
    var popUpControl : PopupListControl?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//MARK: For example:
    
    @IBAction func showPopupView(_ sender: Any) {
        self.popUpControl = PopupListControl(frame: self.view.frame, primaryColor: UIColor.cyan, secondaryColor: UIColor.magenta, title: "My Items", dismissTitle: "Done", dismissImage: nil)
        self.popUpControl?.alpha = 0.0
        self.view.addSubview(self.popUpControl!)
        self.popUpControl?.delegate = self
        
        UIView.animate(withDuration: 0.2, animations: {
            self.popUpControl?.alpha = 1.0
            
        })
        
        self.popUpControl?.updateData(dataArray: ["hi", "there", "yes", "no", "maybe", "sure", "today", "yesterday", "adios", "news", "old"])
    }
    
    func selected(item: ListedObject) {
        
        NSLog("Selected: \(item)")
    }
}

