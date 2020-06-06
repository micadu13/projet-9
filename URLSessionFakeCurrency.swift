//
//  URLSessionFakeCurrency.swift
//  Projet 9Tests
//
//  Created by Michael Aidan on 06/06/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import Foundation

class URLSessionFakeCurrency: URLSession {
    
       var data: Data?
       var response: URLResponse?
       var error: Error?
    
    init(data:Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
        
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task =  URLSessionDataTaskFakeCurrency()
        task.data = data
        task.urlResponse = response
        task.responseError = error
        task.completionHandler = completionHandler
        return task
    }
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSessionDataTaskFakeCurrency()
        task.completionHandler = completionHandler
        task.data = data
        task.urlResponse = response
        task.responseError = error
        return task
    }
}

class URLSessionDataTaskFakeCurrency: URLSessionDataTask{
    
    var completionHandler: ((Data?, URLResponse?, Error?)-> Void)?
    
    var data: Data?
    var urlResponse: URLResponse?
    var responseError: Error?
    
    
    override func resume() {
        completionHandler?(data, urlResponse, responseError)
    }
    
    override func cancel() {}
}
