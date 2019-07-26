//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by Park Jae Han on 23/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var page = 1
    
    // 프로퍼티 초기화 & 테이블뷰를 구성할 리스트데이터
    lazy var list: [MovieVO] = {        // lazy로 마지막에 초기화
        var datalist = [MovieVO]()
        return datalist
    }()


    @IBOutlet var moreBtn: UIButton!
    
    @IBAction func more(_ sender: Any) {
        
        self.page += 1
        self.callMovieAPI()
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        
        self.callMovieAPI()
    }
    
    
    func callMovieAPI() {
    
        // 1.API호출위한 URI생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
        let apiURI: URL! = URL(string: url)
        
        // 2.REST API호출
        let apidata = try! Data(contentsOf: apiURI)
        
        // 3.데이터 전송 결과를 log출력(선택사항)
        //let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "" // A ?? B, 만약 A가 nil이 아니라면 옵셔널 해제, nil이라면 B사용
        //NSLog("API Result=\( log )")
        
        // 4.JSON객체를 파싱하여 NSDictionary객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 5. 데이터구조에 따라 차례대로 캐스팅하며 읽어옴
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            //6. Iterator(순회)처리를 하며 API데이터를 MovieVO객체에 저장
            for row in movie {
                let r = row as! NSDictionary
                
                let mvo = MovieVO()
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = (r["ratingAverage"] as! NSString).doubleValue
                
                /* 동기식 처리
                // 이미지를 로드해 UIImage객체 생성
                let url: URL! = URL(string: mvo.thumbnail!)
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                */
                self.list.append(mvo)
            }
            
            // 테이블 다 읽었을때 더보기 버튼 숨기기
            let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
            if self.list.count >= totalCount {
                self.moreBtn.isHidden = true
            }
        }
        catch {
            NSLog("Parse Error")
        }
    }
    
    
    func getThumbnailImage(_ index:Int) -> UIImage {
        
        let mvo = self.list[index]
        
        // 메모이제이션
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            
            return mvo.thumbnailImage!
        }
    }

    
    
    //MARK:- TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        NSLog("CALLED RAW:\(indexPath.row), TITLE:\(row.title!)")
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        // 비동기로 섬네일이미지를 읽어옴
        DispatchQueue.main.async(execute: {
            NSLog("비동기 실행")
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        })
        
        NSLog("메소드 종료, 셀리턴")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row is \(indexPath.row)")
    }
    
    
}

//MARK:- 화면 전환시 값을 넘겨주기 위한 세그웨이 관련 처리
extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue_detail" {
            let path = self.tableView.indexPath(for: sender as! MovieCell)
            let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = self.list[path!.row]
        }
        
        /* //위의 비축약구문
        if segue.identifier == "segue_detail" {
            let cell = sender as! MovieCell
            let path = self.tableView.indexPath(for: cell)
            let movieInfo = self.list[path!.row]
            let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = movieInfo
        } */
    }
}
