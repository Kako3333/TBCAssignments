//
//  MovieCollectionView.swift
//  IMDB Info
//
//  Created by Nika Topuria on 26.10.21.
//

import UIKit
import SkeletonView

//ცცვლილებები
//1)MovieCollectionView სიმაღლე ჰქონდა 0 და მოვაშორეტ კონტრეინტი.
//2)გავუწერეთ სიმაღლე MovieCollectionView-ს რათა ცელებს შორის გაპი აღარ ყოფილიყო
//3)FeatureCell-ის ფაილში 24 ხაზზე იყო genr და ამიტომ შევუცვალე genreList-ის ფროფერთის სახელი.
//4)იყო რამდენიმე typo რეგისტრაციაში და reuseIdentifier-ში როგორც მახსოვს მაგრამ ზუსტად არ მახსოვს რა იყო.
//5)Genre ფაილში Genre-ის ფროფერთი Id იყო Boolean და შევცვალე Int-ით.
//6)MovieManager-ში fetchMovieList ფუნქციაში სესიას არ ეწერა resume, და დავუწერე.
//7)FeaturedCell-ში Line58 round(movie.score * 10)/10).
//8)FeatureCell Line59-60 მივანიჭე ფერები.
// უფრო მეტი დეტალი მაქვს შეცვლილი მაგრამ არ მახსოვს დეტალურად იდენტიფიერებში რა აკლდა და რა დავამატე :( ძირითადად typo

final class MovieCollectionView: UITableViewCell {
    
    @IBOutlet private weak var movieCollectionView: UICollectionView!
    var movies = [Movie]()
    var delegate: MovieCollectionViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        movieCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollectionView.showAnimatedGradientSkeleton()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.movieCollectionView.stopSkeletonAnimation()
            self.movieCollectionView.hideSkeleton()
            self.movieCollectionView.reloadData()
        })
    }
}

extension MovieCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "DetailsView", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailsView") as! DetailsView
        let _ = vc.view
        vc.makeView(movies[indexPath.row])
        delegate?.openSelection(this: vc)
    }
}

extension MovieCollectionView: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        "MovieCollectionViewCell"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.makeView(movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 170)
    }
}

protocol MovieCollectionViewDelegate {
    func openSelection(this vc: UIViewController)
}
