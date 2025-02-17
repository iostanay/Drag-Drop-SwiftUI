

import SwiftUI
import Algorithms
import UniformTypeIdentifiers



struct TaskBoardView: View {
    @State private var toDoTasks: [TaskItem] = [TaskMockData.taskOne, TaskMockData.taskTwo, TaskMockData.taskThree, TaskMockData.taskFour]
    @State private var inProgressTasks: [TaskItem] = []
    @State private var doneTasks: [TaskItem] = []
    @State private var strTxtNmae : String = ""
    @State private var showPopup = false

    @State private var isToDoTargeted = false
    @State private var isInProgressTargeted = false
    @State private var isDoneTargeted = false
    
    var body: some View {
        ZStack
        {
            VStack(spacing: 10)
            {
                HStack
                {
                    Text("Job Board")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.blue)
                        .padding(.leading,290)
                    Spacer()
                    Button(action: {
                        showPopup.toggle()
                    }) {
                        Text("Add Task")
                            .font(.headline)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.2), radius: 5)
                    }
                    
                }
                .padding(.top,10)
                
                HStack(spacing: 10) {
                   
                    
                    HStack(spacing: 10) {
                        TaskColumnView(title: "To Do", tasks: toDoTasks, isTargeted: isToDoTargeted)
                            .dropDestination(for: TaskItem.self) { droppedTasks, location in
                                for task in droppedTasks {
                                    inProgressTasks.removeAll { $0.id == task.id }
                                    doneTasks.removeAll { $0.id == task.id }
                                }
                                let totalTasks = toDoTasks + droppedTasks
                                toDoTasks = Array(totalTasks.uniqued())
                                return true
                            } isTargeted: { isTargeted in
                                isToDoTargeted = isTargeted
                            }
                        
                        TaskColumnView(title: "In Progress", tasks: inProgressTasks, isTargeted: isInProgressTargeted)
                            .dropDestination(for: TaskItem.self) { droppedTasks, location in
                                for task in droppedTasks {
                                    toDoTasks.removeAll { $0.id == task.id }
                                    doneTasks.removeAll { $0.id == task.id }
                                }
                                let totalTasks = inProgressTasks + droppedTasks
                                inProgressTasks = Array(totalTasks.uniqued())
                                return true
                            } isTargeted: { isTargeted in
                                isInProgressTargeted = isTargeted
                            }
                        
                        TaskColumnView(title: "Done", tasks: doneTasks, isTargeted: isDoneTargeted)
                            .dropDestination(for: TaskItem.self) { droppedTasks, location in
                                for task in droppedTasks {
                                    toDoTasks.removeAll { $0.id == task.id }
                                    inProgressTasks.removeAll { $0.id == task.id }
                                }
                                let totalTasks = doneTasks + droppedTasks
                                doneTasks = Array(totalTasks.uniqued())
                                return true
                            } isTargeted: { isTargeted in
                                isDoneTargeted = isTargeted
                            }
                    }
                    
                    .padding()
                    
                    
                    
                }
            }
            
            
            // Custom Popup
            if showPopup {
                ZStack {
                    Color.black.opacity(0.3) // Dim background
                        .ignoresSafeArea()
                        .onTapGesture {
                            showPopup = false // Close when tapping outside
                        }
                    
                    VStack(spacing: 15) {
                        Text("Create Task")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        TextField("Task Name", text: $strTxtNmae)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .frame(width: 250)
                        
                        HStack {
                            Button("Cancel") {
                                showPopup = false
                            }
                            .padding()
                            .frame(width: 100)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                            Button("Save") {
                                toDoTasks.append(TaskItem(id: UUID(), title: strTxtNmae, owner: "tanay", note: ""))
                                strTxtNmae = ""
                                showPopup = false
                            }
                            .padding()
                            .frame(width: 100)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                    .padding()
                    .frame(width: 300)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                }
            }
        }
    }
}

#Preview {
    TaskBoardView()
}

