//
//  FirebaseAPIHelper.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/5/22.
//

import FirebaseFirestore
import Foundation

typealias Parameters = [String: Any]

class FirebaseAPIHelper {
    private let database = Firestore.firestore()
    
    func addData(path: String,
                 data: [String: Any],
                 onSuccess: @escaping VoidResult,
                 onError: @escaping ErrorResult) {
        database.collection(path).addDocument(data: data,
                                              completion: { error in
            if let error = error {
                onError(error)
                return
            }
            
            onSuccess()
        })
    }
    
    func getData(path: String,
                 onSuccess: @escaping SingleResult<QuerySnapshot>,
                 onError: @escaping ErrorResult) {
        database.collection(path).getDocuments(completion: { dataSnapshot, error in
            if let error = error {
                onError(error)
                return
            }
            
            guard let dataSnapshot = dataSnapshot else { return }
            
            onSuccess(dataSnapshot)
        })
    }
    
    func deleteData(collection: String,
                    path: String,
                    onSuccess: @escaping VoidResult,
                    onError: @escaping ErrorResult) {
        database.collection(collection).document(path).delete(completion: { error in
            if let error = error {
                onError(error)
                return
            }
            
            onSuccess()
        })
    }
    
    
}
