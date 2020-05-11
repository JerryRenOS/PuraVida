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
        
        celloc.actionDelegate = self
        explorerTableV.rowHeight = 233

        celloc.tvicImageView.image = UIImage(named: placesPhotographsArrayLeft[indexPath.row])
        celloc.tvicRabel.text = placesNamesArrayLeft[indexPath.row]
        celloc.tvicImageView.layer.cornerRadius = 13
        celloc.tvicImageView.clipsToBounds = true
        
        celloc.tvicButton.layer.cornerRadius = celloc.tvicButton.bounds.size.width/2
        celloc.tvicButton.layer.shadowColor = UIColor.black.cgColor
        celloc.tvicButton.layer.shadowOpacity = 0.77
        celloc.tvicButton.layer.shadowOffset = CGSize(width: 2, height: 0)

        return celloc
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesPhotographsArrayLeft.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        explorerTableV.deselectRow(at: indexPath, animated: true)
    }
}
 
extension ExplorerViewController: ButtonActionDelegate {
    func transitionToMappiness() {
        let primaryStoryboard = UIStoryboard(name: GlobalStatics.mainDotSB, bundle: Bundle.main)
        guard let targetVC = primaryStoryboard.instantiateViewController(withIdentifier: GlobalStatics.mappyStoryID) as? MappyViewController else {
            print("destination unclear bud")
            return
        }
           navigationController?.crossDissolving(targetVC)
    }
}                 



