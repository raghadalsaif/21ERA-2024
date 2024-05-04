////
////  DailyTasks.swift
////  21era
////
////  Created by Nsreen Alfaifi on 14/11/1444 AH.
////
//
//import SwiftUI
//
//struct DailyTasks: View {
//    //Added
//    var tasks: [Tasks]
//
//    @EnvironmentObject var viewModel : ViewModel
//  // @StateObject var viewModel = ViewModel()
//   // @State var tasks: [DayTask]
//    // Array to hold unfinished tasks
//    @State private var unfinishedTasks: [Tasks] = []
//
////    @State private var unfinishedTasks: [Tasks] = [
////        Tasks(name: "Install Xcode ", isSelected: false),
////        Tasks(name: "Create a new SwiftUI project", isSelected: false),
////        Tasks(name: "Write simple Text", isSelected: false)
//////
//////        Task(name: "Fetch data from an API using URLSession", isSelected: false)
//////
//////        Task(name: "Display data in your view", isSelected: false),
////
////
//////     Tasks(name: "create your own Project ", isSelected: false),
////
////    ]
//    // Array to hold completed tasks
//    @State private var completedTasks: [Tasks] = []
//
//    
//    var body: some View {
//        //  ScrollView {
//              VStack {
//                  
//                  // Loop through unfinished tasks
//                  ForEach(tasks) { task in
//                      // Display the rectangle task view for each unfinished task
//                      ZStack{
//                          
//                          RectangleTaskView(task: task)
//                              .onTapGesture {
//                                  withAnimation {
//                                      // Toggle the status of the task
//                                      toggleTaskStatus(task: task)
//                                  }
//                              }
//                      }
//                  }
//                  
//                  // Loop through completed tasks
//                  ForEach(completedTasks) { task in
//                      // Display the rectangle task view for each completed task
//                      RectangleTaskView(task: task)
//                  }
//              }
//              .onAppear {
//                          self.unfinishedTasks = tasks
//                      }
//            //  .padding()
//       //   }
//
//    }
//    
//    private func toggleTaskStatus(task: Tasks) {
//        // Find the index of the task in the unfinished tasks array
//        if let index = unfinishedTasks.firstIndex(where: { $0.id == task.id }) {
//            // Create an updated task with the toggled status
//            let updatedTask = Tasks(name: task.name, isSelected: !task.isSelected)
//            
//            if updatedTask.isSelected {
//                // If the task is marked as completed, move it to the completed tasks array
//                unfinishedTasks.remove(at: index)
//                completedTasks.append(updatedTask)
//            } else {
//                // If the task is marked as unfinished, move it back to the unfinished tasks array
//                completedTasks.removeAll(where: { $0.id == task.id })
//                unfinishedTasks.insert(updatedTask, at: index)
//            }
//        }
//    }
//}
//
//struct DailyTasks_Previews: PreviewProvider {
//    static var previews: some View {
//        DailyTasks(tasks: [Tasks(name: "Sample Task 1", isSelected: false), Tasks(name: "Sample Task 2", isSelected: false)])
//            .environmentObject(ViewModel()) // Pass the ViewModel using environmentObject
//    }
//}
//
//
//struct RectangleTaskView: View {
//    let task: Tasks
//    
//    var body: some View {
//        Rectangle()
//            .fill(task.isSelected ? Color("MainColor") : Color("MainColor").opacity(0.2))
//            .frame(width: 340, height: 50)
//            .cornerRadius(17)
//          //  .animation(.easeInOut(duration: 0.5))
//            .overlay(
//                HStack{
//                    Text(task.name) // Display the name of the task on the rectangle
//                        .foregroundColor(task.isSelected ? Color.white : Color("MainColor"))
//                        .font(.custom("basecoat", size: 20))
//                    Spacer()
//                    Text("")
//                }.padding()
//            )
//    }
//}
//
//
//
//
//
//
////struct Tasks: Identifiable {
////    let id = UUID()
////    let name: String
////    var isSelected: Bool
////}
