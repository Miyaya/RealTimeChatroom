//
//  StorageManager.swift
//  RealTimeChatroom
//
//  Created by Miya Lee on 12/10/2021.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    
    static let shared = StorageManager()
    
    private let storage = Storage.storage().reference()
    
    /*
     /images/a8udej-gmail-com_profile_picture.jpg
     */
    
    // result is String either Error
    public typealias UploadPictureCompletion = (Result<String, Error>) -> Void
    
    /// Upload picture to firebase storage and return completion with url string to download
    public func uploadProfilePicture(with data: Data, fileName: String, completion: @escaping UploadPictureCompletion) {
        storage.child("imagess/\(fileName)").putData(data, metadata: nil, completion: {
            metadata, error in
            guard error == nil else {
                print("failed to upload data to firebase for pictures")
                completion(.failure(StorageErrors.failedToUpload))
                return
            }
            
            let reference = self.storage.child("imagess/\(fileName)").downloadURL(completion: { url, error in
                guard let url = url else {
                    print("")
                    completion(.failure(StorageErrors.failedToGetDownloadUrl))
                    return
                }
                
                let urlString = url.absoluteString
                print("download url returned: \(urlString)")
                completion(.success(urlString))
            })
        })
    }
    
    public enum StorageErrors : Error {
        case failedToUpload
        case failedToGetDownloadUrl
    }
}
