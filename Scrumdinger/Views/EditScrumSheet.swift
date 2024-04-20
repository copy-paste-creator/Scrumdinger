import SwiftUI

struct EditScrumSheet: View {
    @Binding var scrum: DailyScrum
    @Binding var isPresentingEditView: Bool
    @State private var editingScrum: DailyScrum
    
    init(scrum: Binding<DailyScrum>, isPresentingEditView: Binding<Bool>, editingScrum: DailyScrum = DailyScrum.emptyScrum) {
        self._scrum = scrum
        self._isPresentingEditView = isPresentingEditView
        self.editingScrum = scrum.wrappedValue
    }
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
                .navigationTitle(scrum.title)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel") {
                            isPresentingEditView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentingEditView = false
                            scrum = editingScrum
                        }
                    }
                }
        }
    }
}

#Preview {
    EditScrumSheet(scrum: .constant(DailyScrum.sampleData[0]), isPresentingEditView: .constant(true))
}
