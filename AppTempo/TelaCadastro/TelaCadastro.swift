

import UIKit

class TelaCadastro: UIViewController {

    @IBOutlet weak var TextFieldNome: UITextField!
    @IBOutlet weak var TextFieldTelefone: UITextField!
    @IBOutlet weak var TextFieldEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextFieldNome.delegate = self
        TextFieldTelefone.delegate = self
        TextFieldEmail.delegate = self
        TextFieldEmail.delegate = self

    }
    
    @IBAction func ButtonCadastrar(_ sender: UIButton) {
        
        Validacao1()
    }
    func Validacao1(){
        if validateEmail() {
            self.showAlert(title: "Cadastrado com Sucesso")}
        else{
            self.showAlert(title: "Erro ao Cadastrar")
        }
    }
    func showAlert(title:String){
        
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction (okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
  

}

extension TelaCadastro: UITextFieldDelegate{
    
    func validateEmail()->Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        print("ValidadeEmail: \(validateRegex.evaluate(with: self.TextFieldEmail.text))")
        return validateRegex.evaluate(with: self.TextFieldEmail.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(self.TextFieldNome){
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
            
        } else{
            if TextFieldTelefone.hasText{
                TextFieldTelefone.layer.borderColor = UIColor.blue.cgColor
                TextFieldTelefone.layer.borderWidth = 1
               
            } else{
                TextFieldTelefone.layer.borderColor = UIColor.red.cgColor
                TextFieldTelefone.layer.borderWidth = 1
             
            }
            if TextFieldEmail.hasText{
                TextFieldEmail.layer.borderColor = UIColor.blue.cgColor
                TextFieldEmail.layer.borderWidth = 1
               
            } else{
                TextFieldEmail.layer.borderColor = UIColor.red.cgColor
                TextFieldEmail.layer.borderWidth = 1
                
            }
        }
    }

}
