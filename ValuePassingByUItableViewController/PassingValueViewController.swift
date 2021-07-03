//
//  PassingValueViewController.swift
//  ValuePassingByUItableViewController
//
//  Created by IwasakIYuta on 2021/07/03.
//

import UIKit

class PassingValueViewController: UIViewController {

   var leble = ""
    
    @IBOutlet weak var celltextFieldLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        celltextFieldLabel.text = leble
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
