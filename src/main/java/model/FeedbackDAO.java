package model;

import entity.UserReview;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FeedbackDAO extends myDAO {

    public boolean insertUserReview(UserReview userReview) {
        String sql = "INSERT INTO userreview (UserID, rating_value, OrderDetailID, comment) VALUES (?, ?, ?, ?)";
        boolean rowInserted = false;
        try {
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, userReview.getUserID());
            statement.setInt(2, userReview.getRatingValue());
            statement.setInt(3, userReview.getOrderDetailID());
            statement.setString(4, userReview.getComment());
            rowInserted = statement.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Insert: " + e);
        }
        return rowInserted;
    }

    public UserReview getUserReviewsByOrderDetail(int orderDetailID) {
        String sql = "SELECT ur.UserReviewID, ur.UserID, ur.rating_value, ur.OrderDetailID, ur.comment "
                + "FROM userreview ur "
                + "JOIN orderdetails od ON ur.OrderDetailID = od.OrderDetailID "
                + "WHERE ur.OrderDetailID = ?";
        try {
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, orderDetailID);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int userReviewID = resultSet.getInt("UserReviewID");
                int userID = resultSet.getInt("UserID");
                int ratingValue = resultSet.getInt("rating_value");
                int retrievedOrderDetailID = resultSet.getInt("OrderDetailID");
                String comment = resultSet.getString("comment");

                UserReview userReview = new UserReview();
                userReview.setUserReviewID(userReviewID);
                userReview.setUserID(userID);
                userReview.setRatingValue(ratingValue);
                userReview.setOrderDetailID(retrievedOrderDetailID);
                userReview.setComment(comment);

                return userReview;
            }
        }catch(Exception e) {
            System.out.println("Get user review: " + e);
        }
        return null;
    }
}
