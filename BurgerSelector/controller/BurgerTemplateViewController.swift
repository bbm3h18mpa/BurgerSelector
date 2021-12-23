//
//  GameInformationTableViewController.swift
//  BurgerSelector
//
//  Created by Florian Panten / BBS2H20A BBM3H18M on 21.12.21.
//

import UIKit

protocol DidSelectBurgerDelegate {
    func didSelectBurgerDelegate(_ burgerName: String)
}

class BurgerTemplateViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var delegate: DidSelectBurgerDelegate!
    
    let burger = burgerData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
    }
}

extension BurgerTemplateViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return burger.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate.didSelectBurgerDelegate(burgerData[indexPath.row].name)
        dismiss(animated: true, completion: nil)
    }
}

extension BurgerTemplateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "templateCell") as! BurgerTemplateTableViewCell
        cell.titleLabel.text = burger[indexPath.row].name
        cell.myImageView.image = UIImage(named: burger[indexPath.row].imageName)
        return cell
    }
}
