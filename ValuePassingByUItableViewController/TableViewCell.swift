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
    typealias Handler = (UIButton, UITextField) -> Void
    var delegate: UIViewController? //必要//イベント通知でTableViewのクラスに伝える
    var alert:UIAlertController!
       
    //引数にUIButtonとUITextFieidを持つ連想型型の定義
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
        showAlert()
        handler?(button, textField)
    }
    func showAlert(){
          alert = UIAlertController(title:"Title",
                                        message: "Message",
                                        preferredStyle: .alert)
          
          
          let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel",
                                                         style: .cancel,
                                                         handler:{
                                                          action in
          })
          let OKAction:UIAlertAction = UIAlertAction(title: "OK",
                                                     style: .default,
                                                     handler:{
                                                      (action:UIAlertAction!) -> Void in
                                                        //delegateクラスはUIViewController型のために下のstoryboardプロパティやpresentメソッドを使うことができるその他にCell内でも遷移できるようにできると
                                                        let vc = self.delegate?.storyboard?.instantiateViewController(identifier: "vc") as! PassingValueViewController //vc先を指定して
                                                        vc.leble = self.textField.text ?? ""
                                                        self.delegate?.present(vc, animated: true, completion: nil)
          })
          alert.addAction(cancelAction)
          alert.addAction(OKAction)
        delegate!.present(alert, animated: true, completion: nil) //必要
      }
    func setup(butonTitle: String, valuText: String, tapHandler: @escaping Handler) {
        button.setTitle(butonTitle, for: .normal)
        textField.text = valuText
    
        handler = tapHandler
    }

    
}
