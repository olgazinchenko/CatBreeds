//
//  FirstViewController.swift
//  CatBreeds
//
//  Created by Olga on 15.05.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import UIKit

class BreedsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var breedBrowseView: BreedBrowseView {
        return view as! BreedBrowseView
    }
    
    override func loadView() {
        UIApplication.shared.sta
        view = BreedBrowseView(frame: UIScreen.main.bounds)
        view.backgroundColor = Colors.black
        title = MainTabBarViewController.tabs[0]
        breedBrowseView.setupTable(dataSource: self, delegate: self)
    }
    
    var catBreeds = [Breed]()
    
    private let url = URL(string: "https://api.thecatapi.com/v1/breeds?api_key=51c52522-9f54-4dfc-bf99-0dc082a3143b")

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
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
                    self.breedBrowseView.breedTable.reloadData()
                }
            } catch {
                print("Something went wront after downloading! :(")
            }
        }.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catBreeds.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BreedTableCell") as? BreedTableCell else { return UITableViewCell() }
        cell.configure(name: catBreeds[indexPath.row].name, photo: (UIImage(named: "quiz_cat")!))
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "showDetails", sender: self)
//    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? BreedDatailsController {
//            destination.breed = catBreeds[breedBrowseView.breedTable.indexPathForSelectedRow!.row]
//        }
//    }
}
