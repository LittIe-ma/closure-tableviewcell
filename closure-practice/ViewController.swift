//
//  ViewController.swift
//  closure-practice
//
//  Created by yasudamasato on 2021/12/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var numbers = [0, 0, 0]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.identifier)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numbers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell
        else { return TableViewCell() }
        cell.configure(number: numbers[indexPath.row]) { [weak self] number in
            self?.numbers[indexPath.row] = number + 1
            self?.tableView.reloadRows(at: [indexPath], with: .none)
        }
        return cell
    }
}
