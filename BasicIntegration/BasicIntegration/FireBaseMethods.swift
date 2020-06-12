//
//  KitchenGetter.swift
//  BasicIntegration
//
//  Created by Nicolas Lucchetta on 23/03/2020.
//  Copyright © 2020 Nicolas Lucchetta. All rights reserved.
//
import Foundation
import Firebase
import FirebaseFirestore

struct FireBaseMethods {
/* The getProducts function will complete with an array of Product object.  */
        func getProducts(completion: @escaping (Result<[Product], Error>) -> ()){
    /* Instanciate a variable for our fireBase Database */
            let fireStoreDB = Firestore.firestore()
    /* Instanciate temporary variables for the products attributes. */
            var productID : String = ""
            var name : String = ""
            var pictureURL : String = ""
            var price : String = ""
            var ingredients : [String] = []
            var kitchenID : String = ""
    /* Instanciate an array to fulfill and complete the function with. */
            var productsArray : [Product] = []
    /* Call the database for the collection "post" and check for the results in the completion */
            fireStoreDB.collection("products").addSnapshotListener { (snapshot, error) in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
    /* if a snapshot is found we are going to treat each of the documents founded */
                    if snapshot?.isEmpty != true && snapshot != nil {
    /* For each document found in the collection we set the temporary variable with the attribute we need from the document. */
                        for document in snapshot!.documents {
                            if let documentid = document.documentID as? String {
                                productID  = documentid
                            }
                            if let Name = document.get("name") as? String {
                                name = Name
                            }
                            if let Pictureurl = document.get("pictureURL") as? String {
                                pictureURL = Pictureurl
                            }
                            if let Price = document.get("price") as? String {
                                price = Price
                            }
                            if let Ingredients = document.get("ingredients") as? [String] {
                                ingredients = Ingredients
                            }
                            if let KitchenID = document.get("kitchenID") as? String {
                                kitchenID = KitchenID
                            }
    /* Once we have all of his elements, we create a new Product object and add it to the array. */
                            let productToAdd : Product = Product(productID: productID, name: name, pictureURL: pictureURL, price: price, ingredients: ingredients, kitchenID: kitchenID)
                            productsArray.append(productToAdd)
                        }
                        DispatchQueue.main.async {
    /* When all the document from the snapshot are treated we complete the function with the fulfilled array. */
                                completion(.success(productsArray))
                        }
                    }
                }
            }
        }
    
    func loadImage(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        let imageRef = Storage.storage().reference(forURL: url)
        imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("\(error)")
            }
            if let data = data {
                completion(.success(data))
            } else { return }
        }
    }
    
    func getKitchens(completion: @escaping (Result<[Kitchen], Error>) -> ()){
        let fireStoreDB = Firestore.firestore()
        var kitchenID = ""
        var name = ""
        var chefName = ""
        var gift = ""
        var type = ""
        var adress = ""
        var story = ""
        var specialities: [String] = []
        var kitchenPictureURL = ""
        var chefPictureURL = ""
        var picturesURL : [String] = []
        // - We prepare an array of Kitchen and its attribute
        var kitchensArray : [Kitchen] = []
        // - Call the database for the collection "kitchens" and check for the results in the completion
        fireStoreDB.collection("kitchens").addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                //if it find snapshot means it founds collection of document
                if snapshot?.isEmpty != true && snapshot != nil {
                    kitchensArray.removeAll(keepingCapacity: false)
                    //For each Data in the collection("post") retrieved we are going to extract each attribute that we need
                    for document in snapshot!.documents {
                        //i get each document id in the [result]
                        if let documentid = document.documentID as? String {
                            kitchenID = documentid
                        }
                        if let Name = document.get("name") as? String {
                            name = Name
                        }
                        if let ChefName = document.get("chefName") as? String {
                            chefName = ChefName
                        }
                        if let Gift = document.get("gift") as? String {
                            gift = Gift
                        }
                        if let Adress = document.get("adress") as? String {
                            adress = Adress
                        }
                        if let Type = document.get("type") as? String {
                            type = Type
                        }
                        if let PicturesURL = document.get("picturesURL") as? [String]  {
                            picturesURL = PicturesURL
                        }
                        if let KitchenPictureURL = document.get("kitchenPictureURL") as? String {
                            kitchenPictureURL = KitchenPictureURL
                        }
                        if let ChefPictureURL = document.get("chefPictureURL") as? String {
                            chefPictureURL = ChefPictureURL
                        }
                        if let Specialities = document.get("specialities") as? [String] {
                            specialities = Specialities
                        }
                        if let Story = document.get("story") as? String {
                            story = Story
                        }
                        //Once we have all of his elements, we create a new post Object
                        if let kitchenToAdd : Kitchen = Kitchen(kitchenID: kitchenID, name: name, chefName: chefName, gift: gift, type: type, adress: adress, story: story, specialities: specialities, kitchenPictureURL: kitchenPictureURL, chefPictureURL: chefPictureURL, picturesURL: picturesURL) {
                            kitchensArray.append(kitchenToAdd)
                        }
                    }
                    DispatchQueue.main.async {
                        completion(.success(kitchensArray))
                    }
                }
            }
        }
    }
}
