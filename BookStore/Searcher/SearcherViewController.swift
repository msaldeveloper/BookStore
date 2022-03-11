//
//  SearcherViewController.swift
//  BookStore
//
//  Created by Mario Saldana on 11/03/22.
//

import UIKit

class SearcherViewController: UIViewController {
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
    var dataSource : bookObject?
    var topImageView : UIImageView?
    var seachInput : UITextField?
    var searchBook: UIView?
    var searchButton: UIButton?
    var userName : UILabel?
    var backImage : UIButton?
    var bookManager = BookManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        view.backgroundColor = backgroundColor
    }
    
    func initUI(){
        backImage = UIButton()
        backImage?.setImage(UIImage(named: "back"), for: .normal)
        backImage?.addTarget(self, action:#selector(backAction) , for: .touchUpInside)
        backImage?.tintColor = UIColor.red
        view.addSubview(backImage!)
        backImage?.addAnchorsAndSize(width: 30, height: 30, left: 20, top: 55, right: nil, bottom: nil)
        
    }
    
    @objc func backAction(){
        print("Back")
        dismiss(animated: true)
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
