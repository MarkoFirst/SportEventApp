//
//  EventTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 06.09.2023.
//

import UIKit

class EventTableViewCell: UIViewController {
    
    
    @IBOutlet weak var sportEvent: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        sportEvent.dataSource = self
        sportEvent.delegate = self
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        sportEvent.dataSource = self
//        sportEvent.delegate = self
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}

extension EventTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        sportEvent.dequeueReusableCell(withIdentifier: "sportEvent", for: indexPath)
    }
}
