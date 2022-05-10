//
//  ImagePicker.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/09.
//

import SwiftUI


import UIKit
import SwiftUI

// UIImagePickerController를 SwiftUI와 통합하기 위해 UIViewControllerRepresentable 사용
struct ImagePicker: UIViewControllerRepresentable {
    // UIImagePickerController를 사용하면 사진첩과 빌트인 카메라에 접근 가능
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @Binding var selectedImage: UIImage // 선택된 사진 저장
    @Binding var gifImage: Image    // ProfileView의 profileImage
    @Environment(\.presentationMode) private var presentationMode   // 선택 후 사진첩을 닫기 위해 필요
    // ImagePicker가 초기화될 때 불려지는 함수
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        // 인스턴스화
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator  // 이미지 선택/촬영 or 취솔
        
        // Return an instance of UIImagePickerController
        return imagePicker
    }
    
    // 필수 but config를 업데이트할 필요가 없다면 내용은 비워놔도 됨
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    // Coordinator 인스턴스 생성
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        // 사용자가 사진을 선택하면 실행
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
                parent.gifImage = Image(uiImage: image)
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
