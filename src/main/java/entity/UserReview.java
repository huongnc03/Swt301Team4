/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author HP
 */
public class UserReview {

    private int userReviewID;
    private int userID;
    private int ratingValue;
    private int orderDetailID;
    private String comment;

    public UserReview() {
    }

    public UserReview(int userReviewID, int userID, int ratingValue, int orderDetailID, String comment) {
        this.userReviewID = userReviewID;
        this.userID = userID;
        this.ratingValue = ratingValue;
        this.orderDetailID = orderDetailID;
        this.comment = comment;
    }

    public int getUserReviewID() {
        return userReviewID;
    }

    public void setUserReviewID(int userReviewID) {
        this.userReviewID = userReviewID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRatingValue() {
        return ratingValue;
    }

    public void setRatingValue(int ratingValue) {
        this.ratingValue = ratingValue;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
}
