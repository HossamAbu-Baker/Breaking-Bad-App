
import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var char = [Character]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .gray
        
        setupCell()
        getData()
        
       
    
    }

    
    //             MARK: set Cell
    
    func setupCell(){
        collectionView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellWithReuseIdentifier: "CharacterCell")
    }

    // MARK: get data from servar
    func getData () {
        
        Reguest().CallAPI(url: "https://www.breakingbadapi.com/api/characters/", method: "GET", parametar: [:], header: [:], response: [Character].self) { data in
            switch data{
                
            case .success(let res):
                self.char=res!
                self.collectionView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
        
    }

    
//    MARK: Set Data In Collection
}
extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        char.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        let opject = char[indexPath.row]
        
        let urlImage = URL(string: opject.img ?? "")!
        let url = try! Data(contentsOf: urlImage)
        
        cell.nameLabel.text = opject.name
        cell.photo.image = UIImage(data: url)
        cell.backgroundColor = .white
     
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
       
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "infoVC") as! InfoVC
        
        let opject = char[indexPath.row]
        vc.char = opject
//        vc.view.backgroundColor = .yellow
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width * 0.488, height: self.view.frame.width * 0.488)
        
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    }

    




