//
//  ViewController.swift
//  BurgerSelector
//
//  Created by Florian Panten / BBS2H20A BBM3H18M on 21.12.21.
//

import UIKit

class ViewController: UIViewController, DidSelectBurgerDelegate {
    @IBOutlet weak var myTableView: UITableView!
    var bestellungen = [Bestellung]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self

        navigationItem.rightBarButtonItem = editButtonItem
        
        myTableView.rowHeight = 100
        
        myTableView.tableFooterView = UIView()
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(!isEditing, animated: true)
        myTableView.setEditing(!myTableView.isEditing, animated: true)
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let bttvc = storyboard?.instantiateViewController(identifier: "BurgerTamplateTable") as! BurgerTemplateViewController
        
        bttvc.delegate = self
        
        present(bttvc, animated: true, completion: nil)
    }
    
    
    func didSelectBurgerDelegate(_ burgerName: String) {
        let bestellung: Bestellung? = bestellungen.first(where: { (element: Bestellung) -> Bool in
            element.burger.name == burgerName
        })
        
        if (bestellung != nil) {
            bestellung?.anzahl += 1
        } else {
            let selectedBurger = burgerData.first(where: { (element: Burger) -> Bool in
                element.name == burgerName
            })!
            bestellungen.append(Bestellung(selectedBurger, 1))
        }
        
        self.myTableView.reloadData()
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        
        let selectedBestellung = bestellungen[sourceIndexPath.row]
        
     
        bestellungen.remove(at: sourceIndexPath.row)
        
        
        bestellungen.insert(selectedBestellung, at: destinationIndexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            bestellungen.remove(at: indexPath.row)
            
            
            myTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bestellungen.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "bestellungsCell") as! BestellungsTableViewCell
        
        let bestellung = bestellungen[indexPath.row]
        
        cell.titleLabel.text = bestellung.burger.name
        cell.myImageView.image = UIImage(named: bestellung.burger.imageName)
        cell.anzahlLabel.text = String(bestellung.anzahl) + " x"
        cell.priceLabel.text = String(format: "%.2f", bestellung.burger.price * Float(bestellung.anzahl)) + "€"
        return cell
    }
}
