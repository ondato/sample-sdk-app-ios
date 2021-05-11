import UIKit
import OndatoSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        let accessToken = "YOUR ACCESS TOKEN"
        let identificationId = "YOUR IDENTIFICATION ID"
         
        OndatoService.shared.initialize(accessToken: accessToken)
        OndatoService.shared.identificationId = identificationId
        OndatoService.shared.flowDelegate = self
        
        let sdk = OndatoService.shared.instantiateOndatoViewController()
        sdk.modalPresentationStyle = .fullScreen
        
        present(sdk, animated: true, completion: nil)
    }
}

extension ViewController: OndatoFlowDelegate {
    func flowDidFail(identificationId: String?, error: OndatoServiceError) {
        print("Failure \(identificationId) reason: \(error)")
    }
    
    func flowDidSucceed(identificationId: String?) {
        print("Success \(identificationId)")
    }
}
