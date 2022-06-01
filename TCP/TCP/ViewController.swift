//
//  ViewController.swift
//  TCP
//
//  Created by Nabeel Nazir on 6/1/22.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet var imageViews: [UIImageView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image1 = URL(string: "https://images.unsplash.com/photo-1559116315-702b0b4774ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=983&q=80")!
        let image2 = URL(string: "https://images.unsplash.com/photo-1596265371388-43edbaadab94?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")!
        let image3 = URL(string: "https://images.unsplash.com/photo-1558000959-d20934cc98ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2352&q=80")!
        
        downloadImage(urls: [image1, image2, image3])
    }
    
    
    func downloadImage(urls: [URL]) {

        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = .max
        queue.qualityOfService = .userInitiated

        let operations = urls.map { url in
            BlockOperation(block: {
                
                DispatchQueue.main.async {
                    self.imageViews.first?.kf.setImage(
                        with: urls.first!,
                        options: [
                            .loadDiskFileSynchronously,
                            .cacheOriginalImage,
                            .transition(.fade(0.25)),
                        ],
                        progressBlock: { receivedSize, totalSize in
                            print("receivedSize: \(receivedSize)")
                            print("totalSize: \(totalSize)")
                        },
                        completionHandler: { [weak self] result in
                            
                        }
                    )
                }
                
            })
        }
        
        queue.addOperations(operations, waitUntilFinished: false)
    }
}

