//
//  AddProductViewController.swift
//  StoreApp
//
//  Created by Minjae Lee on 2023/02/25.
//

import Foundation
import UIKit
import SwiftUI

class AddProductViewController: UIViewController {
    
    private var selectedCategory: Category?
    
    lazy var titleTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter title"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftViewMode = .always
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    lazy var priceTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter price (Numbers only)"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftViewMode = .always
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .numberPad
        return textfield
    }()
    
    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.backgroundColor = UIColor.lightGray
        return textView
    }()
    
    lazy var categoryPickerView: CategoryPickerView = {
        let pickerView = CategoryPickerView { [weak self ] category in
            print(category)
            self?.selectedCategory = category
        }
        return pickerView
    }()
    
    lazy var imageURLTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter image url"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftViewMode = .always
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
    }
    
    private func setupUI() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(priceTextField)
        stackView.addArrangedSubview(descriptionTextView)
        
        // category picker view
        let hostingController = UIHostingController(rootView: categoryPickerView)
        stackView.addArrangedSubview(hostingController.view)
        addChild(hostingController)
        hostingController.didMove(toParent: self)
        
        stackView.addArrangedSubview(imageURLTextField)
        
        
        view.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

struct AddProductViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        AddProductViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct AddProductViewController_Previews: PreviewProvider {
    static var previews: some View {
        AddProductViewControllerRepresentable()
    }
}
