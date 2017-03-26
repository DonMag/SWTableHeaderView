//
//  AddHeaderTableViewController.swift
//  SWTableViewHeader
//
//  Created by Don Mini on 3/25/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class AddHeaderTableViewController: UITableViewController {

	var theHeaderViewVC: ComplexHeaderViewController?
	
	@IBOutlet weak var hview: UIView!
	
	@IBOutlet weak var theHeaderContainer: UIView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		// Instantiate View Controller
		theHeaderViewVC = storyboard.instantiateViewController(withIdentifier: "ComplexHeaderView") as? ComplexHeaderViewController
		
		if let vc = theHeaderViewVC {
			
			// Add View Controller as Child View Controller
			self.addChildViewController(vc)
			
			if let v = vc.view {
			
				hview.addSubview(v)
				
				// Configure Child View
				v.frame = hview.bounds
				v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
				
				// examples of setting exposed properties in ComplexHeaderVC
				vc.theWelcomeLabel.text = "Good Morning"
				vc.detailA.text = "Your day looks busy, but you do have 2 hrs of free time at 2:00 PM"
				vc.detailB.text = "Hosting 3 Meetings"
				vc.detailC.text = "Meeting 4 VIPs"
				
				// example of calling exposed function in ComplexHeaderVC
				let a1 = ["9:45 AM", "10:30 AM", "11:30 AM", "12:00 PM", "1:00 PM", "1:30 PM", "2:30 PM", "3:00 PM", "4:30 PM", "5:00 PM", "6:30 PM", "7:30 PM", "8:00 PM"]
				let a2 = ["Bob", "Susan", "James", "Cindy", "Tracy", "David", "Edward", "Karen", "Pam"]
				
				vc.setTimes(times: a1, andPeople: a2)
				
			}
			
			// Notify Child View Controller
			vc.didMove(toParentViewController: self)
			
		}
		
		sizeHeaderToFit()
	}
 
	func sizeHeaderToFit() {
		let headerView = tableView.tableHeaderView!
		
		headerView.setNeedsLayout()
		headerView.layoutIfNeeded()
		
		let height = tableView.frame.width
		
		var frame = headerView.frame
		frame.size.height = height
		headerView.frame = frame
		
		tableView.tableHeaderView = headerView
		
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "aTableCell", for: indexPath)

        // Configure the cell...
		cell.textLabel?.text = "This is row: \(indexPath.row)"

        return cell
    }

}
