
import Foundation

//extension ChatView {
    //class handel sending the user message and reciving it from the AI
    class ViewModel : ObservableObject {
        @Published var mc : String = ""
        @Published var tasks: [DayTask] = []
        @Published var isDataLoaded: Bool = false // Add this line
        static let shared = ViewModel()
        
        enum EL: String, CaseIterable, Identifiable {
            case beginner = "beginner"
            case intermediate = "intermediate"
            case expert = "expert"
        
            var id: String { self.rawValue }
        }
        @Published var selectedLevel: EL = .beginner

        //contains the chat history as an array of Message object
        
        //ct as learning mentor and set plan for me to study swift in 21 days and be consider my Experience level is beginner, and the format should be as following: week 1 (day one:task 1, task2), day tow:(task 1, task2)
        @Published var messages : [Message] = []
        
        @Published var challengeTitle: String = ""
     //   @Published var ExperianceLevel: String = ""//enum
        init()
        {
            
        }
        init (tasks: [DayTask]){
            self.tasks = tasks
        }
        var cont: String {
                    """
                    Act as if you are an expert in \(challengeTitle) and provide me with a 5-day plan with tasks every single day to learn \(challengeTitle). Notice that I'm a \(selectedLevel), I want the pln for to be like this:

                    Day 1:
                    - Task 1
                    - Task 2
                    
                    Day 2:
                    - Task 1
                    - Task 2

                    ...
                    """
                }
        
        private let openAIService = OpenAIService()
        
        func handleUserInput(com: @escaping(String)->()){
            //  var mc : String = ""
            let newMessage = Message(id: UUID(), role: .user, content: cont, createAt: Data())
            messages.append(newMessage)
            // to clear the TextField
            challengeTitle = ""
            
            Task{
                //await: to call the asynchronous func(sendMessage) W/O blocking the rest of the code,
                let response = await openAIService.sendMessage(messages: messages)
                guard let receivedOpenAIMessage = response.choices.first?.message else {
                    print("Had no received massage")
                    return
                    
                }
                let receivedMessage = Message(id: UUID(), role: receivedOpenAIMessage.role, content: receivedOpenAIMessage.content, createAt: Data())
                await MainActor.run{
                    messages.append(receivedMessage)
                    let result = receivedMessage.content
                    self.mc = result
                    com(mc)
                    print("\(mc)❤️✅")
                    
                }
                
                
            }
        
            
            
        }
       

        //take the API  responce >return> array of type DayTask
        // Modify the getTasks function
        func getTasks(from input: String,com: @escaping(String)->()){ //-> [DayTask] {
//            var tasks: [DayTask] = []
            isDataLoaded = true
            let lines = input.components(separatedBy: "\n\n")
            for line in lines {
                let components = line.components(separatedBy: ":")
                if components.count == 4 && components[0].hasPrefix("Day") {
                    print("components \(components)")
                    let day = components[0].trimmingCharacters(in: .whitespaces)
                    let dayTasks = components[1].trimmingCharacters(in: .whitespaces)
                    let tasksOfDay = dayTasks.components(separatedBy: "\n")
                    
                    // Debug print statements
//                              print("line: \(line)")
//                              print("dayTasks: \(dayTasks)")
//                              print("tasksOfDay: \(tasksOfDay)")
                    
                    var tasksArray : [Tasks] = []
                    
                    for oneTask in tasksOfDay {
                        //appind tasks )
                        print("tasksOfDay : \(tasksOfDay)")
                        tasksArray.append(Tasks(name: oneTask, isSelected: false))
                    }
                    print("tasksArray : \(tasksArray)")

                 //   loop over
                  //   Split task string into array of tasks
//                    let tasksArray = components[1].trimmingCharacters(in: .whitespaces).components(separatedBy: "\n")
//                    tasks.append(DayTask(day: day, tasks: .init(name: "", isSelected: false)))
//
                    self.tasks.append(DayTask(day: day, task: tasksArray))
                }
            }
           // self.tasks = tasks
            com("done")

            //return tasks
        }
        
        
    }
//}





struct DayTask:Identifiable {
    let id = UUID().uuidString
    let day: String
    let task: [Tasks]  // Tasks from DailyTasks array of tasks
}

struct Tasks: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool
}

struct Message : Decodable {
    let id: UUID
    let role: SenerRole
    let content: String
    let createAt : Data
}

