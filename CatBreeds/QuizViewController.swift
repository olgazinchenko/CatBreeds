//
//  SecondViewController.swift
//  CatBreeds
//
//  Created by Olga on 15.05.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(url: URL) {
        DispatchQueue.global().async { [self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}

class QuizViewController: UIViewController {
    
    @IBOutlet weak var quizCatImage: UIImageView!
    @IBOutlet weak var breedNameLabel: UILabel!
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBOutlet weak var nextCatButton: UIButton!
    
    
    @IBAction func showAnswerAction(_ sender: UIButton) {
        showAnswer()
        if breedIDs.count < breeds.count {
            for breed in breeds {
                breedIDs.append(breed.id)
            }
        }
        print(breedIDs)
        
    }
    
    @IBAction func nextCatAction(_ sender: UIButton) {
        nextQuizItem()
        updateQuiz()
        downloadQuizDataFromJSON()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadQuizDataFromJSON()
        downloadBreeds()
        updateQuiz()
    }
    
    var breeds = [Breed]()
    
    func downloadBreeds() {
        let urlStirng = "https://api.thecatapi.com/v1/breeds?api_key=51c52522-9f54-4dfc-bf99-0dc082a3143b"
        let url = URL(string: urlStirng)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data, response != nil, error == nil else {
                print("Something is wrong!")
                return
            }
            print("Downloaded: breed list")
            do {
                let decoder = JSONDecoder()
                let downloadedBreeds = try decoder.decode([Breed].self, from: data)
                self.breeds = downloadedBreeds
            } catch {
                print("Something went wront after downloading! :(")
            }
        }.resume()
    }
    
    var breedIDs: [String] = ["abys"]
    var currentbreedIDsArrayIndex: Int = 0
    var quizData = [Quiz]()
    
    func downloadQuizDataFromJSON() {
        
        let urlString: String = "https://api.thecatapi.com/v1/images/search?breed_id=\(breedIDs[currentbreedIDsArrayIndex])"
        let url = URL(string: urlString)
        
        guard url != nil else { return }
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data, error == nil, response != nil else {
                print("Something went wrong during downloading!")
                return
            }
            print("Downloaded: search by breed id")
            do {
                let decoder = JSONDecoder()
                let downloadedBreedData = try decoder.decode([Quiz].self, from: data)
                self.quizData = downloadedBreedData
                let url = URL(string: self.quizData[0].url)
                DispatchQueue.main.async {
                    self.quizCatImage.loadImage(url: url!)
                }
            } catch {
                print("Something went wrong after downloading!")
            }
        }.resume()
    }
    
    func updateQuiz() {
        breedNameLabel.text = "⁉️"
        nextCatButton.isHidden = true
        showAnswerButton.isHidden = false
    }
    
    func nextQuizItem() {
        if currentbreedIDsArrayIndex < breedIDs.count {
            currentbreedIDsArrayIndex += 1
            
        } else {
            currentbreedIDsArrayIndex = 0
        }
    }
    
    func showAnswer() {
        breedNameLabel.text = quizData[0].breeds[0].name
        nextCatButton.isHidden = false
        showAnswerButton.isHidden = true
    }
    
}
