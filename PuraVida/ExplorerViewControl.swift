//
//  ExplorerViewControl.swift
//  PuraVida
//
//  Created by Jerry Ren on 5/10/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class ExplorerViewController: UIViewController {

    @IBOutlet weak var explorerTableV: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        explorerTableV.delegate = self
        explorerTableV.dataSource = self
    }
    
}

extension ExplorerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celloc = explorerTableV.dequeueReusableCell(withIdentifier: GlobalStatics.universalCelloIdentifier, for: indexPath) as! ExplorerTviCell
        
        explorerTableV.rowHeight = 233

        celloc.tvicImageView.image = UIImage(named: placesPhotographsArrayLeft[indexPath.row])
        celloc.tvicRabel.text = placesNamesArrayLeft[indexPath.row]
        celloc.tvicImageView.layer.cornerRadius = 12
        celloc.tvicImageView.clipsToBounds = true

        return celloc
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesPhotographsArrayLeft.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let primaryStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let targetVC = primaryStoryboard.instantiateViewController(withIdentifier: GlobalStatics.mappyStoryID) as? MappyViewController else {
            print("destination unclear bud")
            return
        }
        explorerTableV.deselectRow(at: indexPath, animated: true)
        navigationController?.crossDissolving(targetVC)
    }
     
}



