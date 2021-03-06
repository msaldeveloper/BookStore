//
//  RegisterViewController.swift
//  BookStore
//
//  Created by Mario Saldana on 21/01/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegisterViewController: UIViewController {
    var topImageView : UIImageView?
    var backImage : UIButton?
    var infoText : UITextView?
    var ref: DatabaseReference?
    var alerta = ""
    
    var registerField : UIView?
    var registerTitle : UILabel?
    var userTextField : UIView?
    var userText : UITextField?
    var emailTextField : UIView?
    var emailText : UITextField?
    var passwordTextField : UIView?
    var passwordText : UITextField?
    var confirmTextField : UIView?
    var confirmText : UITextField?
    var confirmButton : UIButton?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
    var ojitoButton : UIButton?
    var ojitoButtonConfirm : UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        view.backgroundColor = backgroundColor
        // Do any additional setup after loading the view.
        initUi()
        //Looks for single or multiple taps.
             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func initUi(){
        topSection()
        resgister()
        createButton()
    }
    
    
    func topSection() {
        topImageView = UIImageView(frame: .zero)
        topImageView?.image = UIImage(named: "topImage")
        //let frames: ()? = topImageView?.addAnchorsAndSize(width: nil, height: 150, left: 0, top: 0, right: 0, bottom: nil)
        let topImageGradient = CAGradientLayer()
        topImageGradient.frame = CGRect(x: 0, y: 0, width: width, height: 100)
        topImageGradient.colors = [UIColor.clear.cgColor, UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1).cgColor]
        topImageGradient.locations = [0.0, 1.0]
        topImageView?.layer.insertSublayer(topImageGradient, at: 0)
//        topImageView?.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1  )
//        topImageView?.layer.borderWidth = 1
        view.addSubview(topImageView!)
        topImageView?.addAnchorsAndSize(width: nil, height: 100, left: 0, top: 0, right: 0, bottom: nil)
        
//        backText = UITextView()
//        backText?.backgroundColor = .clear
//        backText?.text = "Regresar"
//        backText?.font = .systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
//        backText?.textColor = UIColor(red: 0, green: 0, blue: 153/255, alpha: 1)
//        view.addSubview(backText!)
//        backText?.addAnchorsAndSize(width: 120, height: 50, left: 55, top: 50, right: nil, bottom: nil)
        
        backImage = UIButton()
        backImage?.setImage(UIImage(named: "back"), for: .normal)
        backImage?.addTarget(self, action:#selector(backAction) , for: .touchUpInside)
        backImage?.tintColor = UIColor.red
        view.addSubview(backImage!)
        backImage?.addAnchorsAndSize(width: 30, height: 30, left: 20, top: 55, right: nil, bottom: nil)
        
        infoText = UITextView()
        infoText?.backgroundColor = .clear
        infoText?.text = "Estas a unos cuantos pasos de vivir la mejor experiencia"
        infoText?.font = .systemFont(ofSize: 20)
        infoText?.textColor = UIColor(red: 0, green: 128/255, blue: 255/255, alpha: 1)
        view.addSubview(infoText!)
        infoText?.addAnchorsAndSize(width: nil, height: 80, left: 25, top: 20, right: 25, bottom: nil, withAnchor: .top, relativeToView: backImage)
       
    }
    @objc func backAction(){
        print("Back")
        dismiss(animated: true)
    }
    func resgister(){
        registerField = UIView()
        registerField?.backgroundColor = .white
        registerField?.layer.cornerRadius = 10
        view.addSubview(registerField!)
        registerField?.addAnchorsAndSize(width: nil, height: height/2, left: 25, top: 15, right: 25, bottom: nil, withAnchor: .top, relativeToView: infoText)
        
        registerTitle = UILabel()
        registerTitle?.backgroundColor = .clear
        registerTitle?.text = "Registra tu informaci??n"
        registerTitle?.font = .systemFont(ofSize: 25, weight: UIFont.Weight.semibold)
        registerTitle?.textColor = UIColor(red: 0, green: 0, blue: 153/255, alpha: 1)
        registerField?.addSubview(registerTitle!)
        registerTitle?.addAnchorsAndSize(width: nil, height: 40, left: 30, top: 50, right: 20, bottom: nil)
        
        
        userTextField = UIView()
        userTextField?.backgroundColor = .clear
        //totalTextfield?.alpha = 1
        userTextField?.layer.cornerRadius = 10
        userTextField?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        //emailTextField?.layer.borderColor = UIColor(red: 0, green: 0, blue: 153/255, alpha: 1).cgColor//cambio color
        userTextField?.layer.borderWidth = 1
        registerField?.addSubview(userTextField!)
        userTextField?.addAnchorsAndSize(width: width - 40, height: 50, left: 10, top: 40, right: 10, bottom: nil, withAnchor: .top, relativeToView: registerTitle)
        
        userText = UITextField()
        userText?.backgroundColor = .clear
        userText?.attributedPlaceholder = NSAttributedString(
            string:  "msalda",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.7 )]
        )
        userText?.font = .systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        userText?.textColor = .black
        userText?.autocapitalizationType = .none
        userTextField?.addSubview(userText!)
        userText?.addAnchorsAndSize(width: width - 40, height: 30, left: 10, top: 12, right: 10, bottom: 10)
        
        
        
        emailTextField = UIView()
        emailTextField?.backgroundColor = .clear
        //totalTextfield?.alpha = 1
        emailTextField?.layer.cornerRadius = 10
        emailTextField?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        //emailTextField?.layer.borderColor = UIColor(red: 0, green: 0, blue: 153/255, alpha: 1).cgColor//cambio color
        emailTextField?.layer.borderWidth = 1
        registerField?.addSubview(emailTextField!)
        emailTextField?.addAnchorsAndSize(width: width - 40, height: 50, left: 10, top: 22, right: 10, bottom: nil, withAnchor: .top, relativeToView: userTextField)
        
        emailText = UITextField()
        emailText?.backgroundColor = .clear
        emailText?.attributedPlaceholder = NSAttributedString(
            string:  "correo@gmail.com",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.7 )]
        )
        emailText?.font = .systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        emailText?.textColor = .black
        emailText?.keyboardType = .emailAddress
        emailTextField?.addSubview(emailText!)
        emailText?.addAnchorsAndSize(width: width - 40, height: 30, left: 10, top: 12, right: 15, bottom: 10)
        
        
        passwordTextField = UIView()
        passwordTextField?.backgroundColor = .clear
        //totalTextfield?.alpha = 1
        passwordTextField?.layer.cornerRadius = 10
        passwordTextField?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        //emailTextField?.layer.borderColor = UIColor(red: 0, green: 0, blue: 153/255, alpha: 1).cgColor//cambio color
        passwordTextField?.layer.borderWidth = 1
        registerField?.addSubview(passwordTextField!)
        passwordTextField?.addAnchorsAndSize(width: width - 40, height: 50, left: 10, top: 22, right: 10, bottom: nil, withAnchor: .top, relativeToView: emailTextField)
        
        passwordText = UITextField()
        passwordText?.backgroundColor = .clear
        passwordText?.attributedPlaceholder = NSAttributedString(
            string:  "1AX123-cw@",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.7 )]
        )
        passwordText?.font = .systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        passwordText?.textColor = .black
        passwordText?.textColor = .black
        passwordText?.isSecureTextEntry = true
        passwordTextField?.addSubview(passwordText!)
        passwordText?.addAnchorsAndSize(width: width - 40, height: 30, left: 10, top: 12, right: 50, bottom: 10)
        
        ojitoButton = UIButton()
        ojitoButton?.addTarget(self, action: #selector(verPass), for: .touchUpInside)
        ojitoButton?.setImage(UIImage(named: "eye"), for: .normal)
        passwordTextField?.addSubview(ojitoButton!)
        ojitoButton?.addAnchorsAndSize(width: 30, height: 30, left: nil, top: 10, right: 10, bottom: nil)
        
        
        confirmTextField = UIView()
        confirmTextField?.backgroundColor = .clear
        //totalTextfield?.alpha = 1
        confirmTextField?.layer.cornerRadius = 10
        confirmTextField?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        //emailTextField?.layer.borderColor = UIColor(red: 0, green: 0, blue: 153/255, alpha: 1).cgColor//cambio color
        confirmTextField?.layer.borderWidth = 1
        registerField?.addSubview(confirmTextField!)
        confirmTextField?.addAnchorsAndSize(width: width - 40, height: 50, left: 10, top: 22, right: 10, bottom: nil, withAnchor: .top, relativeToView: passwordTextField)
        
        confirmText = UITextField()
        confirmText?.backgroundColor = .clear
        confirmText?.attributedPlaceholder = NSAttributedString(
            string:  "1AX123-cw@",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.7 )]
        )
        confirmText?.font = .systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        confirmText?.textColor = .black
        confirmText?.textColor = .black
        confirmText?.isSecureTextEntry = true
        confirmTextField?.addSubview(confirmText!)
        confirmText?.addAnchorsAndSize(width: width - 40, height: 30, left: 10, top: 12, right: 50, bottom: 10)
        
        ojitoButtonConfirm = UIButton()
        ojitoButtonConfirm?.addTarget(self, action: #selector(verPassConfirm), for: .touchUpInside)
        ojitoButtonConfirm?.setImage(UIImage(named: "eye"), for: .normal)
        confirmTextField?.addSubview(ojitoButtonConfirm!)
        ojitoButtonConfirm?.addAnchorsAndSize(width: 30, height: 30, left: nil, top: 10, right: 10, bottom: nil)
        
        
    }
    func createButton(){
        // MARK: - BUTTON
        confirmButton = UIButton()
        confirmButton?.setTitle("CREAR CUENTA", for: .normal)
        confirmButton?.backgroundColor = UIColor(red: 0, green: 0, blue: 153/255, alpha: 1)
        confirmButton?.layer.cornerRadius = 15
        confirmButton?.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(confirmButton!)
        confirmButton?.addAnchorsAndSize(width: width - 40, height: 50, left: 25, top: height/15, right: 25, bottom: nil, withAnchor: .top, relativeToView: registerField)
        let tapLoginButton = UITapGestureRecognizer(target: self, action: #selector(buttonAction))
        confirmButton?.addGestureRecognizer(tapLoginButton)
    }
    @objc func verPass(){
        passwordText?.isSecureTextEntry.toggle()
    }
    @objc func verPassConfirm(){
        confirmText?.isSecureTextEntry.toggle()
    }
    
    
    @objc func buttonAction(){
        var seguridadMinuscula = false
        var seguridadMayuscula = false
        var seguridadNumero = false
        var seguridadEspecial = false
        var seguridadCount = false
        
        print("Registro")
        if let nombre = userText?.text{
            if nombre != ""{
                print(nombre)
                if let mail = emailText?.text {
                    if let contrasena = passwordText?.text{
                        if let contrasenaConfirmada = confirmText?.text{
                            for i in contrasena{
                                switch i{
                                    case "a","b","c","d","e","f","g","h","i","j","k","l","m","n","??","o","p","q","r","s","t","u","v","w","x","y","z":
                                    seguridadMinuscula = true
                                    case "A","B","C","D","E","F","G","H","I","J","K","L","M","N","??","O","P","Q","R","S","T","U","V","W","X","Y","Z":
                                    seguridadMayuscula = true
                                    case "1","2","3","4","5","6","7","8","9","0":
                                    seguridadNumero = true
                                    default:
                                    seguridadEspecial = true
                                }
                            }
                            if contrasena.count >= 8{
                                seguridadCount = true
                            }
                            if seguridadMinuscula && seguridadMayuscula && seguridadNumero && seguridadEspecial && seguridadCount{
                                if contrasena == contrasenaConfirmada{
                                        registroTerminado(nombre: nombre, correo: mail, pass: contrasena)
                                }else{
                                    alerta = "Las contrase??as no coinciden"
                                    let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
                                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                                    alert.addAction(aceptar)
                                    self.present(alert, animated: true, completion: nil)
                                }
                            }else{
                                alerta = "La contrase??a debe contener al menos 8 car??cteres entre los cuales debe haber al menos una min??scula, una may??scula, un n??mero y un car??cter especial"
                                let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
                                let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                                alert.addAction(aceptar)
                                self.present(alert, animated: true, completion: nil)
                            }
                        }else{
                            alerta = "Introduce la confirmaci??n de la contrase??a"
                            let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
                            let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                            alert.addAction(aceptar)
                            self.present(alert, animated: true, completion: nil)
                        }
                    }else{
                        alerta = "La contrase??a no est?? introducida"
                        let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
                        let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                        alert.addAction(aceptar)
                        self.present(alert, animated: true, completion: nil)
                    }
                }else{
                    alerta = "El correo no est?? introducido"
                    let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    self.present(alert, animated: true, completion: nil)
                }
            }else{
                alerta = "El nombre de usuario no est?? introducido"
                let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
                let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                alert.addAction(aceptar)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func registroTerminado(nombre: String, correo: String, pass: String){
        Auth.auth().createUser(withEmail: correo, password: pass) { [self] user, error in
            if user != nil{
                print("Usuario creado")
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
                
                //self.dismiss(animated: true, completion: nil)
            }else{
                if let error = error?.localizedDescription{
                    print("Error en Firebase:", error)
                    let alert = UIAlertController(title: "Error :(", message: error, preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "Error :(", message: "Error en el c??digo fuente", preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }
//    @objc func buttonAction() {
//        print("create account press press")
//        if passwordText?.text == confirmText?.text && userText?.text != "" && emailText?.text != "" && passwordText?.text != "" && confirmText?.text != ""{
//            let BooksViewController = BooksViewController()
//            BooksViewController.modalPresentationStyle = .fullScreen
//            present(BooksViewController,animated: true,completion:{print("register button press validated")} )
//        }else if passwordText?.text != confirmText?.text {
//            let alert = UIAlertController(title: "Error en datos", message: "las contrase??as son diferentes", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }else if userText?.text == "" && emailText?.text == ""{
//            let alert = UIAlertController(title: "Error en datos", message: "Porfavor Completa el Registro", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }else if passwordText?.text == "" && confirmText?.text == ""{
//            let alert = UIAlertController(title: "Error en datos", message: "Porfavor Completa el Registro", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

