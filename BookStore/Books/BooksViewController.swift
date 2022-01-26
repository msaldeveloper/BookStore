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
    
    var booksCarruselView : UICollectionView = { // Ponemos el nombre de la var, su tipo y lo igualamaos a {}()
        
        let layout = UICollectionViewFlowLayout() // Declaramo un layout el cual nos servirá para definir los atributtos del collectionView
       // layout.scrollDirection = .horizontal// Aqui definimos el tipo de scroll que tendrá el collection
       
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(BooksCarruselCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.isPagingEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .red
        collection.layer.cornerRadius = 10
        collection.showsVerticalScrollIndicator = true
        collection.showsHorizontalScrollIndicator = true
        return collection // Debemos retornar un valor del tipo del cual estamos declarando
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
        
        
        booksCarruselView.delegate = self
        booksCarruselView.dataSource = self
        booksCarruselView.backgroundColor = .red
        view.addSubview(booksCarruselView)
        booksCarruselView.addAnchorsAndSize(width: nil, height: 300, left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: topImageView)
        
        
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
        //MARK: - AUTORES
        
        let tolkien = Author(authorName: "J.R.R Tolkien")
        let federicoNavarrete = Author(authorName: "Federico Navarrete")
        let charlesDarwin = Author(authorName: "Charles Darwin")
        let michaelNewton = Author(authorName: "Michael Newton")
        let osho = Author(authorName: "osho")
        let dianaWynneJones = Author(authorName: "Diana Wynne Jones")
        let friedrichNietzsche = Author(authorName: "Friedrich Nietzsche")
        let julioVerne = Author(authorName: "Julio Verne")
        let jaimeSabines = Author(authorName: "Jaime Sabines")
        let varios  = Author(authorName: "Varos")
        let miguelDeCervantes = Author(authorName: "Miguel de Cervantes")
        let lewisCarrol = Author(authorName: "Lewis Carrol")
        let marySelley = Author(authorName: "Mary W. Sheley")
        let mauricioMaeterlink = Author(authorName: "Mauricio Maeterlink")
        let juanRulfo = Author(authorName: "Juan Rulfo")
        let antoineDeSaintExupery = Author(authorName: "Antoine De Saint Exupery")
        let edgarAlanPoe = Author(authorName: "Edgar Alan Poe")
        let joseIngenieros = Author(authorName: "Jose Ingenieros")
        let stephenHawking = Author(authorName: "Stephen Hawking")
        let franciscoXimenez = Author(authorName: "Francisco Ximenez")
        let wells = Author(authorName: "H. G. Wells")
        
        //MARK: - CATEGORIAS
        let Novela = Categoria(categoria: "Novela")
        let Historia = Categoria(categoria: "Historia")
        let Cientifico = Categoria(categoria: "Cientifico")
        let Fantasia = Categoria(categoria: "Fantasia")
        let Cuento = Categoria(categoria: "Cuento")
        let Suspenso = Categoria(categoria: "Suspenso")
        let Espiritual = Categoria(categoria: "Espiritual")
        let Filosofia = Categoria(categoria: "Filosofia")
        let Poesia = Categoria(categoria: "Poesia")
        
        
        // MARK: - LIBROS
    
        let elSeñorDeLosAnillos = Libro(bookTitle: "El señor de los anillos", bookPrice: 400, bookPages: 423, bookFormat: "ebook", bookDescription: "La novela narra el viaje del protagonista principal, Frodo Bolsón, hobbit de la Comarca, para destruir el Anillo Único y la consiguiente guerra que provocará el enemigo para recuperarlo, ya que es la principal fuente de poder de su creador, el Señor oscuro, Sauron.", bookLanguage: "español", bookImage: "el señor de los anillos", author: tolkien , categoria: Novela)
        let historiasMexicas = Libro(bookTitle: "Historias Mexicas", bookPrice: 450, bookPages: 271, bookFormat: "pasta blanda", bookDescription: "Historias mexicas nos lleva a pensar las crónicas indígenas como el producto de un diálogo complejo entre lo indígena y lo europeo, y, en este caso, no sólo serían obra de invención, sino también de reinvención. Aquí el indígena es un ser activo y no aquello que la cotidianidad se ha acostumbrado a hacer de menos.", bookLanguage: "español", bookImage: "historias mexicas", author: federicoNavarrete, categoria: Historia)
        let elOrigenDeLasEspecies = Libro(bookTitle: "el origen de las especies", bookPrice: 300, bookPages: 451, bookFormat: "pasta blanda", bookDescription: "El libro de Darwin introdujo la teoría científica de que las poblaciones evolucionan durante el transcurso de las generaciones mediante un proceso conocido como selección natural. Presentó pruebas de que la diversidad de la vida surgió de la descendencia común a través de un patrón ramificado de evolución.", bookLanguage: "español", bookImage: "el origen de las especies", author: charlesDarwin, categoria: Cientifico)
        let vidaEntreVidas = Libro(bookTitle: "vida entre vidas", bookPrice: 200, bookPages: 315, bookFormat: "pasta blanda", bookDescription: "Este libro es más que un manual técnico de metodología, ya que estimula la reflexión personal sobre las maravillas de una creación multidimensional y de nuestro papel en ella, ya sea como almas o como seres humanos encarnados.", bookLanguage: "español", bookImage: "vida entre vidas", author: michaelNewton, categoria: Espiritual)
        let elFiloDeLaNavaja = Libro(bookTitle: "El Filo De la Navaja", bookPrice: 300, bookPages: 286, bookFormat: "pasta blanda", bookDescription: "Una revolución de la conciencia que vaya de lo personal a lo global y de lo mundano a lo trascendente. Vivimos en un mundo en crisis cuya realidad, a menudo, no sabemos cómo abordar. Vivimos en un mundo en crisis cuya realidad, a menudo, no sabemos cómo abordar.", bookLanguage: "español", bookImage: "el filo de la navaja", author: osho, categoria: Espiritual)
        let elCastilloAmbulante = Libro(bookTitle: "El Castillo Ambulante", bookPrice: 400, bookPages: 347, bookFormat: "pasta dura", bookDescription: "Cuando la Bruja del Páramo convierte a Sophie Hatter en una anciana, la joven abandona la sombrerería familiar para pedir ayuda en el único lugar mágico que se le ocurre: el castillo ambulante que atemoriza a los habitantes de Market Chipping.", bookLanguage: "español", bookImage: "el castillo ambulante", author: dianaWynneJones, categoria: Fantasia)
        let elOrigenDeLaTragedia = Libro(bookTitle: "El Origen de la Tragedia", bookPrice: 600, bookPages: 208, bookFormat: "pasta dura", bookDescription: "Opera prima de Friedrich Nietzsche, El origen de la tragedia es una obra intrépida y chispeante, llena de arrojo intelectual y entusiasmo juvenil, que desconcertó y fue malinterpretada por sus contemporáneos. El propio Nietzsche la calificó quince años después como un libro imposible por la ambigüedad de su estilo.", bookLanguage: "español", bookImage: "el origen de la trajedia", author: friedrichNietzsche, categoria: Filosofia)
        let viajeAlCentroDeLaTierra = Libro(bookTitle: "Viaje al Centro de la Tierra", bookPrice: 60, bookPages: 93, bookFormat: "pasta blanda", bookDescription: "Viaje al centro de la Tierra (Voyage au centre de la Terre) es una novela de Julio Verne, publicada el 25 de noviembre de 1864; la cual trata de la expedición de un profesor de mineralogía, Otto Lidenbrock, su sobrino Axel y un guía llamado Hans al interior de la Tierra.", bookLanguage: "español", bookImage: "viaje al centro de la tierra", author: julioVerne, categoria: Novela)
        let recuentoDePoemas = Libro(bookTitle: "Recuento de Poemas I", bookPrice: 300, bookPages: 203, bookFormat: "pasta dura", bookDescription: "La obra completa de Jaime Sabines se reúne en esta edición revisada y contrastada con los documentos originales del poeta en la que se recuperan poemas que habían sido excluidos en algunas ediciones anteriores una obra imprescindible en la historia de la literatura hispanoamericana.", bookLanguage: "español", bookImage: "recuento de poemas", author: jaimeSabines, categoria: Poesia)
        let mexicoATravezDeSusLeyendas = Libro(bookTitle: "mexico a traves de sus leyendas", bookPrice: 100, bookPages: 95, bookFormat: "pasta blanda", bookDescription: "libro de leyendas mexicanas", bookLanguage: "español", bookImage: "mexico a traves de sus leyendas", author: varios, categoria: Fantasia)
        let quijote = Libro(bookTitle: "Don Quijote De la Mancha I", bookPrice: 600, bookPages: 865, bookFormat: "pasta blanda", bookDescription: "Don Quijote es un hombre terco, de firmes opiniones y valiente. Alonso Quijano es, según se lo describe, un hombre viejo, desgarbado y extremadamente delgado. Habitualmente se representa con barba y llevando una armadura destartalada.", bookLanguage: "español", bookImage: "quijote", author: miguelDeCervantes, categoria: Novela)
        let aliciaAtravesDelEspejo = Libro(bookTitle: "Alicia A Traves Del Espejo ", bookPrice: 100, bookPages: 298, bookFormat: "pasta dura", bookDescription: "Cuenta la historia de Alicia quien se pregunta cómo debe de ser el Mundo a Través del Espejo, se sorprende al comprobar que puede pasar a través de él, llegando a un mundo de fantasía poblado por seres de lo más extraño. Allí, debe jugar una gran partida de ajedrez donde conocerá a los habitantes de este mundo.", bookLanguage: "español", bookImage: "alicia", author: lewisCarrol, categoria: Fantasia)
        let laGuerraDeLosMundos = Libro(bookTitle: "la guerra de los mundos", bookPrice: 100, bookPages: 206, bookFormat: "pasta blanda", bookDescription: "Han llegado del espacio exterior, de Marte. Equipados con terribles máquinas, los invasores aterrizan en nuestro planeta y empiezan a sembrar el terror y la destrucción. Su único objetivo es conquistar la Tierra y convertir a los humanos en sus esclavos.", bookLanguage: "español", bookImage: "la guerra de los mundos", author: wells, categoria: Fantasia)
        let frankenstein = Libro(bookTitle: "Frankenstein", bookPrice: 100, bookPages: 253, bookFormat: "pasta dura", bookDescription: "Frankenstein es una historia macabra en la que Víctor, un joven ávido de conocimientos científicos, se obsesiona por lograr el mayor reto posible en el mundo científico: dar vida a un cuerpo muerto.", bookLanguage: "español", bookImage: "frankenstein", author: marySelley, categoria: Suspenso)
        let laVidaDeLasAbejas = Libro(bookTitle: "la vida de las abejas ", bookPrice: 100, bookPages: 140, bookFormat: "pastaC blanda", bookDescription: "ciclo de vida y crianza de las abejas", bookLanguage: "español", bookImage: "abejas", author: mauricioMaeterlink, categoria: Cientifico)
        let pedroParamo = Libro(bookTitle: "Pedro Paramo Y el LLano En LLamas", bookPrice: 200, bookPages: 255, bookFormat: "pasta dura", bookDescription: "El clima que presentan los cuentos es, en cierto modo, una anticipación de lo que luego sería la primera novela de Rulfo, Pedro Páramo. Aunque se trata de historias diferentes, tienen en común la memoria del pasado y los estragos de la Revolución mexicana, que tanto marcó la vida y obra de Rulfo. ", bookLanguage: "español", bookImage: "llano en llamas ", author: juanRulfo, categoria: Novela)
        let principito  = Libro(bookTitle: "el principito", bookPrice:  100, bookPages: 91, bookFormat: "pasta blanda", bookDescription: "El principito es una narración corta del escritor francés Antoine de Saint-Exupéry, que trata de la historia de un pequeño príncipe que parte de su asteroide a una travesía por el universo, en la cual descubre la extraña forma en que los adultos ven la vida y comprende el valor del amor y la amistad.", bookLanguage: "español", bookImage: "principito", author: antoineDeSaintExupery, categoria:  Cuento)
        let elCuervo = Libro(bookTitle: "El Cuervo", bookPrice: 100, bookPages: 91, bookFormat: "pasta blanda", bookDescription: "", bookLanguage: "El texto narra la misteriosa visita de un cuervo parlante a la casa de un amante afligido, y del lento descenso hacia la locura de este último. El amante, que a menudo se ha identificado como un estudiante,​​ llora la pérdida de su amada, Leonora.", bookImage: "el cuervo", author: edgarAlanPoe, categoria: Suspenso)
        let elHombreMediocre = Libro(bookTitle: "El Hombre Mediocre", bookPrice: 200, bookPages: 222, bookFormat: "pasta blanda", bookDescription: "La obra trata sobre la naturaleza del hombre, oponiendo dos tipos de personalidades: la del hombre mediocre y la del idealista, analizando las características morales de cada uno, y las formas y papeles que estos tipos de hombres han adoptado en la historia, la sociedad y la cultura.", bookLanguage: "español", bookImage: "hombre mediocre", author: joseIngenieros, categoria: Filosofia)
        let agujerosNegrosYPequeñosUniversos = Libro(bookTitle: "Agujeros Negros Y Pequeños Universos", bookPrice: 500, bookPages: 217, bookFormat: "ebook", bookDescription: "Agujeros negros y pequeños universos y otros ensayos (Black Holes and Baby Universes and Other Essays título original en inglés) es el libro de Stephen Hawking de 1994 en el que trata sobre algunos aspectos cosmológicos acerca del Universo y que plantea preguntas sobre el mismo.", bookLanguage: "español", bookImage: "agujero negro", author: stephenHawking, categoria: Cientifico)
        let popolVuh = Libro(bookTitle: "Popol Vuh", bookPrice: 100, bookPages: 140, bookFormat: "pasta blanda", bookDescription: "las antiguas historias de quiche", bookLanguage: "español", bookImage: "popolVuh", author: franciscoXimenez, categoria: Novela)
        let elViajeDelBeagle = Libro(bookTitle: "El Viaje del Beagle", bookPrice: 300, bookPages: 400, bookFormat: "ebook", bookDescription: "viaje de darwin a bordo de la embarcacion beagle", bookLanguage: "español", bookImage: "beagle", author: charlesDarwin, categoria: Cientifico)
        
        
        
        // MARK: _ BOOKOBJECT
        let books = bookObject(Libro: [elSeñorDeLosAnillos, historiasMexicas, elOrigenDeLasEspecies, vidaEntreVidas, elFiloDeLaNavaja, elCastilloAmbulante, elOrigenDeLaTragedia, laGuerraDeLosMundos, viajeAlCentroDeLaTierra, recuentoDePoemas, mexicoATravezDeSusLeyendas, quijote, popolVuh, elViajeDelBeagle, agujerosNegrosYPequeñosUniversos, elHombreMediocre, frankenstein, laVidaDeLasAbejas, elCuervo,aliciaAtravesDelEspejo, pedroParamo, principito], Categoria: [Novela,Historia,Cientifico,Fantasia,Cuento,Suspenso,Espiritual,Filosofia,Poesia])
        
        dataSource = books
        
        booksCollectionView.reloadData()
        booksCarruselView.reloadData()
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
