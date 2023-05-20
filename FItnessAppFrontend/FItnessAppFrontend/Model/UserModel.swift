import Foundation

struct APIResponse: Codable {
    let status: Int
    let data: [User]
}

struct User: Codable {
    let id: String
    let name: String
    let age: Int
    let gender: String
    let weight: Double
    let height: Double
    let bmi: Double
    let goal: String
    let m_id: String
    let username:String
    let password:String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case age
        case gender
        case weight
        case height
        case bmi
        case goal
        case m_id = "m_id"
        case username
        case password
    }
}


