import SwiftUI
import Algorithms
import UniformTypeIdentifiers

struct TaskItem: Codable, Hashable, Transferable {
    let id: UUID
    let title: String
    let owner: String
    let note: String
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .taskItem)
    }
}

extension UTType {
    static let taskItem = UTType(exportedAs: "tanay.DragandDrop")
}
