//
//  PickerViewController.swift
//  thridSeminar
//
//  Created by 송지훈 on 2020/10/31.
//

import UIKit

class PickerViewController: UIViewController {

    
    var partList : [Part] = []
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetting()
        settingPikcerView()
        pickerView.delegate = self
        
    }
    
    func defaultSetting()
    {
        textLabel.text = "파트를 선택해주세요"
    }
    
    
    func settingPikcerView()
    {
        partList.append(Part(partName: "Plan", imageName: "plan"))
        partList.append(Part(partName: "Design", imageName: "design"))
        partList.append(Part(partName: "Server", imageName: "server"))
        partList.append(Part(partName: "iOS", imageName: "ios"))
        partList.append(Part(partName: "Android", imageName: "android"))
        partList.append(Part(partName: "Web", imageName: "web"))
        
    }

 

}


extension PickerViewController:UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return partList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return partList[row].partName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        self.imageView.image = partList[row].makeImage()
        self.textLabel.text = partList[row].partName
    }
    
    
}

extension PickerViewController:UIPickerViewDelegate
{
    
    
}
