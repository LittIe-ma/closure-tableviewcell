//
//  TableViewCell.swift
//  closure-practice
//
//  Created by yasudamasato on 2021/12/10.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!

    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }

    private var didChangeCountUpHandler: (Int) -> Void = { _ in }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func onPlusTapped(_ sender: Any) {
        didChangeCountUpHandler(Int(numberLabel.text!) ?? 0)
    }

    func configure(number: Int, didChangeCountUpValue: @escaping (Int) -> Void) {
        numberLabel.text = String(number)
        didChangeCountUpHandler = didChangeCountUpValue
    }

}
