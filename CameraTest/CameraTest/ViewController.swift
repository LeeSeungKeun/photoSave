//
//  ViewController.swift
//  CameraTest
//
//  Created by 이성근 on 2020/09/08.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let picker = UIImagePickerController()
    var originalImage : UIImage?


    @IBOutlet weak var albumImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self // 델리게이트
    }
    // 앨범오픈
    func openAlbum(){
        picker.sourceType  = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    // 카메라오픈
    func openCamrea(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }else{
            print("NO IPHONE")
        }
    }

    @IBAction func openAblumAction(_ sender: Any) {
        openAlbum()
    }

    @IBAction func takePhotoAction(_ sender: Any) {
        openCamrea()
    }


    @IBAction func savePhoto(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(originalImage!, self, #selector(saveImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    //#selector
    @objc func saveImage(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
           if let error = error { //사진저장 에러
                print(error)
           } else {
                print("Save")
           }
    }
}

extension ViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    // 사진선택
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            originalImage = image
            albumImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

