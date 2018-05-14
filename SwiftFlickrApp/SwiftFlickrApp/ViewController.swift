//
//  ViewController.swift
//  SwiftFlickrApp
//
//  Created by synboo on 6/5/14.
//  Copyright (c) 2014 synboo. All rights reserved.
//

import UIKit

enum LayoutType: Int
{
    case grid = 0
    case list = 1
}

class ViewController: UICollectionViewController
{
    var photos:[Dictionary<String, String>] = []
    var layoutType = LayoutType.grid
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        getFlickrPhotos()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func getFlickrPhotos()
    {
        let manager :AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        let url :String = "https://api.flickr.com/services/rest/"
        let parameters :Dictionary = [
            "method"         : "flickr.interestingness.getList",
            "api_key"        : "86997f23273f5a518b027e2c8c019b0f",
            "per_page"       : "99",
            "format"         : "json",
            "nojsoncallback" : "1",
            "extras"         : "url_q,url_z",
        ]
        let requestSuccess = {
            (operation :AFHTTPRequestOperation!, responseObject :AnyObject!) -> Void in
            SVProgressHUD.dismiss()
            self.photos = responseObject.objectForKey("photos").objectForKey("photo") as Array
            self.collectionView.reloadData()
            NSLog("requestSuccess \(responseObject)")
        }
        let requestFailure = {
            (operation :AFHTTPRequestOperation!, error :NSError!) -> Void in
            SVProgressHUD.dismiss()
            NSLog("requestFailure: \(error)")
        }
        SVProgressHUD.show()
        manager.GET(url, parameters: parameters, success: requestSuccess, failure: requestFailure)
    }
    
    // MARK: - UICollectionView
    
    override func collectionView(_ collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int
    {
        return self.photos.count;
    }
    
    override func collectionView(_ collectionView: UICollectionView!, cellForItemAt indexPath: IndexPath!) -> UICollectionViewCell
    {
        let photoCell: PhotoCell = self.collectionView!.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let photoInfo = photos[indexPath.item] as Dictionary
        let photoUrlString = (self.layoutType == LayoutType.grid) ? photoInfo["url_q"] : photoInfo["url_z"]
        let photoUrlRequest : URLRequest = URLRequest(url: URL.URLWithString(photoUrlString))
        
        let imageRequestSuccess = {
            (request : URLRequest!, response : HTTPURLResponse!, image : UIImage!) -> Void in
            photoCell.photoImageView.image = image;
            photoCell.photoImageView.alpha = 0
            UIView.animate(withDuration: 0.2, animations: {
                    photoCell.photoImageView.alpha = 1.0
            })
        }
        let imageRequestFailure = {
            (request : URLRequest!, response : HTTPURLResponse!, error : NSError!) -> Void in
            NSLog("imageRequrestFailure")
        }
        photoCell.photoImageView.setImageWithURLRequest(photoUrlRequest, placeholderImage: nil, success: imageRequestSuccess, failure: imageRequestFailure)

        photoCell.photoInfo = photoInfo
        return photoCell;
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: IndexPath!) -> CGSize
    {
        var itemSize : CGSize
        if self.layoutType == LayoutType.grid
        {
            itemSize = (indexPath.item%3 == 1) ? CGSize(width: 106, height: 106) : CGSize(width: 107, height: 106)
        }
        else
        {
            itemSize = CGSize(width: 320, height: 150)
        }
        return itemSize
    }
    
    @IBAction func segmentedControlDidChanged(_ control : UISegmentedControl)
    {
        switch control.selectedSegmentIndex {
        case 0:
            self.layoutType = LayoutType.grid
        case 1:
            self.layoutType = LayoutType.list
        default:
            self.layoutType = LayoutType.grid
        }
        
        self.collectionView?.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue!, sender: Any!)
    {
        if segue.identifier == "ShowPhoto"
        {
            let photoCell : PhotoCell = sender as! PhotoCell
            let photoViewController = segue.destination as! PhotoViewController
            photoViewController.photoInfo = photoCell.photoInfo
        }
    }
}

