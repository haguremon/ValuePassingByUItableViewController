//
//  TableViewCell.swift
//  ValuePassingByUItableViewController
//
//  Created by IwasakIYuta on 2021/07/03.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    typealias Handler = (UIButton, UITextField) -> Void //引数にUIButtonとUITextFieidを持つ連想型型の定義
    private var handler: Handler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func passgValueButton(_ sender: Any) {
    handler?(button, textField)
    }
    func setup(butonTitle: String, valuText: String, tapHandler: @escaping Handler) {
        button.setTitle(butonTitle, for: .normal)
        textField.text = valuText
        handler = tapHandler
    }

    
}
