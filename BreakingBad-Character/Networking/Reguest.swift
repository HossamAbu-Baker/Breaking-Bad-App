
import Foundation

class Reguest {
    
    func CallAPI<T : Codable>(url:String,method:String,parametar:[String:Any]?,header:[String:String]?,
                              response:T.Type, complition:@escaping(Result<T?,NSError>)->Void){
        
        
        guard let uRL = URL(string: url)else{return}
        let urlReguest = URLRequest(url: uRL)
        
        URLSession.shared.dataTask(with: urlReguest) { data, respnse, error in
            
            guard error == nil else{return}
            
            guard let data = data else {
                let error =  NSError.init(domain: url, code: 0, userInfo: [NSLocalizedDescriptionKey:"error"])
                complition(.failure(error))
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    complition(.success(jsonData))
                }
            }catch{
                print(error)
            }
        }
        .resume()
        
        
    }
}




