
import SwiftUI
import Algorithms
import UniformTypeIdentifiers
struct TaskMockData {
    static let taskOne = TaskItem(id: UUID(),
                                  title: "Design UI",
                                  owner: "tanay",
                                  note: "Note")
    
    static let taskTwo = TaskItem(id: UUID(),
                                  title: "Development",
                                  owner: "tanay",
                                  note: "Note")
    
    static let taskThree = TaskItem(id: UUID(),
                                    title: "Api Intregation",
                                    owner: "tanay",
                                    note: "Note")
    
    static let taskFour = TaskItem(id: UUID(),
                                   title: "QA Testing",
                                   owner: "tanay",
                                   note: "Note")
    
}
