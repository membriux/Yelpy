//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage
import Lottie
import SkeletonView

class RestaurantsViewController: UIViewController {
        
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    var restaurantsArray: [Restaurant] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    var filteredRestaurants: [Restaurant] = []
    
    // –––––  Lab 4: create an animation view
    var animationView: AnimationView?
    var refresh = true
    

    // ––––– Lab 4 TODO: Start animations
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // TODO: Start animations
        startAnimations()
        
        // Table View
        tableView.visibleCells.forEach { $0.showSkeleton() }
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        // Search Bar delegate
        searchBar.delegate = self
    
    
        // Get Data from API
        getAPIData()
        
    }
    
    
    // ––––– Lab 4 TODO: Call animation functions to stop
    func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            print("reload")
            
            self.restaurantsArray = restaurants
            self.filteredRestaurants = restaurants
            self.tableView.reloadData()
            
            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.stopAnimations), userInfo: nil, repeats: false)
            
        }
    }
    
    

}

// ––––– Lab 4 TODO: Add SkeletonTableViewDataSource + protocol stubs
extension RestaurantsViewController: SkeletonTableViewDataSource {
    
    // –––– Lab 4 TODO: Complete startAnimations Function
    func startAnimations() {
        // Start Skeleton
        view.isSkeletonable = true
        
        animationView = .init(name: "4762-food-carousel")
        // Set the size to the frame
        animationView!.frame = view.bounds
        // fit the
        animationView!.contentMode = .scaleAspectFit
        view.addSubview(animationView!)
        
        // 4. Set animation loop mode
        animationView!.loopMode = .loop

        // Animation speed - Larger number = faste
        animationView!.animationSpeed = 5

        //  Play animation
        animationView!.play()
        
    }
    
    // ––––– Lab 4 TODO: Complete stopAnimations function
    @objc func stopAnimations() {
        // ----- Stop Animation
        animationView?.stop()
        // ------ Change the subview to last and remove the current subview
        view.subviews.last?.removeFromSuperview()
        view.hideSkeleton()
        refresh = false
    }
    
    // ––––– Lab 4 TODO: Add collectionSkeletonView protocol stub
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "RestaurantCell"
    }
    
}

// ––––– TableView Functionality –––––
extension RestaurantsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRestaurants.count
    }
    
    // ––––– TODO: Configure cell to use [Movie] array instead of [[String:Any]] and Filtered Array
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create Restaurant Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        // Set cell's restaurant
        cell.r = filteredRestaurants[indexPath.row]
        
        if self.refresh {
            cell.showAnimatedSkeleton()
            
        } else {
            cell.hideSkeleton()
        }
        
        return cell
    }
    
    // ––––– TODO: Send restaurant object to DetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
            let r = filteredRestaurants[indexPath.row]
            let detailViewController = segue.destination as! RestaurantDetailViewController
            detailViewController.r = r
        }
        
    }
    
}


// ––––– TODO: Add protocol + Functionality for Searching
// UISearchResultsUpdating informs the class of text changes
// happening in the UISearchBar
extension RestaurantsViewController: UISearchBarDelegate {
    
    // Search bar functionality
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filteredRestaurants = restaurantsArray.filter { (r: Restaurant) -> Bool in
              return r.name.lowercased().contains(searchText.lowercased())
            }
        }
        else {
            filteredRestaurants = restaurantsArray
        }
        tableView.reloadData()
    }

    
    // Show Cancel button when typing
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
       self.searchBar.showsCancelButton = true
    }
       
    // Logic for searchBar cancel button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       searchBar.showsCancelButton = false // remove cancel button
       searchBar.text = "" // reset search text
       searchBar.resignFirstResponder() // remove keyboard
       filteredRestaurants = restaurantsArray // reset results to display
       tableView.reloadData()
    }
    
    
    
}





