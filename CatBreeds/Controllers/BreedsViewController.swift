//
//  FirstViewController.swift
//  CatBreeds
//
//  Created by Olga on 15.05.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import UIKit

class BreedsViewController: UITableViewController {
    
    @IBOutlet var tableBreetView: UITableView!
    
    private let url = URL(string: "https://api.thecatapi.com/v1/breeds?api_key=51c52522-9f54-4dfc-bf99-0dc082a3143b")
    
    var catBreeds = [Breed]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cat Breeds"
    }
    
    func downloadJSON() {
        guard url != nil else { return }
        URLSession.shared.dataTask(with: url!) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Something is wrong!")
                return
            }
            print("Downloaded")
            do {
                let decoder = JSONDecoder()
                let dowloadedBreeds = try decoder.decode([Breed].self, from: data)
                self.catBreeds = dowloadedBreeds
                DispatchQueue.main.async {
                    self.tableBreetView.reloadData()
                }
            } catch {
                print("Something went wront after downloading! :(")
            }
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catBreeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BreedCell") as? BreedTableCell else { return UITableViewCell() }
        cell.breedNameLabel.text = catBreeds[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BreedDatailsController {
            destination.breed = catBreeds[tableBreetView.indexPathForSelectedRow!.row]
        }
    }
}
