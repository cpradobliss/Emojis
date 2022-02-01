//
//  ViewController.swift
//  EmojisApp
//
//  Created by Charles Prado on 01/02/2022.
//

import UIKit

class EmojiListViewController: UIViewController {

    private var collectionView: UICollectionView!

    // the data used to fill the screen
    private var emojis: [Emoji] = []
    
    override func loadView() {
        let layout: UICollectionViewFlowLayout = .init()
        layout.sectionInset = .init(top: 20, left: 10, bottom: 10, right: 20)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sets the delegate and the ds
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // registers the cell
        collectionView.register(EmojiCell.self, forCellWithReuseIdentifier: "EmojiCell")
        
        // the request made to fetch all the emojis and reload the screen with that data
        EmojisService().fetchEmojis(completion: { emojis in
            self.emojis = emojis
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
}

// MARK: - CollectionView Delegate & Data Source
extension EmojiListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmojiCell", for: indexPath) as! EmojiCell
        
        let emoji = emojis[indexPath.row]
        
        let imageView = UIImageView()
        imageView.load(fromUrl: emoji.url)
        imageView.frame = cell.bounds
        
        cell.addSubview(imageView)
        
        return cell
    }
}

// MARK: - CollectionViewLayout
extension EmojiListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSize = UIScreen.main.bounds.width / 4
        
        return CGSize(width: itemSize, height: itemSize)
    }
}
