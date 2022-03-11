//
//  ViewController.swift
//  BookStore
//
//  Created by Mario Saldana on 21/01/22.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController {
    var confirmButton : UIButton?
    var footerLabel : UIButton?
    var emailTextField : UIView?
    var emailText : UITextField?
    var passwordTextField : UIView?
    var passwordText : UITextField?
    var welcomeText : UILabel?
    var topImageView : UIImageView?
    var logo : UIImageView?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
    let shadow = UIColor.black.withAlphaComponent(1).cgColor
    var tabBar : UITabBarController?
    var ojitoButton : UIButton?
    
    //self.passwordText?.text = keyChain["password"]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        initUI()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        
       view.addGestureRecognizer(tap)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        emailText?.text = ""
        passwordText?.text = ""
        
        super.viewDidAppear(animated)
        
        sesionActiva()
        
    }

    func initUI(){
        login()
        
    }
    
    func login(){
        topImageView = UIImageView(frame: .zero)
        topImageView?.image = UIImage(named: "topImage")
        //let frames: ()? = topImageView?.addAnchorsAndSize(width: nil, height: 150, left: 0, top: 0, right: 0, bottom: nil)
        let topImageGradient = CAGradientLayer()
        topImageGradient.frame = CGRect(x: 0, y: 0, width: width, height: 200)
        topImageGradient.colors = [UIColor.clear.cgColor, UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1).cgColor]
        topImageGradient.locations = [0.0, 1.0]
        topImageView?.layer.insertSublayer(topImageGradient, at: 0)
//        topImageView?.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1  )
//        topImageView?.layer.borderWidth = 1
        view.addSubview(topImageView!)
        topImageView?.addAnchorsAndSize(width: nil, height: 200, left: 0, top: 0, right: 0, bottom: nil)
        
        // MARK: - LOGO
        logo = UIImageView()
        logo?.image = UIImage(named: "logo")
        logo?.contentMode = .scaleAspectFit
        view.addSubview(logo!)
        logo?.addAnchorsAndSize(width: 100, height: 100, left: 20, top: 150, right: 20, bottom: nil)
        
        // MARK: - WELCOME TEXT
        welcomeText = UILabel()
        welcomeText?.backgroundColor = .clear
        welcomeText?.text = "¡Bienvenido!"
        welcomeText?.textAlignment = .center
        //welcomeText?.font = UIFont (name: "Brixton Bold", size: 50)
        welcomeText?.font = .systemFont(ofSize: 35, weight: UIFont.Weight.semibold)
        welcomeText?.textColor = UIColor(cgColor: CGColor(red: 0, green: 0, blue: 153/255, alpha: 1))
        view.addSubview(welcomeText!)
        welcomeText?.addAnchorsAndSize(width: nil, height: 50, left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: logo)
        //welcomeText?.addAnchors(left: 10, top: 10, right: 10, bottom: 500, withAnchor: .top, relativeToView: logo)
        
        
        // MARK: - EMAIL
        emailTextField = UIView()
        emailTextField?.backgroundColor = .clear
        //totalTextfield?.alpha = 1
        emailTextField?.layer.cornerRadius = 10
        emailTextField?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        //emailTextField?.layer.borderColor = UIColor(red: 0, green: 0, blue: 153/255, alpha: 1).cgColor//cambio color
        emailTextField?.layer.borderWidth = 1
        view.addSubview(emailTextField!)
        emailTextField?.addAnchorsAndSize(width: width - 40, height: 70, left: 10, top: 70, right: 10, bottom: nil, withAnchor: .top, relativeToView: welcomeText)
        
        emailText = UITextField()
        emailText?.backgroundColor = .clear
        emailText?.attributedPlaceholder = NSAttributedString(
            string:  "example@gmail.com",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.7 )]
        )
        emailText?.font = .systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        emailText?.textColor = .black
        emailText?.keyboardType = .emailAddress
        emailText?.autocapitalizationType = .none
        emailTextField?.addSubview(emailText!)
        emailText?.addAnchorsAndSize(width: width - 40, height: 30, left: 10, top: 12, right: 10, bottom: 10)
        
        // MARK: - PASSWORD
        
        passwordTextField = UIView()
        passwordTextField?.backgroundColor = .clear
        //totalTextfield?.alpha = 1
        passwordTextField?.layer.cornerRadius = 10
        passwordTextField?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        //passwordTextField?.layer.borderColor = UIColor(red: 0, green: 0, blue: 153/255, alpha: 1).cgColor //color cambia al seleccionar
        passwordTextField?.layer.borderWidth = 1
        view.addSubview(passwordTextField!)
        passwordTextField?.addAnchorsAndSize(width: width - 40, height: 70, left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: emailTextField)
        
        
        passwordText = UITextField()
        passwordText?.backgroundColor = .clear
        passwordText?.attributedPlaceholder = NSAttributedString(
            string:  "password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.7 )]
        )
        passwordText?.font = .systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        passwordText?.textColor = .black
        passwordText?.isSecureTextEntry = true
        passwordTextField?.addSubview(passwordText!)
        passwordText?.addAnchorsAndSize(width: width - 40, height: 30, left: 10, top: 12, right: 50, bottom: 10)
        
        ojitoButton = UIButton()
        ojitoButton?.addTarget(self, action: #selector(verPass), for: .touchUpInside)
        ojitoButton?.setImage(UIImage(named: "eye"), for: .normal)
        passwordTextField?.addSubview(ojitoButton!)
        ojitoButton?.addAnchorsAndSize(width: 30, height: 30, left: nil, top: 20, right: 10, bottom: nil)
        
        // MARK: - BUTTON
        confirmButton = UIButton()
        confirmButton?.setTitle("INICIAR SESIÓN", for: .normal)
        confirmButton?.backgroundColor = UIColor(red: 0, green: 0, blue: 153/255, alpha: 1)
        confirmButton?.layer.cornerRadius = 15
        confirmButton?.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(confirmButton!)
        confirmButton?.addAnchorsAndSize(width: width - 40, height: 50, left: 12, top: height/10, right: 12, bottom: nil, withAnchor: .top, relativeToView: passwordTextField)
        let tapLoginButton = UITapGestureRecognizer(target: self, action: #selector(buttonAction))
        confirmButton?.addGestureRecognizer(tapLoginButton)
        
        // MARK: - FOOTER LABEL
        footerLabel = UIButton()
        footerLabel?.setTitle("¿Todavia no tienes cuenta? Registrate", for: .normal)
        footerLabel?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        footerLabel?.setTitleColor(UIColor(red: 0, green: 0, blue: 153/255, alpha: 1), for: .normal)
        footerLabel?.backgroundColor = .clear
        footerLabel?.layer.cornerRadius = 15
        footerLabel?.addTarget(self, action: #selector(registerButton), for: .touchUpInside)
        view.addSubview(footerLabel!)
        footerLabel?.addAnchorsAndSize(width: width - 40, height: 50, left: 12, top:0, right: 12, bottom: nil, withAnchor: .top, relativeToView: confirmButton)
        let tapRegisterButton = UITapGestureRecognizer(target: self, action: #selector(registerButton))
        footerLabel?.addGestureRecognizer(tapRegisterButton)
        
        //Looks for single or multiple taps.
        

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

        
    }
    @objc func verPass(){
        passwordText?.isSecureTextEntry.toggle()
    }
    
        @objc func buttonAction() {
            
            if let mail = emailText?.text {
                if let contrasena = passwordText?.text{
                    iniciarSesion(correo: mail, pass: contrasena)
                }
            }
        }
    
    func iniciarSesion(correo: String, pass: String){
        Auth.auth().signIn(withEmail: correo, password: pass) { [self] user, error in
            if user != nil{
                ("Logueo viewcontroller2")
                let  tabBarVC = UITabBarController()
                let home = BooksViewController()
                let search = SearcherViewController()
                let logOut = ViewController()
                home.title = "Home"
                search.title = "Search"
                logOut.title = "LogOut"
                UITabBar.appearance().tintColor = .black
                UITabBar.appearance().isTranslucent = true
                UITabBar.appearance().backgroundColor = UIColor.gray
                home.tabBarItem.image = UIImage(named: "casa25")
                search.tabBarItem.image = UIImage(named: "search25")
                logOut.tabBarItem.image = UIImage(named: "logout25")

                                //UITabBar.appearance().backgroundImage = UIImage(named: "logo")
                
                
                
                
                tabBarVC.setViewControllers([home,search,logOut], animated: false)
                tabBarVC.modalPresentationStyle = .fullScreen
                present(tabBarVC, animated: true, completion: nil)
                
            }else{
                if let error = error?.localizedDescription{
                    print("Error en Firebase:", error)
                    let alert = UIAlertController(title: "Error :(", message: error, preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    present(alert, animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "Error :(", message: "Error en el código fuente", preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }
    
        @objc func registerButton() {
            let RegisterViewController = RegisterViewController()
            present(RegisterViewController,animated: true,completion:{print("register button press")} )
        }
    
        @objc func dismissKeyboard() {
            //Causes the view (or one of its embedded text fields) to resign the first responder status.
            view.endEditing(true)
        }
    
    func sesionActiva(){
        Auth.auth().addStateDidChangeListener { [self] user, error in
            if error == nil{
                print("No estamos logueados")
                
            }else{
                print("Estamos logueados")

                let  tabBarVC = UITabBarController()
                let home = BooksViewController()
                let search = SearcherViewController()
                //let logOut = ViewController()
                home.title = "Home"
                search.title = "Search"
                //logOut.title = "LogOut"
                UITabBar.appearance().tintColor = .black
                UITabBar.appearance().isTranslucent = true
                UITabBar.appearance().backgroundColor = UIColor.gray
                home.tabBarItem.image = UIImage(named: "casa25")
                search.tabBarItem.image = UIImage(named: "search25")
                //logOut.tabBarItem.image = UIImage(named: "logout25")

                
                tabBarVC.setViewControllers([home,search], animated: false)
                tabBarVC.modalPresentationStyle = .fullScreen
                present(tabBarVC, animated: true, completion: nil)
                
                
                
                
                
                
            }
        }
    }

}

extension UITabBar {
    static func setAppearanceTabbar(){
        UITabBar.appearance().backgroundColor = .red
    }
     
}

