//
//  JustoViewModel.swift
//  Justo RM
//
//  Created by Ricardo Developer on 17/04/24.
//

import Foundation

class JustoViewModel: ObservableObject {
    
    @Published var contenteModel: JustoRM?
    @Published var error: Error?
    
    let apiClientVM = ApiClient()
    
    func getContent() {
        apiClientVM.getData{ Result in DispatchQueue.main.async {
            
            switch Result {
            case.success(let contents):
                self.contenteModel = contents
                print("results \(String(describing: self.contenteModel))")
            case .failure(let error):
                print("Error fetching post: \(error)")
            }
        }
            
        }
    }
    
}
