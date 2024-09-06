import SwiftUI

// A SwiftUI view that wraps a UIImagePickerController
struct ImagePicker: UIViewControllerRepresentable {
    // Coordinator class to handle UIImagePickerControllerDelegate methods
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        // Method called when an image is picked
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    @Binding var image: UIImage? // Binding to the selected image
    @Environment(\.presentationMode) var presentationMode // Environment variable to control presentation mode

    // Creates the coordinator instance
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    // Creates the UIImagePickerController instance
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    // Updates the UIImagePickerController instance
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
