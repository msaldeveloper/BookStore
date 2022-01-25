//
//  LoginViewController.swift
//  BookStore
//
//  Created by Mario Saldana on 21/01/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var topImageView : UIImageView?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        // Do any additional setup after loading the view.
        initUi()
    }
    func initUi(){
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width - 40, height: height/4))
        topImageView?.image = UIImage(named: "topimage")
        view.addSubview(topImageView!)
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

