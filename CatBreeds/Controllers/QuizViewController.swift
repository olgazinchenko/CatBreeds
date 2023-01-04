//
//  SecondViewController.swift
//  CatBreeds
//
//  Created by Olga on 15.05.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import UIKit

//extension UIImageView {
//    func loadImage(url: URL) {
//        DispatchQueue.global().async { [self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self.image = image
//                    }
//                }
//            }
//        }
//    }
//}

class QuizViewController: UIViewController {
    
    var quizView: QuizView {
        return view as! QuizView
    }
    
    override func loadView() {
        view = QuizView(frame: UIScreen.main.bounds)
    }
    
    
//    @IBOutlet weak var startQuizButton: UIButton!
//    @IBOutlet weak var quizCatImage: UIImageView!
//    @IBOutlet weak var breedNameLabel: UILabel!
//    @IBOutlet weak var showAnswerButton: UIButton!
//    @IBOutlet weak var nextCatButton: UIButton!
//
//    @IBAction func startQuizAction(_ sender: UIButton) {
//        updateQuiz()
//        saveBreedIDsInArray()
//        downloadQuizDataFromJSON()
//    }
//
//    @IBAction func showAnswerAction(_ sender: UIButton) {
//        showAnswer()
//    }
//
//    @IBAction func nextCatAction(_ sender: UIButton) {
//        nextQuizItem()
//        updateQuiz()
//        downloadQuizDataFromJSON()
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        startQuiz()
//        downloadBreeds()
//    }
//
//    var breeds = [Breed]()
//
//    func downloadBreeds() {
//        let urlStirng = "https://api.thecatapi.com/v1/breeds?api_key=51c52522-9f54-4dfc-bf99-0dc082a3143b"
//        let url = URL(string: urlStirng)
//
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            guard let data = data, response != nil, error == nil else {
//                print("Something is wrong!")
//                return
//            }
//            print("Downloaded: breed list")
//            do {
//                let decoder = JSONDecoder()
//                let downloadedBreeds = try decoder.decode([Breed].self, from: data)
//                self.breeds = downloadedBreeds
//            } catch {
//                print("Something went wront after downloading! :(")
//            }
//        }.resume()
//    }
//
//    var breedIDs: [String] = []
//    var currentbreedIDsArrayIndex: Int = 0
//
//    func saveBreedIDsInArray() {
//        if breedIDs.count < breeds.count {
//            for breed in breeds {
//                breedIDs.append(breed.id)
//            }
//        }
//        print(breedIDs)
//    }
//
//    var quizData = [Quiz]()
//
//    func downloadQuizDataFromJSON() {
//        currentbreedIDsArrayIndex = Int.random(in: 0..<breedIDs.count)
//        let urlString: String = "https://api.thecatapi.com/v1/images/search?breed_id=\(breedIDs[currentbreedIDsArrayIndex])"
//        let url = URL(string: urlString)
//        guard url != nil else { return }
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            guard let data = data, error == nil, response != nil else {
//                print("Something went wrong during downloading!")
//                return
//            }
//            print("Downloaded: search by breed id")
//            do {
//                let decoder = JSONDecoder()
//                let downloadedBreedData = try decoder.decode([Quiz].self, from: data)
//                self.quizData = downloadedBreedData
//                let url = URL(string: self.quizData[0].url)
//                DispatchQueue.main.async {
//                    self.quizCatImage.loadImage(url: url!)
//                }
//            } catch {
//                print("Something went wrong after downloading!")
//            }
//        }.resume()
//    }
//
//    func startQuiz() {
//        quizCatImage.image = UIImage(named: "quiz_cat")
//        breedNameLabel.text = "⁉️"
//        startQuizButton.isHidden = false
//        showAnswerButton.isHidden = true
//        nextCatButton.isHidden = true
//    }
//
//    func updateQuiz() {
//        breedNameLabel.text = "⁉️"
//        startQuizButton.isHidden = true
//        nextCatButton.isHidden = true
//        showAnswerButton.isHidden = false
//        startQuizButton.isHidden = true
//    }
//
//    func nextQuizItem() {
//        currentbreedIDsArrayIndex = Int.random(in: 0..<breedIDs.count)
//    }
//
//    func showAnswer() {
//        breedNameLabel.text = quizData[0].breeds[0].name
//        nextCatButton.isHidden = false
//        showAnswerButton.isHidden = true
//        startQuizButton.isHidden = true
//    }
}
