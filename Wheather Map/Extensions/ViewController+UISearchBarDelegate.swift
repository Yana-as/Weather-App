//
//  ViewController+UISearchBarDelegate.swift
//  Wheather Map
//
//  Created by Yana on 13.08.2020.
//

import UIKit

extension ViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        
    }
    
    func  updateSearchResults ( for searchController: UISearchController) {
        
        if let searchCity = searchBar.text {
            
            networkWheatherManager.fetchCurrentWheather(forCity: searchCity)
        } else { return }
   }
}


