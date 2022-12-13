//
//  MainViewController.swift
//  Paper
//
//  Created by 선민재 on 2022/11/16.
//

import UIKit
import RxCocoa
import RxSwift
import Then
import SnapKit
import Lottie

struct Post {
    var title: String
    var subTitle: String
}

class MainViewController: BaseViewController<MainViewModel>{

    var postTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.hidesBarsOnSwipe = true
        self.navigationItem.mainLogoImage()
        self.navigationItem.mainProfileImage()
        postTableView = UITableView()
        settingTable()
        let blurEffect = UIBlurEffect(style: .dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = hotTextView.frame
        view.addSubview(visualEffectView)
        addScrollView()
        setScrollViewLayout()
//        carouselCollectionView.dataSource = self
//        carouselCollectionView.delegate = self
//        carouselCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        setUpUIConstraints()
//        addView()
    }
    
    override func viewDidLayoutSubviews() {
        writeButton.glogGradient()
    }
    
    func settingTable() {
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        postTableView.dataSource = self
        postTableView.delegate = self
    }
    
    let post: [Post] = [Post(title: "유저 리서치(User Research)란?", subTitle: "일상에서 제품을 이해하고 사용하는데 영향을 미치는 사람의 ...")]
    
    let scrollView = UIScrollView().then {
        $0.backgroundColor = .backgroundColor
    }
    
    let mainLottie = LottieAnimationView(name: "SignUpEmoji").then {
        $0.loopMode = .loop
        $0.play()
    }
    
    let mainText = UILabel().then {
        $0.text = "너의 생각을 \n글로 표현해봐!"
        $0.font = UIFont.GlogFont(size: 40, family: .Bold)
        $0.textColor = .white
        $0.numberOfLines = 2
    }
    
    lazy var writeButton = UIButton().then {
        let text = NSAttributedString(string: "게시글 작성하러 가기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.GlogFont(size: 18, family: .ExtraBold)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    lazy var hotButton = UIButton().then {
        let text = NSAttributedString(string: "🔥 HOT'")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.GlogFont(size: 18, family: .ExtraBold)
        $0.setTitleColor(UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1.0), for: .normal)
        $0.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.6)
        $0.layer.cornerRadius = 10
    }
    
//    let carouselCollectionView: UICollectionView = {
//
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: flowLayout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = UIColor.red
//
//        return collectionView
//
//    }()
    
    let hotImage = UIImageView().then {
        $0.image = UIImage(named: "dummyImage.svg")
        $0.layer.cornerRadius = 10
    }
    
    let hotTextView = UIView().then {
        $0.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.7)
        $0.layer.cornerRadius = 10
    }
    
    let titleText = UILabel().then {
        $0.text = "유저 리서치(User Research)란?"
        $0.font = UIFont.GlogFont(size: 20, family: .SemiBold)
        $0.textColor = .white
    }
    
    let subtitleText = UILabel().then {
        $0.text = "일상에서 제품을 이해하고 사용하는데 영향을 미\n치는 사람의 행위와 동기, 니즈를 특정 맥락 안..."
        $0.font = UIFont.GlogFont(size: 16, family: .Medium)
        $0.textColor = UIColor(red: 133/255, green: 136/255, blue: 141/255, alpha: 1)
        $0.numberOfLines = 2
    }
    
    let heartLabel = UILabel().then {
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "heartIcon.svg")
        imageAttachment.bounds = CGRect(x: 0, y: -1, width: 16, height: 12)
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: " 90.9M"))
        $0.font = UIFont.GlogFont(size: 14, family: .Medium)
        $0.textColor = UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
        $0.attributedText = attributedString
    }
    
    let viewLabel = UILabel().then {
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "viewIcon.svg")
        imageAttachment.bounds = CGRect(x: 1, y: -4, width: 16, height: 16)
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: " 90.9M"))
        $0.font = UIFont.GlogFont(size: 14, family: .Medium)
        $0.textColor = UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
        $0.attributedText = attributedString
    }
    
    lazy var viewPostButton = UIButton().then {
        let text = NSAttributedString(string: "💻 게시물's")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.GlogFont(size: 18, family: .ExtraBold)
        $0.setTitleColor(UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1.0), for: .normal)
        $0.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.6)
        $0.layer.cornerRadius = 10
    }
    
    lazy var searchTextField = UITextField().then {
        $0.backgroundColor = .textField
        $0.attributedPlaceholder = NSAttributedString(string: "찾고싶은 주제를 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 1, green: 1, blue: 1, alpha: 0.48)])
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.48)
        $0.font = UIFont.GlogFont(size: 16, family: .Medium)
        $0.addLeftImage(UIImage(systemName: "magnifyingglass")!, x: 13, y:7)
        $0.layer.cornerRadius = 10
    }
    
    lazy var dotSortButton = UIButton().then {
        $0.setImage(UIImage(named: "ham1.svg"), for: .normal)
    }
    
    lazy var lineSortButton = UIButton().then {
        $0.setImage(UIImage(named: "ham2.svg"), for: .normal)
    }
    
    lazy var oneSortButton = UIButton().then {
        $0.setImage(UIImage(named: "ham3.svg"), for: .normal)
    }
    
    override func addView() {
        [scrollView].forEach {
            view.addSubview($0)
        }
    }
    
    func addScrollView() {
        [mainLottie,mainText,writeButton,hotButton,hotImage,hotTextView,titleText,subtitleText
         ,heartLabel,viewLabel,viewPostButton,searchTextField,
         dotSortButton,lineSortButton,oneSortButton,postTableView].forEach {
            scrollView.addSubview($0)
        }
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setScrollViewLayout() {
        mainLottie.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top).offset(0)
            $0.trailing.equalToSuperview().inset(13)
            $0.height.equalTo(134)
            $0.width.equalTo(134)
        }
        mainText.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(12)
        }
        writeButton.snp.makeConstraints {
            $0.top.equalTo(mainText.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        hotButton.snp.makeConstraints {
            $0.top.equalTo(writeButton.snp.bottom).offset((bounds.height) / 11.72)
            $0.leading.equalToSuperview().offset(12)
            $0.height.equalTo(42)
            $0.width.equalTo(90)
        }
//        carouselCollectionView.snp.makeConstraints {
//            $0.center.equalToSuperview()
//            $0.width.equalTo(300)
//            $0.height.equalTo(300)
//        }
        hotImage.snp.makeConstraints {
            $0.top.equalTo(hotButton.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(12)
            $0.width.equalTo((bounds.width) / 1.2)
            $0.height.equalTo((bounds.height) / 2.56)
        }
        hotTextView.snp.makeConstraints {
            $0.top.equalTo(hotImage.snp.bottom).inset(47)
            $0.centerX.equalTo(hotImage.snp.centerX).offset(0)
            $0.leading.equalToSuperview().inset(12)
            $0.width.equalTo((bounds.width) / 1.2)
            $0.height.equalTo((bounds.height) / 5.82)
        }
        titleText.snp.makeConstraints {
            $0.top.equalTo(hotTextView.snp.top).offset(10)
            $0.leading.equalTo(hotTextView.snp.leading).offset(10)
        }
        subtitleText.snp.makeConstraints {
            $0.top.equalTo(titleText.snp.bottom).offset(4)
            $0.leading.equalTo(hotTextView.snp.leading).offset(10)
        }
        heartLabel.snp.makeConstraints {
            $0.top.equalTo(titleText.snp.bottom).offset((bounds.height) / 10.292)
            $0.leading.equalTo(hotTextView.snp.leading).offset(10)
        }
        viewLabel.snp.makeConstraints {
            $0.top.equalTo(titleText.snp.bottom).offset((bounds.height) / 10.292)
            $0.leading.equalTo(heartLabel.snp.trailing).offset(8)
        }
        viewPostButton.snp.makeConstraints {
            $0.top.equalTo(hotTextView.snp.bottom).offset((bounds.height) / 9.37)
            $0.leading.equalToSuperview().offset(12)
            $0.height.equalTo(42)
            $0.width.equalTo(109)
        }
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(viewPostButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo((bounds.height) / 19.18)
            $0.trailing.leading.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview()
        }
        dotSortButton.snp.makeConstraints {
            $0.centerY.equalTo(viewPostButton.snp.centerY).offset(0)
            $0.trailing.equalTo(scrollView.snp.trailing).inset((bounds.width) / 5.57)
            $0.height.equalTo(21)
            $0.width.equalTo(21)
        }
        lineSortButton.snp.makeConstraints {
            $0.centerY.equalTo(viewPostButton.snp.centerY).offset(0)
            $0.leading.equalTo(dotSortButton.snp.trailing).offset(8)
            $0.height.equalTo(21)
            $0.width.equalTo(21)
        }
        oneSortButton.snp.makeConstraints {
            $0.centerY.equalTo(viewPostButton.snp.centerY).offset(0)
            $0.leading.equalTo(lineSortButton.snp.trailing).offset(8)
            $0.height.equalTo(21)
            $0.width.equalTo(21)
        }
        postTableView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(searchTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
    }
        
}
    
//    extension MainViewController: UICollectionViewDataSource {
//        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return 4
//    }
//
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//            cell.backgroundColor = UIColor.blue
//            return cell
//        }
//    }
//
//    extension MainViewController: UICollectionViewDelegate {
//
//    }
