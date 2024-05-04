//import SwiftUI
//
//struct ChatView: View {
//    @StateObject var viewModel = ViewModel()
//    @State private var selectedDay: Int?
//    var numberOfDays: Int {
//        viewModel.tasks.count
//    }
//    
//    var body: some View {
//        VStack {
//            List {
////                ForEach(0..<numberOfDays, id: \.self) { i in
////                    Section(header: Text(viewModel.tasks.day)) {
////                        ForEach(0..<viewModel.tasks[i].task.count, id: \.self) { j in
////                            Text("\(viewModel.tasks[i].task[j].name)")
////                        }
////                    }
////                }
//            }
//            Spacer()
//            
//            Picker("Please choose the level", selection: $viewModel.selectedLevel) {
//                ForEach(ViewModel.EL.allCases) { level in
//                    Text(level.rawValue).tag(level)
//                }
//            }
//            .pickerStyle(MenuPickerStyle())
//            
////            HStack {
////                TextField("What do you want to learn?", text: $viewModel.challengeTitle)
////
////                Button(action: {
////                    viewModel.handleUserInput { ms in
////                        viewModel.getTasks(from: ms) { _ in
////                            print(self.viewModel.tasks, "🧲")
////                        }
////                    }
////                }) {
////                    Text("Continue")
////                        .frame(width: 280 , height: 50)
////                        .background(Color.black)
////                        .cornerRadius(15)
////                        .font(.custom("basecoat-bold", size: 24))
////                        .foregroundColor(.white)
////                }
////            }
////            .padding()
//        }
//    }
//
//}
//
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
//   
