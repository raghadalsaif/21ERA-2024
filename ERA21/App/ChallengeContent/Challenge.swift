
//  Created by Nsreen Alfaifi on 14/11/1444 AH.
//


import SwiftUI

struct Challenge: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var selectedDay: Int?
    @State private var progress: CGFloat = 0.5
 //   @Binding var Learn : String
    var numberOfDays: Int {
        viewModel.tasks.count
    }
    
    var body: some View {
        VStack {
            
            Text("Learn Python")
                .font(.custom("basecoat-bold", size: 32))
            
            Divider()
            
            VStack(alignment: .leading,spacing: 16){
                Text("Progress")
                    .font(.custom("basecoat-bold", size: 24))
                ProgressView(value: progress)
                    .progressViewStyle(MyProgressViewStyle(progressColor: Color("MainColor")))
            }
            
            Divider()
            
            VStack(alignment: .leading,spacing: 1){
                Text("Dayas")
                    .font(.custom("basecoat-bold", size: 24))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<viewModel.tasks.count, id: \.self) { dayIndex in
                            Button(action: {
                                self.selectedDay = dayIndex
                            }) {
                                Text("\(dayIndex + 1)")
                                    .padding()
                                    .background(dayIndex == selectedDay ?  Color("MainColor") : Color("MainColor").opacity(0.7) )
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .padding()
                }
                
            }
            if let selectedDayIndex = selectedDay {
                VStack(spacing: 20) {
                    ForEach(viewModel.tasks[selectedDayIndex].task) { task in
                        Text(task.name)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(task.isSelected ?  Color("MainColor"):  Color("MainColor").opacity(0.7) )
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                //.padding(.horizontal)
            }
            
            Spacer()
        } .padding(.horizontal)
    }
    func updateProgress() {
        progress += 0.1
        if progress > 1.0 {
            progress = 0.0
        }
    }
}




//struct sss: View {
//    //Aeded
// //   @StateObject var viewModel = ViewModel() // create an instance of ViewModel from ChatView (Code 1)
//    @StateObject var viewModel = ViewModel()
//
//    @State var ChallengeTitle: String = "Learn Python"
//    @State var ChallengeTask: [String] = [ " Task1", " Task2"]
//    @State var ChallengeProgress: String = "Nsreen"
//
//    @State private var selectedDay: Int?
//    var numberOfDays: Int {
//        viewModel.tasks.count
//    }
//
//    @State private var progress: CGFloat = 1
//
//
//    var body: some View {
//
//       // NavigationView {
//            VStack{
//
//                Divider()
//
//                VStack(alignment: .leading,spacing: 16){
//                    Text("Progress")
//                        .font(.custom("basecoat-bold", size: 24))
//                    ProgressView(value: progress)
//                        .progressViewStyle(MyProgressViewStyle(progressColor: Color("MainColor")))
//                }
//
//
//                Divider()
//
//                //Neeed to be change
//                VStack(alignment: .leading, spacing: 4){
//                  //  Text("Days")
//                     //   .font(.custom("basecoat-bold", size: 24))
//
//                    List {
//                        ForEach(0..<numberOfDays, id: \.self) { i in
//                            Section(header: Text(viewModel.tasks[i].day)) {
//                                ForEach(0..<viewModel.tasks[i].task.count, id: \.self) { j in
//                                    Text("\(viewModel.tasks[i].task[j].name)")
//                                }
//                            }
//                        }
//                    }
//                 //  DaysAndTasks() //crashed
////                        .environmentObject(viewModel)
//
//                }
//
//              Spacer()
//
//            }
//
//            .padding()
//
//            .navigationTitle(ChallengeTitle)
//
//
//
//
//  //And in your Challenge View, you can initialize this DailyTasks struct with the tasks from the ViewModel:
//       // DailyTasks()//tasks: viewModel.tasks
//    }
//
//
//
//    func updateProgress() {
//        progress += 0.1
//        if progress > 1.0 {
//            progress = 0.0
//        }
//    }
//
//
//}



struct MyProgressViewStyle: ProgressViewStyle {
    var progressColor: Color

    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .accentColor(progressColor)
    }
}

struct Challenge_Previews: PreviewProvider {
    static var previews: some View {
        Challenge()
    }
}
