import SwiftUI

struct ItemView: View {
    let selectedItem: Item
    var body: some View {
        Form {
            Section(header: Text("Game Details")) {
                Image(systemName: "1.circle")
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedItem.name)
                    .font(.headline)
                Text(selectedItem.source)
                    .font(.largeTitle)
                Text(selectedItem.description)
                    .font(.body)
                HStack {
                    Text("Type:")
                    Spacer()
                    Text(selectedItem.type)
                        .foregroundColor(selectedItem.type == "Expense" ? .red : .green)
                }
                HStack {
                    Text("Amount:").font(.headline)
                    Spacer()
                    Text("$\(String(selectedItem.amount))")
                        .foregroundColor(selectedItem.type == "Expense" ? .red : .green)
                }
                
                
            }
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(selectedItem: itemData[0])
    }
}
