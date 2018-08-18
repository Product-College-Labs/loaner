//
//  ViewController.swift
//  loaner
//
//  Created by Erick Sanchez on 8/15/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func createNewItem() -> Item {
        return Item(itemTitle: "Untitled Item")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "show new item":
                guard let itemEditorVc = segue.destination as? ItemEditorViewController else {
                    return print("storyboard not set up correctly")
                }
                
                let newItem = createNewItem()
                itemEditorVc.item = newItem
            default: break
            }
        }
    }

    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "unwind from back":
            print("unwind from back")
        case "unwind from mark as returned":
            print("unwind from mark as returned")
        case "unwind from trash":
            print("unwind from trash")
        case "unwind from saving new item":
            guard let itemContactInfoVc = segue.source as? ItemContactInfoViewController else {
                return print("storyboard not set up correctly")
            }
            
            let newItem: Item = itemContactInfoVc.item
            print("unwind from saving new item: \(newItem)")
        default:
            break
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item cell", for: indexPath)
        
        return cell
    }
}

