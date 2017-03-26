//
//  ComplexHeaderViewController.swift
//  SWTableViewHeader
//
//  Created by Don Mini on 3/25/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ComplexHeaderViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

	@IBOutlet weak var theWelcomeLabel: UILabel!
	
	@IBOutlet weak var detailA: UILabel!
	@IBOutlet weak var detailB: UILabel!
	@IBOutlet weak var detailC: UILabel!
	
	@IBOutlet weak var colViewTimes: UICollectionView!
	@IBOutlet weak var colViewPeople: UICollectionView!
	
	
	var timesArray: [String]?
	var peopleArray: [String]?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	

	func setTimes(times:[String], andPeople:[String]) -> Void {
		timesArray = times
		peopleArray = andPeople
	}

	// MARK: UICollectionViewDataSource
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		// just one section in each collectionView
		return 1
	}
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if collectionView == colViewTimes {
			if let n = timesArray?.count {
				return n
			}
			return 0
		}
		if let n = peopleArray?.count {
			return n
		}
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "aCell", for: indexPath)
		
		if collectionView == colViewTimes {
			
			let theLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
			theLabel.textAlignment = .center
			theLabel.backgroundColor = UIColor.white
			
			theLabel.text = timesArray?[indexPath.row]
			
			cell.addSubview(theLabel)
			
		} else {
			
			let theLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
			theLabel.textAlignment = .center
			theLabel.backgroundColor = UIColor.yellow
			
			theLabel.text = peopleArray?[indexPath.row]
			
			cell.addSubview(theLabel)
			
		}

		return cell
		
	}
	
}
