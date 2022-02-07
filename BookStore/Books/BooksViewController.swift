//
//  BooksViewController.swift
//  BookStore
//
//  Created by Mario Saldana on 25/01/22.
//

import UIKit

class BooksViewController: UIViewController {
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
    var dataSource : bookObject?
    var topImageView : UIImageView?
    var backImage : UIButton?
    
    
    
    var booksCollectionView : UICollectionView = { // Ponemos el nombre de la var, su tipo y lo igualamaos a {}()
        
        let newlayout = UICollectionViewFlowLayout() // Declaramo un layout el cual nos servirá para definir los atributtos del collectionView
        newlayout.scrollDirection = .vertical// layout.scrollDirection = .horizontal// Aqui definimos el tipo de scroll que tendrá el collection
        newlayout.minimumLineSpacing = 20
        newlayout.minimumInteritemSpacing = 20
        
        let newcollection = UICollectionView(frame: .zero, collectionViewLayout: newlayout)
        newcollection.register(BooksCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        newcollection.isPagingEnabled = true
        newcollection.translatesAutoresizingMaskIntoConstraints = false
        newcollection.backgroundColor = .red
        newcollection.layer.cornerRadius = 10
        newcollection.showsVerticalScrollIndicator = true
        newcollection.showsHorizontalScrollIndicator = true
        return newcollection // Debemos retornar un valor del tipo del cual estamos declarando
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        initUi()
        getData()
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
    
    func initUi() {
        topImageView = UIImageView(frame: .zero)
        topImageView?.image = UIImage(named: "topImage")
        let topImageGradient = CAGradientLayer()
        topImageGradient.frame = CGRect(x: 0, y: 0, width: width, height: 200)
        topImageGradient.colors = [UIColor.clear.cgColor, UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1).cgColor]
        topImageGradient.locations = [0.0, 1.0]
        topImageView?.layer.insertSublayer(topImageGradient, at: 0)
        view.addSubview(topImageView!)
        topImageView?.addAnchorsAndSize(width: nil, height: 200, left: 0, top: 0, right: 0, bottom: nil)
        
        
        
        booksCollectionView.delegate = self
        booksCollectionView.dataSource = self
        booksCollectionView.backgroundColor = .clear
        view.addSubview(booksCollectionView)
        booksCollectionView.addAnchors(left: 10, top: 320, right: 10, bottom: 20, withAnchor: .top, relativeToView: topImageView)
        //booksCollectionView.addAnchorsWithMargin(20)
        //booksCollectionView.addAnchors(left: 10, top: 50, right: 0, bottom: nil, withAnchor: .top, relativeToView: topImageView)
//        guard let topImageView = self.topImageView else { return }
//        booksCollectionView.topAnchor.constraint(equalTo: topImageView.topAnchor, constant: 50) .isActive = true
        
        
    }
    
    func getData() {
        //MARK: - Response

        //dataSource = books
        
        booksCollectionView.reloadData()
        //booksCarruselView.reloadData()
    }
    
}
extension BooksViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return dataSource?.authorName?[section].authorBooks?.count ?? 0
        return dataSource?.Libro?.count ?? 0
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource?.Categoria?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = booksCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BooksCollectionViewCell
        //let libros = dataSource?.authorName?[indexPath.section].authorBooks?[indexPath.item]
        let libros = dataSource?.Libro?[indexPath.item]
//        func datass(){
//            cell.setDataBook(libro: libros!)
//            cell.setDataBook2(libro: libros!)
//        }
        cell.setDataBook(libro: libros!)

        
        return cell;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width/1.2, height: height/4)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Estoy en la seccion \(indexPath.section) en la celda \(indexPath.row)")
        let producto = dataSource?.Libro?[indexPath.row]
        let vc = detailProductViewController()
        vc.product = producto
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}
