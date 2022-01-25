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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor

        // Do any additional setup after loading the view.
    }
    
    func initUi() {
        
    }
    
    func getData () {
        // MARK: - LIBROS
        let elSeñorDeLosAnillos = Libro(bookTitle: "El señor de los anillos", bookPrice: 400, bookPages: 423, bookFormat: "ebook", bookDescription: "La novela narra el viaje del protagonista principal, Frodo Bolsón, hobbit de la Comarca, para destruir el Anillo Único y la consiguiente guerra que provocará el enemigo para recuperarlo, ya que es la principal fuente de poder de su creador, el Señor oscuro, Sauron.", bookLanguage: "español", bookImage: "el señor de los anillos")
        let historiasMexicas = Libro(bookTitle: "Historias Mexicas", bookPrice: 450, bookPages: 271, bookFormat: "pasta blanda", bookDescription: "Historias mexicas nos lleva a pensar las crónicas indígenas como el producto de un diálogo complejo entre lo indígena y lo europeo, y, en este caso, no sólo serían obra de invención, sino también de reinvención. Aquí el indígena es un ser activo y no aquello que la cotidianidad se ha acostumbrado a hacer de menos.", bookLanguage: "español", bookImage: "historias mexicas")
        let elOrigenDeLasEspecies = Libro(bookTitle: "el origen de las especies", bookPrice: 300, bookPages: 451, bookFormat: "pasta blanda", bookDescription: "El libro de Darwin introdujo la teoría científica de que las poblaciones evolucionan durante el transcurso de las generaciones mediante un proceso conocido como selección natural. Presentó pruebas de que la diversidad de la vida surgió de la descendencia común a través de un patrón ramificado de evolución.", bookLanguage: "español", bookImage: "el origen de las especies")
        let vidaEntreVidas = Libro(bookTitle: "vida entre vidas", bookPrice: 200, bookPages: 315, bookFormat: "pasta blanda", bookDescription: "Este libro es más que un manual técnico de metodología, ya que estimula la reflexión personal sobre las maravillas de una creación multidimensional y de nuestro papel en ella, ya sea como almas o como seres humanos encarnados.", bookLanguage: "español", bookImage: "vida entre vidas")
        let elFiloDeLaNavaja = Libro(bookTitle: "El Filo De la Navaja", bookPrice: 300, bookPages: 286, bookFormat: "pasta blanda", bookDescription: "Una revolución de la conciencia que vaya de lo personal a lo global y de lo mundano a lo trascendente. Vivimos en un mundo en crisis cuya realidad, a menudo, no sabemos cómo abordar. Vivimos en un mundo en crisis cuya realidad, a menudo, no sabemos cómo abordar.", bookLanguage: "español", bookImage: "el filo de la navaja")
        let elCastilloAmbulante = Libro(bookTitle: "El Castillo Ambulante", bookPrice: 400, bookPages: 347, bookFormat: "pasta dura", bookDescription: "Cuando la Bruja del Páramo convierte a Sophie Hatter en una anciana, la joven abandona la sombrerería familiar para pedir ayuda en el único lugar mágico que se le ocurre: el castillo ambulante que atemoriza a los habitantes de Market Chipping.", bookLanguage: "español", bookImage: "el castillo ambulante")
        let elOrigenDeLaTragedia = Libro(bookTitle: "El Origen de la Tragedia", bookPrice: 600, bookPages: 208, bookFormat: "pasta dura", bookDescription: "Opera prima de Friedrich Nietzsche, El origen de la tragedia es una obra intrépida y chispeante, llena de arrojo intelectual y entusiasmo juvenil, que desconcertó y fue malinterpretada por sus contemporáneos. El propio Nietzsche la calificó quince años después como un libro imposible por la ambigüedad de su estilo.", bookLanguage: "español", bookImage: "el origen de la trajedia")
        let viajeAlCentroDeLaTierra = Libro(bookTitle: "Viaje al Centro de la Tierra", bookPrice: 60, bookPages: 93, bookFormat: "pasta blanda", bookDescription: "Viaje al centro de la Tierra (Voyage au centre de la Terre) es una novela de Julio Verne, publicada el 25 de noviembre de 1864; la cual trata de la expedición de un profesor de mineralogía, Otto Lidenbrock, su sobrino Axel y un guía llamado Hans al interior de la Tierra.", bookLanguage: "español", bookImage: "viaje al centro de la tierra")
        let recuentoDePoemas = Libro(bookTitle: "Recuento de Poemas I", bookPrice: 300, bookPages: 203, bookFormat: "pasta dura", bookDescription: "La obra completa de Jaime Sabines se reúne en esta edición revisada y contrastada con los documentos originales del poeta en la que se recuperan poemas que habían sido excluidos en algunas ediciones anteriores una obra imprescindible en la historia de la literatura hispanoamericana.", bookLanguage: "español", bookImage: "recuento de poemas")
        let mexicoATravezDeSusLeyendas = Libro(bookTitle: "mexico a traves de sus leyendas", bookPrice: 100, bookPages: 95, bookFormat: "pasta blanda", bookDescription: "libro de leyendas mexicanas", bookLanguage: "español", bookImage: "mexico a traves de sus leyendas")
        let quijote = Libro(bookTitle: "Don Quijote De la Mancha I", bookPrice: 600, bookPages: 865, bookFormat: "pasta blanda", bookDescription: "Don Quijote es un hombre terco, de firmes opiniones y valiente. Alonso Quijano es, según se lo describe, un hombre viejo, desgarbado y extremadamente delgado. Habitualmente se representa con barba y llevando una armadura destartalada.", bookLanguage: "español", bookImage: "quijote")
        let aliciaAtravesDelEspejo = Libro(bookTitle: "Alicia A Traves Del Espejo ", bookPrice: 100, bookPages: 298, bookFormat: "pasta dura", bookDescription: "Cuenta la historia de Alicia quien se pregunta cómo debe de ser el Mundo a Través del Espejo, se sorprende al comprobar que puede pasar a través de él, llegando a un mundo de fantasía poblado por seres de lo más extraño. Allí, debe jugar una gran partida de ajedrez donde conocerá a los habitantes de este mundo.", bookLanguage: "español", bookImage: "alicia")
        let laGuerraDeLosMundos = Libro(bookTitle: "la guerra de los mundos", bookPrice: 100, bookPages: 206, bookFormat: "pasta blanda", bookDescription: "Han llegado del espacio exterior, de Marte. Equipados con terribles máquinas, los invasores aterrizan en nuestro planeta y empiezan a sembrar el terror y la destrucción. Su único objetivo es conquistar la Tierra y convertir a los humanos en sus esclavos.", bookLanguage: "español", bookImage: "la guerra de los mundos")
        let frankenstein = Libro(bookTitle: "Frankenstein", bookPrice: 100, bookPages: 253, bookFormat: "pasta dura", bookDescription: "Frankenstein es una historia macabra en la que Víctor, un joven ávido de conocimientos científicos, se obsesiona por lograr el mayor reto posible en el mundo científico: dar vida a un cuerpo muerto.", bookLanguage: "español", bookImage: "frankenstein")
        let laVidaDeLasAbejas = Libro(bookTitle: "la vida de las abejas ", bookPrice: 100, bookPages: 140, bookFormat: "pasta blanda", bookDescription: "ciclo de vida y crianza de las abejas", bookLanguage: "español", bookImage: "abejas")
        let pedroParamo = Libro(bookTitle: "Pedro Paramo Y el LLano En LLamas", bookPrice: 200, bookPages: 255, bookFormat: "pasta dura", bookDescription: "El clima que presentan los cuentos es, en cierto modo, una anticipación de lo que luego sería la primera novela de Rulfo, Pedro Páramo. Aunque se trata de historias diferentes, tienen en común la memoria del pasado y los estragos de la Revolución mexicana, que tanto marcó la vida y obra de Rulfo. ", bookLanguage: "español", bookImage: "llano en llamas ")
        let principito  = Libro(bookTitle: "el principito", bookPrice:  100, bookPages: 91, bookFormat: "pasta blanda", bookDescription: "El principito es una narración corta del escritor francés Antoine de Saint-Exupéry, que trata de la historia de un pequeño príncipe que parte de su asteroide a una travesía por el universo, en la cual descubre la extraña forma en que los adultos ven la vida y comprende el valor del amor y la amistad.", bookLanguage: "español", bookImage: "principito")
        let elCuervo = Libro(bookTitle: "El Cuervo", bookPrice: 100, bookPages: 91, bookFormat: "pasta blanda", bookDescription: "", bookLanguage: "El texto narra la misteriosa visita de un cuervo parlante a la casa de un amante afligido, y del lento descenso hacia la locura de este último. El amante, que a menudo se ha identificado como un estudiante,​​ llora la pérdida de su amada, Leonora.", bookImage: "el cuervo")
        let elHombreMediocre = Libro(bookTitle: "El Hombre Mediocre", bookPrice: 200, bookPages: 222, bookFormat: "pasta blanda", bookDescription: "La obra trata sobre la naturaleza del hombre, oponiendo dos tipos de personalidades: la del hombre mediocre y la del idealista, analizando las características morales de cada uno, y las formas y papeles que estos tipos de hombres han adoptado en la historia, la sociedad y la cultura.", bookLanguage: "español", bookImage: "hombre mediocre")
        let agujerosNegrosYPequeñosUniversos = Libro(bookTitle: "Agujeros Negros Y Pequeños Universos", bookPrice: 500, bookPages: 217, bookFormat: "ebook", bookDescription: "Agujeros negros y pequeños universos y otros ensayos (Black Holes and Baby Universes and Other Essays título original en inglés) es el libro de Stephen Hawking de 1994 en el que trata sobre algunos aspectos cosmológicos acerca del Universo y que plantea preguntas sobre el mismo.", bookLanguage: "español", bookImage: "agujero negro")
        let popolVuh = Libro(bookTitle: "Popol Vuh", bookPrice: 100, bookPages: 140, bookFormat: "pasta blanda", bookDescription: "las antiguas historias de quiche", bookLanguage: "español", bookImage: "popol vuh")
        
        //MARK: -CATEGORIAS
        let Cuentos = Category(categoryName: "Cuentos")
        let Novela = Category(categoryName: "Novela")
        let Historia = Category(categoryName: "Historia")
        let Cientifico = Category(categoryName: "Cientifico")
        let Fantasia = Category(categoryName: "Fantasia")
        let Espiritualidad = Category(categoryName: "Espiritualidad")
        let Filosofia = Category(categoryName: "Filosofia")
        let Poesia = Category(categoryName: "Poesia")
        let Suspenso = Category(categoryName: "Suspenso")
        
        
        //MARK: - AUTORES
        let tolkien = Author(authorName: "J.R.R Tolkien", authorBooks: [elSeñorDeLosAnillos], authorCategory: [Cuentos, Novela])
        let federicoNavarrete = Author(authorName: "Federico Navarrete", authorBooks: [historiasMexicas], authorCategory: [Historia, Novela])
        let charlesDarwin = Author(authorName: "Charles Darwin", authorBooks: [elOrigenDeLasEspecies], authorCategory: [Cientifico])
        let michaelNewton = Author(authorName: "Michael Newton", authorBooks: [vidaEntreVidas], authorCategory: [Espiritualidad])
        let osho = Author(authorName: "osho", authorBooks: [elFiloDeLaNavaja], authorCategory: [Espiritualidad])
        let dianaWynneJones = Author(authorName: "Diana Wynne Jones", authorBooks: [elCastilloAmbulante], authorCategory: [Fantasia,Cuentos])
        let friedrichNietzsche = Author(authorName: "Friedrich Nietzsche", authorBooks: [elOrigenDeLaTragedia], authorCategory: [Filosofia])
        let julioVerne = Author(authorName: "Julio Verne", authorBooks: [viajeAlCentroDeLaTierra, laGuerraDeLosMundos], authorCategory: [Fantasia, Cuentos])
        let jaimeSabines = Author(authorName: "Jaime Sabines", authorBooks: [recuentoDePoemas], authorCategory: [Poesia])
        let varios  = Author(authorName: "Varios", authorBooks: [mexicoATravezDeSusLeyendas], authorCategory: [Cuentos,Fantasia])
        let miguelDeCervantes = Author(authorName: "Miguel de Cervantes", authorBooks: [quijote], authorCategory: [Novela])
        let lewisCarrol = Author(authorName: "Lewis Carrol", authorBooks: [aliciaAtravesDelEspejo], authorCategory: [Cuentos,Novela])
        let marySelley = Author(authorName: "Mary W. Sheley", authorBooks: [frankenstein], authorCategory: [Cuentos, Novela])
        let mauricioMaeterlink = Author(authorName: "Mauricio Maeterlink", authorBooks: [laVidaDeLasAbejas], authorCategory: [Cientifico])
        let juanRulfo = Author(authorName: "Juan Rulfo", authorBooks: [pedroParamo], authorCategory: [Novela, Cuentos])
        let antoineDeSaintExupery = Author(authorName: "Antoine De Saint Exupery", authorBooks: [principito], authorCategory: [Novela, Cuentos])
        let edgarAlanPoe = Author(authorName: "Edgar Alan Poe", authorBooks: [elCuervo], authorCategory: [Suspenso,Novela,Cuentos])
        let joseIngenieros = Author(authorName: "Jose Ingenieros", authorBooks: [elHombreMediocre], authorCategory: [Filosofia])
        let stephenHawking = Author(authorName: "Stephen Hawking", authorBooks: [agujerosNegrosYPequeñosUniversos], authorCategory: [Cientifico,Novela])
        let franciscoXimenez = Author(authorName: "Francisco Ximenez", authorBooks: [popolVuh], authorCategory: [Historia])
        
        // MARK: _ BOOKOBJECT
        let books = bookObject(authorName: [tolkien,federicoNavarrete,charlesDarwin,michaelNewton,osho,dianaWynneJones,friedrichNietzsche,julioVerne,jaimeSabines,miguelDeCervantes,varios,lewisCarrol,marySelley,mauricioMaeterlink,juanRulfo,antoineDeSaintExupery,edgarAlanPoe,joseIngenieros,stephenHawking,franciscoXimenez], categoryName: [Cuentos,Novela,Historia,Cientifico,Fantasia,Espiritualidad,Filosofia,Poesia,Suspenso])
        
        dataSource = books
        
       
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
