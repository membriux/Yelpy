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

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Initiliazers
    // ––––– TODO: change array to –> [Restaurant]
    var restaurantsArray: [Restaurant] = []
    
    // ––––– TODO: Add Search Bar Outlet + Variable for filtered Results
    @IBOutlet weak var searchBar: UISearchBar!
    var filteredRestaurants: [Restaurant] = []
    
    // creating an animation view
    private var animationView: AnimationView?
    
    // ––––– TODO: Add searchController configurations
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isSkeletonable = true
// --- Start Food Animation
        
        /// Load from a specific bundle/
        animationView = .init(name: "4762-food-carousel")
        // Set the size to the frame
        animationView!.frame = view.bounds
        //fit the
        animationView!.contentMode = .scaleAspectFit
        view.addSubview(animationView!)
       
        
        // 4. Set animation loop mode
        
        animationView!.loopMode = .loop
        
        // Animation speed - Larger number = faster
        
        animationView!.animationSpeed = 5
        
        //  Play animation
        
        animationView!.play()
 // Start Skeliton
        
        view.showAnimatedGradientSkeleton()
        
        
        // Table View
        tableView.delegate = self
        tableView.dataSource = self
        
        // Search Bar delegate
        searchBar.delegate = self
    
        
        // Get Data from API
        getAPIData()
        
    }
    
    
    // ––––– TODO: Update API results + restaurantsArray Variable + filteredRestaurants
    func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            print("reload")
            self.restaurantsArray = restaurants
            self.filteredRestaurants = restaurants
// ----- Stop Animation
            self.animationView?.stop()
// ------ Change the subview to last and remove the current subview
            self.view.subviews.last?.removeFromSuperview()
           
            self.view.hideSkeleton()
            
            self.tableView.reloadData()
            
        }
    }

}


// ––––– TODO: Pass restaurant to details view controller through segue
// ––––– TableView Functionality –––––
extension RestaurantsViewController: SkeletonTableViewDataSource {
    
   func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
       return "Cell"
   }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRestaurants.count
    }
    
    // ––––– TODO: Configure cell to use [Movie] array instead of [[String:Any]] and Filtered Array
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create Restaurant Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        // Set cell's restaurant
        cell.r = filteredRestaurants[indexPath.row]
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





