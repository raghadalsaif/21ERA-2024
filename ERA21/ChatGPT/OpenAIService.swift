

import Foundation

import Alamofire

class OpenAIService {

    private let endpointURL = "https://api.openai.com/v1/chat/completions"
    //this func is to send a request to the API, and receive a response
    //               parametr : messages array is passed as an argument|->retun typy(JSON structure)
    func sendMessage (messages : [Message]) async -> OpeanAIChatResponse{
                            //Message array|
        //map convert array of Message objects >> array of OpeanAIChatMessage objects.
        let openAIMessages = messages.map({OpeanAIChatMessage(role: $0.role, content: $0.content)})
        //openAIMessages will be an array of OpeanAIChatMessage objects. Each OpeanAIChatMessage in openAIMessages corresponds to a Message in messages, with the role and content properties copied over.
        //creates an obj of OpenAIChatBody
        let body = OpeanAIChatBody(model: "gpt-3.5-turbo", messages: openAIMessages, temperature: 0)//object to be sent in the HTTP request to the OpenAI API

        //                Dictionarie [  kay    :  value  ]
        let headers: HTTPHeaders = ["Authorization": "Bearer \(Constants.openAIpiKey)"]
        //The server uses this key to identify your application and ensure that it has the necessary permissions to make the request.
                    //body(OpeanAIChatBody(openAIMessages(messages[Message(currentInput(text field))])))

//        print( try! await AF.request(endpointURL, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(OpeanAIChatResponse.self).value, "❤️")

        return try! await AF.request(endpointURL, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(OpeanAIChatResponse.self).value
        //serializingDecodable method allows you to specify the type of object you want to decode the response into. In your code, you're specifying OpeanAIChatResponse.self, which means you want to deserialize the response data into an instance of the OpeanAIChatResponse struct.
        //so we make OpeanAIChatResponse Obj from the Decodable response
        // return value ( the respons)


    }
}


struct OpeanAIChatBody: Encodable {

    let model: String
    let messages: [OpeanAIChatMessage]//array of openAIMessages, came from Message(only role & content)
    //* in the structer we only define the type choices: [OpenAIChatChoice], but we use the ctual data when we call the structure,^OpeanAIChatBody(model: "gpt-3.5-turbo", messages: openAIMessages)
    let temperature : Double
}





// same structer as JSON structer
//structs are a way to model the data that the OpenAI API returns and to work with this data in a type-safe way
struct OpeanAIChatResponse: Decodable{//Decodable>protocol that can be initialized from JSON Obj

    let choices: [OpenAIChatChoice]//choices is an array of OpenAIChatChoice Obj

}

struct OpenAIChatChoice: Decodable{
    //responseMessage
    let message: OpeanAIChatMessage
}

struct OpeanAIChatMessage: Codable{ //we convert Message to > OpeanAIChatMessage, so we take only the role & content properties from Message to but them in the OpeanAIChatMessage new Obj

    let role: SenerRole
    let content: String
}

enum SenerRole: String, Codable{
    case system
    case user
    case assistant

}
// choices = [message]
// choices = [message{role:system, content: "Hello, how can I help you today?" }]
