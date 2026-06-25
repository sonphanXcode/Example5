//
//  WelcomeRepository.swift
//  iOS
//
//  Created by sp7 on 22/6/26.
//

import Foundation
import Exp5_Network

protocol WelcomeRepository {
    
}

struct WelcomeRepositoryImpl: WelcomeRepository {
    func gettingResource(_ req: RequestObjectCreateItem) async -> [Resources]? {
        let req = RequestObject.createRequest(endpoint: WelcomeEndPoint.callPosts.rawValue, httpMethod: .POST, objectRequest: req)
        var data: [Resources]?
        do {
            data = try await NetworkServiceImpl().request(req, res: [Resources].self)
        } catch {
            print("===== \(error)")
        }
        return data
    }
    
    func creatingAResource(_ req: RequestObjectCreateItem) async -> Resources? {
        let request = RequestObject.createRequest(endpoint: WelcomeEndPoint.callPosts.rawValue, httpMethod: .POST, objectRequest: req)
        do {
            let data = try await NetworkServiceImpl().request(request, res: Resources.self)
            return data
        } catch {
            print("===== \(error)")
        }
        return nil
    }
}
