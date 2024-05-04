////
////  DaysAndTasks.swift
////  21era
////
////  Created by Nsreen Alfaifi on 14/11/1444 AH.
////
//
//import SwiftUI
//
//struct DaysAndTasks: View {
////    @StateObject var viewModel = ViewModel()
//    @EnvironmentObject var viewModel :ViewModel
//    //Aded
//   // @EnvironmentObject var viewModel: ViewModel
//    
////    @ObservedObject var viewModel: ViewModel
////    let tasks : [DayTask]
////    init( tasks: [DayTask]){
////        self.tasks = tasks
////
////        self.viewModel = ViewModel(tasks: tasks)
////    }
//
//    var numberOfDays: Int {
//            viewModel.tasks.count
//        }
//    @State var selectedDay: Int?
//    @State private var completedDays: [Int] = []
//
//    
//    var body: some View {
//       
//        VStack{
//            
//            ZStack{
//                
//                Rectangle()
//                    .frame(width: 345 , height: 50)
//                    .foregroundColor(Color("MainColor"))
//                    .opacity(0.3)
//                    .cornerRadius(17)
//                
//                ScrollView(.horizontal , showsIndicators: false) {
//                    
//                    HStack(spacing: 20) {
//                        
//                        ForEach(1...ViewModel.shared.tasks.count, id: \.self) { day in
//                               DayButton(day: day, selectedDay: $selectedDay)
//                           }
//                    }
//                   
//                    
//                }
//                .padding()
//               
//            }
//           // .padding(.all)
//         
//            
//            
//            if let selectedDay = selectedDay {
//                
//                Divider()
//                
//                VStack(alignment: .leading){
//                    Text("Daily Task")
//                        .font(.custom("basecoat-bold", size: 24))
//                 
//                    
//                    //checks if the selectedDay index is within the range of the tasks array. It's a way of preventing out-of-bounds errors which occur when trying to access an array element with an index that is outside of its range.
//                    if selectedDay <= ViewModel.shared.tasks.count {
//                        DailyTasks(tasks: ViewModel.shared.tasks[selectedDay - 1].task)//initializing the DailyTasks view with the tasks for the selected day.
//                                       }
////                    if selectedDay <= viewModel.tasks.count {
////                                           DailyTasks(tasks: viewModel.tasks[selectedDay - 1].task)//initializing the DailyTasks view with the tasks for the selected day.
////                                       }
//                    
//                    
//                }
//             
//            
//            }
//            
//            
//        }
//        
//        
//        
//        
//    }
//}
//
//
//struct DayButton: View {
//    let day: Int
//    @Binding var selectedDay: Int?
//    
//    var body: some View {
//        
//        
//        Button(action: {
//            selectedDay = day
//            
//        }) {
//            // the chosen day
//            Text("\(day)")
//                .font(.custom("basecoat", size: 20))
//                .frame(width: 40, height: 45)
//                .foregroundColor(.white)
//                .background(dayBackground)
//                .clipShape(Circle())
//        }
//        .buttonStyle(DayButtonStyle(selected: selectedDay == day))
//    }
//    
//    var dayBackground: some View {
//        
//        Group {
//            if selectedDay == day {
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color("MainColor"))
//            } else {
//                Circle()
//                    .fill(Color("MainColor"))
//                    .opacity(0.5)
//            }
//        }
//    }
//}
//
//
//
//
//struct DayButtonStyle : ButtonStyle {
//    
//    let selected: Bool
//
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .opacity(configuration.isPressed ? 0.5 : 1)
//            .scaleEffect(configuration.isPressed ? 0.9 : 1)
//    }
//}
//
//
//
//struct DaysAndTasks_Previews: PreviewProvider {
//    static var previews: some View {
//        DaysAndTasks()
//    }
//}
