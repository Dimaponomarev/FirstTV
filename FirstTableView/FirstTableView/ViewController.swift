//
//  ViewController.swift
//  FirstTableView
//
//  Created by Дмитрий Пономарев on 06.09.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    //   MARK: - Properties
    
    let tableView = UITableView()
    var exampleOfCell: [DataForCell] = [
        DataForCell(mainTitle: "Dima Pon", subTitle: "it's me", image: "di.jpg"),
        DataForCell(mainTitle: "Sasha Dzh", subTitle: "my mentor and friend who supports me", image: "sas.jpg"),
        DataForCell(mainTitle: "Bob Sik", subTitle: "some bullshit man, who is the product of my mind, but i made it forsome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit llshit man, who is the product of my mind, but i made it forsome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit mllshit man, who is the product of my mind, but i made it forsome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit mllshit man, who is the product of my mind, but i made it forsome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit mllshit man, who is the product of my mind, but i made it forsome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit mllshit man, who is the product of my mind, but i made it forsome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit mllshit man, who is the product of my mind, but i made it forsome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit mllshit man, who is the product of my mind, but i made it forsome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit man, who is the product osome bullshit mman, who is the product o example", image: "bob.jpg")]
    
    
    //    MARK: - LifeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }
    
    
    //  MARK: - makeTableView
    
    func addViews() {
        view.addSubview(tableView)
        setupView()
        makeConstraints()
    }
    
    //  MARK: - makeConstraint
    
    func makeConstraints() {
        tableView.snp.makeConstraints {
            $0 .edges.equalToSuperview()
        }
    }
    
    //    MARK: - setupViews
    
    func setupView() {
        tableView.backgroundColor = .brown
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellForFirstViewControllerTableViewCell.self, forCellReuseIdentifier: cellForFirstViewControllerTableViewCell.identifier)
    }
    
}

//  MARK: - Extension DataSource


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleOfCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellForFirstViewControllerTableViewCell.identifier, for: indexPath) as? cellForFirstViewControllerTableViewCell  else {
            return UITableViewCell() }
        let cellWithModel = exampleOfCell [indexPath.row]
        cell.configureView (cellWithModel)
        return cell
    }
}

//  MARK: - extensionDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
        
        
        
        
        let example = exampleOfCell[indexPath.row]
        var SecondVC: UIViewController = SecondViewController(items: example)
        switch (indexPath.row + 1) {
        case 0:
            SecondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        default:
            print("default")
        }
        self.navigationController?.pushViewController (SecondVC, animated: true)
        
    }
    
    
    
}
