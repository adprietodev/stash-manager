//
//  CustomImagePickerManager.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 18/5/24.
//

import UIKit

class CustomImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Properties
    private var pickerController: UIImagePickerController!
    private var presentingViewController: UIViewController!
    private var pickImageCallback: ((UIImage) -> Void)?

    override init() {
        super.init()
        self.pickerController = UIImagePickerController()
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
    }

    func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> Void)) {
        self.presentingViewController = viewController
        self.pickImageCallback = callback

        let alert = UIAlertController(title: "Seleccionar Imagen", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cámara", style: .default, handler: {_ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Galería", style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        viewController.present(alert, animated: true)
    }

    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.pickerController.sourceType = .camera
            self.presentingViewController.present(self.pickerController, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Cámara no disponible", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.presentingViewController.present(alert, animated: true, completion: nil)
        }
    }

    private func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.pickerController.sourceType = .photoLibrary
            self.presentingViewController.present(self.pickerController, animated: true, completion: nil)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {
            picker.dismiss(animated: true, completion: nil)
            return
        }
        self.pickImageCallback?(selectedImage)
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let withRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height

        var newSize: CGSize
        if(withRatio > heightRatio) {
            newSize = CGSize(width: size.width*heightRatio, height: size.height*heightRatio)
        } else {
            newSize = CGSize(width: size.width*withRatio, height: size.height*withRatio)
        }

        let rect = CGRect(origin: .zero, size: newSize)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
