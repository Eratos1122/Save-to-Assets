
func saveImage(image: UIImage, completion: @escaping (_ success: Bool) -> ()) {

    if assetCollection == nil {
        return // If there was an error upstream, skip the save.
    }

    PHPhotoLibrary.shared().performChanges({ let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
        _ = assetChangeRequest.placeholderForCreatedAsset _ = PHAssetCollectionChangeRequest.init(for: self.assetCollection) }, completionHandler: { (success, error) in completion(success) })
}

func saveGif(data: Data, completion: @escaping (_ success: Bool) -> ()) {

    if assetCollection == nil {
        return // If there was an error upstream, skip the save.
    }
    
    PHPhotoLibrary.shared().performChanges({ PHAssetCreationRequest.forAsset().addResource(with: .photo, data: data, options: nil) }) { (success, error) in completion(success) }
}

func saveVideo(url: URL, completion: @escaping (_ success: Bool) -> ()) {

    if assetCollection == nil{
        return // If there was an error upstream, skip the save.
    }
    
    PHPhotoLibrary.shared().performChanges({ let assetChangeRequest = PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: url);
        _ = assetChangeRequest?.placeholderForCreatedAsset _ = PHAssetCollectionChangeRequest.init(for: self.assetCollection) }, completionHandler: { (success, error) in completion(success) })
    
}
