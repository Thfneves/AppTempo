

import UIKit

class TelaCadastro: UIViewController {

    @IBOutlet weak var TextFieldNome: UITextField!
    @IBOutlet weak var TextFieldSenha: UITextField!
    @IBOutlet weak var TextFieldConfirmacaoSenha: UITextField!
    @IBOutlet weak var TextFieldTelefone: UITextField!
    @IBOutlet weak var TextFieldEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextFieldNome.delegate = self
        TextFieldSenha.delegate = self
        TextFieldConfirmacaoSenha.delegate = self
        TextFieldTelefone.delegate = self
        TextFieldEmail.delegate = self
        TextFieldEmail.delegate = self
        TextFieldSenha.isSecureTextEntry = true
        TextFieldConfirmacaoSenha.isSecureTextEntry = true

    }
    
    @IBAction func ButtonCadastrar(_ sender: UIButton) {
        
        Validacao1()
    }
    func Validacao1(){
        if validateEmail() && validadePassword() && validadeRepitPassword() &&  nomePassword(){
            self.showAlert(title: "Cadastrado com Sucesso")}
        else{
            self.showAlert(title: "Erro ao logar")
        }
    }
    func showAlert(title:String){
        
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction (okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
  
    func validadeRepitPassword()->Bool{
        
        if TextFieldSenha.text == TextFieldConfirmacaoSenha.text{
            print("ValidadePassword: \(true))")
            return true
         
        } else {
            print("ValidadePassword: \(false))")
            return false
        }
    }
}

extension TelaCadastro: UITextFieldDelegate{
    
    func validateEmail()->Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        print("ValidadeEmail: \(validateRegex.evaluate(with: self.TextFieldEmail.text))")
        return validateRegex.evaluate(with: self.TextFieldEmail.text)
    }

    func nomePassword()->Bool{
        let nomeRegex = ".{3,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", nomeRegex)
        print("ValidadePassword: \(validateRegex.evaluate(with: self.TextFieldNome.text))")
        return validateRegex.evaluate(with: self.TextFieldNome.text)
    }

    func validadePassword()->Bool{
        let passwordRegex = ".{6,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        print("ValidadePassword: \(validateRegex.evaluate(with: self.TextFieldSenha.text))")
        return validateRegex.evaluate(with: self.TextFieldSenha.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(self.TextFieldNome) {
            self.TextFieldSenha.becomeFirstResponder()
        } else if textField.isEqual(self.TextFieldSenha) {
            self.TextFieldConfirmacaoSenha.becomeFirstResponder()
        } else if textField.isEqual(self.TextFieldConfirmacaoSenha) {
            self.TextFieldTelefone.becomeFirstResponder()
        } else if textField.isEqual(self.TextFieldTelefone) {
            self.TextFieldEmail.becomeFirstResponder()
        }
        return true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        validationCadastro1()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        
    }
    
    func validationCadastro1(){
        if TextFieldNome.hasText{
            TextFieldNome.layer.borderColor = UIColor.blue.cgColor
            TextFieldNome.layer.borderWidth = 1
            print("Nome")
        } else{
            TextFieldNome.layer.borderColor = UIColor.red.cgColor
            TextFieldNome.layer.borderWidth = 1
            print("senha")
        }
        if TextFieldSenha.hasText{
            TextFieldSenha.layer.borderColor = UIColor.blue.cgColor
            TextFieldSenha.layer.borderWidth = 1
            print("senha")
        } else{
            TextFieldSenha.layer.borderColor = UIColor.red.cgColor
            TextFieldSenha.layer.borderWidth = 1
            print("senha")
            if TextFieldConfirmacaoSenha.hasText{
                TextFieldConfirmacaoSenha.layer.borderColor = UIColor.blue.cgColor
                TextFieldConfirmacaoSenha.layer.borderWidth = 1
                print("ConfSenha")
            } else{
                TextFieldConfirmacaoSenha.layer.borderColor = UIColor.red.cgColor
                TextFieldConfirmacaoSenha.layer.borderWidth = 1
                print("confsenha")
            }
            if TextFieldTelefone.hasText{
                TextFieldTelefone.layer.borderColor = UIColor.blue.cgColor
                TextFieldTelefone.layer.borderWidth = 1
                print("telefone")
            } else{
                TextFieldTelefone.layer.borderColor = UIColor.red.cgColor
                TextFieldTelefone.layer.borderWidth = 1
                print("telefone")
            }
            if TextFieldEmail.hasText{
                TextFieldEmail.layer.borderColor = UIColor.blue.cgColor
                TextFieldEmail.layer.borderWidth = 1
                print("Nome")
            } else{
                TextFieldEmail.layer.borderColor = UIColor.red.cgColor
                TextFieldEmail.layer.borderWidth = 1
                print("Nome")
            }
        }
    }

}
