//
//  ViewController.swift
//  LessonThreeApp
//
//  Created by  Aliaksei on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let userName = "Alex"
    private let password = "Parol"
    private let intro = "Меня зовут Алексей. Мне 26 лет. Я работаю тестировщиком в Шведской телекекомуникационной компании 6 лет. К сожалению получаемый технический опыт практически невозможно применить в других компаниях, в виду узкой направленности и индивидульного оборудования на котором мы работаем. Давно посещали мысли обрести знания в других направлениях, чтобы можно было развиваться и пробовать искать работу в других компаниях и не быть заложником одной корпорации. С раннего детства меня тянуло к технике, будь то железяки, компьютеры, приставки, а потом и телефоны, планшеты. Довелось быть пользователем самых разных платформ и сборкой-пересборкой их железа, модификаций прошивок. Самое яркое, что запомнилось, то это хакинтош собранный и полностью рабочий на предрилизном интеловском проце и модифицированном под него биосом. Наигравшись Виндовс и Андройд платформами нескольк лет назад полность перещёл на технику Эпл, и понял, что это тот продукт, который не требует доработки напильником и маскимально стабилен. После данного опыта и появилось желание стать разрабочиком приложений для данной экосистемы. На данный момент больше всего времени свободного с компьютерного железа я перенёс на свой автомобиль, в котором я полностью зменил все что касается агрегатов привидения его в движения автомобиля и его остановки: свап мотора с 2.0 на 4.3 V8 на прямотоке, ручной коробкой со спортивным одномассовым маховиком, блокировкой заднего дифференциала, 4 поршневые тормоза вместо 2 поршневых и перенос аккумулятора в багажник. При всём при этом остался полностью заводской внешний вид, чтобы в потоке и на светофорах никто не смог догадаться, что кроется под этой оберткой. Как-то так :)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController
        else { return }
        for viewController in tabBarController.viewControllers! {
            guard let userVC = viewController as? UserProfileViewController else { return }
            userVC.introUser = intro
            guard let welcomeVC = viewController as? WelcomeViewController else { return }
            welcomeVC.welcomeUserValue = userName
        }
    }
    
    @IBAction func logInButtonPressed() {
        guard userNameTextField.text == userName, passwordTextField.text == password else {
            alertForgotOrWrong(
                title: "Invalid login or password",
                value: "Please, enter correct login and password"
            )
            passwordTextField.text = ""
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotUserPressed() {
        alertForgotOrWrong(title: "Your User Name is: ", value: userName)
    }
    
    @IBAction func forgotPasswordPressed() {
        alertForgotOrWrong(title: "Your Password is: ", value: password)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
      
    private func alertForgotOrWrong(title: String, value: String) {
        let userAlert = UIAlertController(title: "\(title)", message: "\(value)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        userAlert.addAction(okAction)
        present(userAlert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}

