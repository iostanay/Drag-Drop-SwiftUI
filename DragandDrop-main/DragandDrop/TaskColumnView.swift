

import SwiftUI
import Algorithms
import UniformTypeIdentifiers
struct TaskColumnView: View {
    let title: String
    let tasks: [TaskItem]
    let isTargeted: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(isTargeted ? Color.red.opacity(0.5) : Color.black.opacity(0.7))
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(tasks, id: \.id) { task in
                        Text(task.title)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.red.opacity(0.5))
                            .cornerRadius(15)
                            .shadow(color: .black, radius: 1, x: 1, y: 1)
                            .draggable(task)
                    }
                }
            }
        }
    }
}



