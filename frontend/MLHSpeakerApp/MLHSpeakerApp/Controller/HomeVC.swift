//
//  HomeVC.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/13/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

protocol getEventDelegate {
    func saveEvent()
}

class HomeVC: UIViewController {
    
    let tableView = UITableView()
    var eventList: [Event] = [Event(name: "Chocolate", date: "Tomrrow")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "Events"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        addRightBarButton()
    }
    
    
    private func addRightBarButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(eventButtonPressed))
    }
    
    
    private func configureTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EventCell.self, forCellReuseIdentifier: "EventCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    
        ])
    }
    
    
    @objc func eventButtonPressed(){
        navigationController?.pushViewController(NewEventVC(), animated: true)
    }
}

extension HomeVC: UITableViewDelegate {
    
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        cell.nameLabel.text = eventList[indexPath.row].name
        cell.dateLabel.text = eventList[indexPath.row].date
        return cell

    }
    
    
    
    
}
