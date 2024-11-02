package model;

import entity.Product;
import entity.Variation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends myDAO {

    public List<Product> getProductsByCID(String cid) {
        List<Product> t = new ArrayList<>();
        xSql = "SELECT DISTINCT v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, p.ProductName, p.Price, col.color_Name, (p.Price-(p.Price*pro.DiscountRate/100)) AS DiscountPrice\n"
                + "FROM variation v\n"
                + "JOIN product_img pi ON v.product_img_ID = pi.product_img_ID\n"
                + "JOIN product p ON p.ProductID = v.ProductID\n"
                + "JOIN category c ON c.CategoryID = p.CategoryID\n"
                + "JOIN color col ON v.color_ID = col.color_ID\n"
                + "JOIN size s ON v.size_ID = s.size_ID\n"
                + "JOIN collection collec ON p.CollectionID = collec.CollectionID\n"
                + "JOIN promotion pro ON collec.PromotionID = pro.PromotionID\n"
                + "WHERE c.CategoryID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            int xProductID;
            String xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName;
            int xCollectionID;
            String xProductName, xColor_Name, xSize_Name;
            double xPrice, xDiscountPrice;
            int xQty_in_stock;
            Product x;
            while (rs.next()) {
                xProductID = rs.getInt("ProductID");
                xThumbnail = rs.getString("thumbnail");
                xProduct_img_1 = rs.getString("product_img_1");
                xProduct_img_2 = rs.getString("product_img_2");
                xProduct_img_3 = rs.getString("product_img_3");
                xCategoryName = null;
                xCollectionID = 0;
                xProductName = rs.getString("ProductName");
                xColor_Name = rs.getString("color_Name");
                xSize_Name = null;
                xPrice = rs.getDouble("Price");
                xQty_in_stock = 0;
                xDiscountPrice = rs.getDouble("DiscountPrice");
                x = new Product(xProductID, xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName, xCollectionID, xProductName, xColor_Name, xSize_Name, xPrice, xQty_in_stock, xDiscountPrice);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Product> getProductsByCollectIDCateID(String cid, String collectID) {
        List<Product> t = new ArrayList<>();
        xSql = "SELECT DISTINCT v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, p.ProductName, p.Price, col.color_Name, \n"
                + "       (p.Price - (p.Price * pro.DiscountRate / 100)) AS DiscountPrice\n"
                + "FROM variation v\n"
                + "INNER JOIN product_img pi ON v.product_img_ID = pi.product_img_ID\n"
                + "INNER JOIN product p ON p.ProductID = v.ProductID\n"
                + "INNER JOIN category c ON c.CategoryID = p.CategoryID\n"
                + "INNER JOIN color col ON v.color_ID = col.color_ID\n"
                + "INNER JOIN size s ON v.size_ID = s.size_ID\n"
                + "INNER JOIN collection collec ON p.CollectionID = collec.CollectionID\n"
                + "INNER JOIN promotion pro ON collec.PromotionID = pro.PromotionID\n"
                + "WHERE p.CollectionID = ? AND c.CategoryID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, collectID);
            ps.setString(2, cid);
            rs = ps.executeQuery();
            int xProductID;
            String xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName;
            int xCollectionID;
            String xProductName, xColor_Name, xSize_Name;
            double xPrice, xDiscountPrice;
            int xQty_in_stock;
            Product x;
            while (rs.next()) {
                xProductID = rs.getInt("ProductID");
                xThumbnail = rs.getString("thumbnail");
                xProduct_img_1 = rs.getString("product_img_1");
                xProduct_img_2 = rs.getString("product_img_2");
                xProduct_img_3 = rs.getString("product_img_3");
                xCategoryName = null;
                xCollectionID = 0;
                xProductName = rs.getString("ProductName");
                xColor_Name = rs.getString("color_Name");
                xSize_Name = null;
                xPrice = rs.getDouble("Price");
                xQty_in_stock = 0;
                xDiscountPrice = rs.getDouble("DiscountPrice");
                x = new Product(xProductID, xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName, xCollectionID, xProductName, xColor_Name, xSize_Name, xPrice, xQty_in_stock, xDiscountPrice);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Product> getProductsByColIDCateID(String cateID, String colID) {
        List<Product> t = new ArrayList<>();
        xSql = "SELECT DISTINCT v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, p.ProductName, p.Price, col.color_Name, \n"
                + "                (p.Price - (p.Price * pro.DiscountRate / 100)) AS DiscountPrice\n"
                + "FROM variation v\n"
                + "JOIN product p ON p.ProductID = v.ProductID\n"
                + "JOIN product_img pi ON v.product_img_ID = pi.product_img_ID\n"
                + "JOIN color col ON v.color_ID = col.color_ID\n"
                + "JOIN size s ON v.size_ID = s.size_ID\n"
                + "JOIN category c ON c.CategoryID = p.CategoryID\n"
                + "JOIN collection collec ON p.CollectionID = collec.CollectionID\n"
                + "JOIN promotion pro ON collec.PromotionID = pro.PromotionID\n"
                + "WHERE col.color_ID = ? AND c.CategoryID = ?;";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, colID);
            ps.setString(2, cateID);
            rs = ps.executeQuery();
            int xProductID;
            String xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName;
            int xCollectionID;
            String xProductName, xColor_Name, xSize_Name;
            double xPrice, xDiscountPrice;
            int xQty_in_stock;
            Product x;
            while (rs.next()) {
                xProductID = rs.getInt("ProductID");
                xThumbnail = rs.getString("thumbnail");
                xProduct_img_1 = rs.getString("product_img_1");
                xProduct_img_2 = rs.getString("product_img_2");
                xProduct_img_3 = rs.getString("product_img_3");
                xCategoryName = null;
                xCollectionID = 0;
                xProductName = rs.getString("ProductName");
                xColor_Name = rs.getString("color_Name");
                xSize_Name = null;
                xPrice = rs.getDouble("Price");
                xQty_in_stock = 0;
                xDiscountPrice = rs.getDouble("DiscountPrice");
                x = new Product(xProductID, xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName, xCollectionID, xProductName, xColor_Name, xSize_Name, xPrice, xQty_in_stock, xDiscountPrice);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Product> getProductsByColIDCollectID(String cateID, String colID, String collectID) {
        List<Product> t = new ArrayList<>();
        xSql = "SELECT DISTINCT v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, p.ProductName, p.Price, col.color_Name, \n"
                + "                (p.Price - (p.Price * pro.DiscountRate / 100)) AS DiscountPrice\n"
                + "FROM variation v\n"
                + "JOIN product p ON p.ProductID = v.ProductID\n"
                + "JOIN product_img pi ON v.product_img_ID = pi.product_img_ID\n"
                + "JOIN color col ON v.color_ID = col.color_ID\n"
                + "JOIN size s ON v.size_ID = s.size_ID\n"
                + "JOIN category c ON c.CategoryID = p.CategoryID\n"
                + "JOIN collection collec ON p.CollectionID = collec.CollectionID\n"
                + "JOIN promotion pro ON collec.PromotionID = pro.PromotionID\n"
                + "WHERE col.color_ID = ? AND c.CategoryID = ? AND p.CollectionID = ?;";
        try {
            ps = con.prepareStatement(xSql);
            ps.setObject(1, colID);
            ps.setObject(2, cateID);
            ps.setObject(3, collectID);
            rs = ps.executeQuery();
            int xProductID;
            String xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName;
            int xCollectionID;
            String xProductName, xColor_Name, xSize_Name;
            double xPrice, xDiscountPrice;
            int xQty_in_stock;
            Product x;
            while (rs.next()) {
                xProductID = rs.getInt("ProductID");
                xThumbnail = rs.getString("thumbnail");
                xProduct_img_1 = rs.getString("product_img_1");
                xProduct_img_2 = rs.getString("product_img_2");
                xProduct_img_3 = rs.getString("product_img_3");
                xCategoryName = null;
                xCollectionID = 0;
                xProductName = rs.getString("ProductName");
                xColor_Name = rs.getString("color_Name");
                xSize_Name = null;
                xPrice = rs.getDouble("Price");
                xQty_in_stock = 0;
                xDiscountPrice = rs.getDouble("DiscountPrice");
                x = new Product(xProductID, xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName, xCollectionID, xProductName, xColor_Name, xSize_Name, xPrice, xQty_in_stock, xDiscountPrice);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public Product getProductByID(String productId) {
        int id = Integer.parseInt(productId);
        String sql = "SELECT DISTINCT s.size_Name, v.VariationID, v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, "
                + "p.ProductName, p.Price, col.color_Name, (p.Price - (p.Price * pro.DiscountRate / 100)) AS 'DiscountPrice' "
                + "FROM variation v "
                + "JOIN product_img pi ON v.product_img_ID = pi.product_img_ID "
                + "JOIN product p ON p.ProductID = v.ProductID "
                + "JOIN color col ON v.color_ID = col.color_ID "
                + "JOIN size s ON v.size_ID = s.size_ID "
                + "JOIN collection collec ON p.CollectionID = collec.CollectionID "
                + "JOIN promotion pro ON collec.PromotionID = pro.PromotionID "
                + "WHERE p.ProductID = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String thumbnail = rs.getString("thumbnail");
                String productImg1 = rs.getString("product_img_1");
                String productImg2 = rs.getString("product_img_2");
                String productImg3 = rs.getString("product_img_3");
                String productName = rs.getString("ProductName");
                String colorName = rs.getString("color_Name");
                String sizeName = rs.getString("size_name");
                double price = rs.getDouble("Price");
                double discountPrice = rs.getDouble("DiscountPrice");
                int variationID = rs.getInt("VariationID");

                Product product = new Product(
                        id,
                        thumbnail,
                        productImg1,
                        productImg2,
                        productImg3,
                        null,
                        0,
                        productName,
                        colorName,
                        sizeName,
                        price,
                        0,
                        variationID,
                        discountPrice
                );
                return product;
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public Product getProductByProIDColName(String xId, String xColor_Name) {
        int i = Integer.parseInt(xId);
        xSql = "select DISTINCT s.size_Name, v.VariationID, v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, p.ProductName, p.Price, col.color_Name, (p.Price-(p.Price*pro.DiscountRate/100)) 'DiscountPrice'\n" + "from variation v, product_img pi, product p , category c, color col, size s, promotion pro, collection collec\n" + "where col.color_Name like '%" + xColor_Name + "%'\n" + "and p.ProductID = ?\n" + "and p.ProductID = v.ProductID \n" + "and v.product_img_ID = pi.product_img_ID\n" + "and p.CollectionID = collec.CollectionID\n" + "and collec.PromotionID = pro.PromotionID\n" + "and v.color_ID = col.color_ID\n" + "and v.size_ID = s.size_ID;";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, i);
            rs = ps.executeQuery();
            String xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName;
            int xCollectionID;
            String xProductName, xSize_Name;
            double xPrice, xDiscountPrice;
            int xQty_in_stock;
            int xVariationID;
            Product x = null;
            while (rs.next()) {
                i = rs.getInt("ProductID");
                xThumbnail = rs.getString("thumbnail");
                xProduct_img_1 = rs.getString("product_img_1");
                xProduct_img_2 = rs.getString("product_img_2");
                xProduct_img_3 = rs.getString("product_img_3");
                xCategoryName = null;
                xCollectionID = 0;
                xProductName = rs.getString("ProductName");
                xColor_Name = rs.getString("color_Name");
                xSize_Name = rs.getString("size_name");
                xPrice = rs.getDouble("Price");
                xQty_in_stock = 0;
                xVariationID = rs.getInt("VariationID");
                xDiscountPrice = rs.getDouble("DiscountPrice");
                x = new Product(i, xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName, xCollectionID, xProductName, xColor_Name, xSize_Name, xPrice, xQty_in_stock, xVariationID, xDiscountPrice);
                return x;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Product getProductByProIDColNameSizName(String xId, String xColor_Name, String xSize_Name) {
        int i = Integer.parseInt(xId);
        xSql = "select DISTINCT s.size_Name, v.VariationID, v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, p.ProductName, p.Price, col.color_Name\n" + "from variation v, product_img pi, product p , category c, color col, size s\n" + "where size_Name like '%" + xSize_Name + "%' and col.color_Name like '%" + xColor_Name + "%'\n" + "and p.ProductID = ?\n" + "and p.ProductID = v.ProductID \n" + "and v.product_img_ID = pi.product_img_ID\n" + "and v.color_ID = col.color_ID\n" + "and v.size_ID = s.size_ID;";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, i);
            rs = ps.executeQuery();
            int xProductID;
            String xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName;
            int xCollectionID;
            String xProductName;
            double xPrice;
            int xQty_in_stock;
            int xVariationID;
            Product x = null;
            while (rs.next()) {
                i = rs.getInt("ProductID");
                xThumbnail = rs.getString("thumbnail");
                xProduct_img_1 = rs.getString("product_img_1");
                xProduct_img_2 = rs.getString("product_img_2");
                xProduct_img_3 = rs.getString("product_img_3");
                xCategoryName = null;
                xCollectionID = 0;
                xProductName = rs.getString("ProductName");
                xColor_Name = rs.getString("color_Name");
                xSize_Name = rs.getString("size_name");
                xPrice = rs.getDouble("Price");
                xQty_in_stock = 0;
                xVariationID = rs.getInt("VariationID");
                x = new Product(i, xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName, xCollectionID, xProductName, xColor_Name, xSize_Name, xPrice, xQty_in_stock, xVariationID);
                return x;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void reduceQuantityOfProduct(String proID, String variID, int quantity) {
        int xProID = Integer.parseInt(proID);
        int xVariID = Integer.parseInt(variID);
        xSql = "update variation set qty_in_stock = variation.qty_in_stock - ? where ProductID = ? and variationID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, xProID);
            ps.setInt(2, xVariID);
            ps.setInt(3, quantity);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("minusQuantity: " + e.getMessage());
        }
    }

    public void increaseQuantityOfProduct(String proID, String variID, int quantity) {
        int xProID = Integer.parseInt(proID);
        int xVariID = Integer.parseInt(variID);
        xSql = "update variation set qty_in_stock = qty_in_stock + ? where ProductID = ? and variationID = ?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, quantity);
            ps.setInt(2, xProID);
            ps.setInt(3, xVariID);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("increaseQuantityOfProduct: " + e.getMessage());
        }
    }

    public List<Product> getAllProducts(String input, int task) {
        List<Product> t = new ArrayList<>();
        if (task == 1) {
            switch (input) {
                case "all":
                    xSql = "select DISTINCT v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, c.CategoryName, p.CollectionID, p.ProductName, col.color_Name, s.size_Name, p.Price, v.qty_in_stock\n" + "from variation v, product_img pi, product p , category c, color col, size s\n" + "where p.ProductID = v.ProductID \n" + "and p.CategoryID = c.CategoryID\n" + "and v.product_img_ID = pi.product_img_ID\n" + "and v.color_ID = col.color_ID\n" + "and v.size_ID = s.size_ID";
                    break;
                case "up":
                    xSql = "select DISTINCT v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, c.CategoryName, p.CollectionID, p.ProductName, col.color_Name, s.size_Name, p.Price, v.qty_in_stock\n" + "from variation v, product_img pi, product p , category c, color col, size s\n" + "where p.ProductID = v.ProductID \n" + "and p.CategoryID = c.CategoryID\n" + "and v.product_img_ID = pi.product_img_ID\n" + "and v.color_ID = col.color_ID\n" + "and v.size_ID = s.size_ID\n" + "order by p.Price ";
                    break;
                case "down":
                    xSql = "select DISTINCT v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, c.CategoryName, p.CollectionID, p.ProductName, col.color_Name, s.size_Name, p.Price, v.qty_in_stock\n" + "from variation v, product_img pi, product p , category c, color col, size s\n" + "where p.ProductID = v.ProductID \n" + "and p.CategoryID = c.CategoryID\n" + "and v.product_img_ID = pi.product_img_ID\n" + "and v.color_ID = col.color_ID\n" + "and v.size_ID = s.size_ID\n" + "order by p.Price desc ";
                    break;
                case "inventory":
                    xSql = "select DISTINCT v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, c.CategoryName, p.CollectionID, p.ProductName, col.color_Name, s.size_Name, p.Price, v.qty_in_stock\n"
                            + "from variation v, product_img pi, product p , category c, color col, size s\n"
                            + "where p.ProductID = v.ProductID \n"
                            + "and p.CategoryID = c.CategoryID\n"
                            + "and v.product_img_ID = pi.product_img_ID\n"
                            + "and v.color_ID = col.color_ID\n"
                            + "and v.size_ID = s.size_ID\n"
                            + "order by v.qty_in_stock desc";
                    break;
                default:
                    int cId = Integer.parseInt(input);
                    xSql = "select DISTINCT v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, c.CategoryName, p.CollectionID, p.ProductName, col.color_Name, s.size_Name, p.Price, v.qty_in_stock\n" + "from variation v, product_img pi, product p , category c, color col, size s\n" + "where c.CategoryID = " + cId + " \n" + "and p.ProductID = v.ProductID \n" + "and p.CategoryID = c.CategoryID\n" + "and v.product_img_ID = pi.product_img_ID\n" + "and v.color_ID = col.color_ID\n" + "and v.size_ID = s.size_ID";
                    break;
            }
        } else if (task == 2) {
            xSql = "select DISTINCT v.ProductID, pi.thumbnail, pi.product_img_1, pi.product_img_2, pi.product_img_3, c.CategoryName, p.CollectionID, p.ProductName, col.color_Name, s.size_Name, p.Price, v.qty_in_stock\n" + "from variation v, product_img pi, product p , category c, color col, size s\n" + "where p.ProductName like '%" + input + "%'\n" + "and p.ProductID = v.ProductID \n" + "and p.CategoryID = c.CategoryID\n" + "and v.product_img_ID = pi.product_img_ID\n" + "and v.color_ID = col.color_ID\n" + "and v.size_ID = s.size_ID";
        }

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            int xProductID;
            String xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName;
            int xCollectionID;
            String xProductName, xColor_Name, xSize_Name;
            double xPrice;
            int xQty_in_stock;
            Product x;
            while (rs.next()) {
                xProductID = rs.getInt("ProductID");
                xThumbnail = rs.getString("thumbnail");
                xProduct_img_1 = rs.getString("product_img_1");
                xProduct_img_2 = rs.getString("product_img_2");
                xProduct_img_3 = rs.getString("product_img_3");
                xCategoryName = rs.getString("CategoryName");
                xCollectionID = rs.getInt("CollectionID");
                xProductName = rs.getString("ProductName");
                xColor_Name = rs.getString("color_Name");
                xSize_Name = rs.getString("size_Name");
                xPrice = rs.getDouble("Price");
                xQty_in_stock = rs.getInt("qty_in_stock");
                x = new Product(xProductID, xThumbnail, xProduct_img_1, xProduct_img_2, xProduct_img_3, xCategoryName, xCollectionID, xProductName, xColor_Name, xSize_Name, xPrice, xQty_in_stock);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

//     private static final String INSERT_PRODUCT_SQL = "INSERT INTO product (categoryID, collectionID, productName, price, description, thumbnail) VALUES (?, ?, ?, ?, ?, ?)";
//    private static final String INSERT_PRODUCT_COLOR_SQL = "INSERT INTO product_color (productID, colorID) VALUES (?, ?)";
//    private static final String INSERT_PRODUCT_SIZE_SQL = "INSERT INTO product_size (productID, sizeID) VALUES (?, ?)";
//    private static final String INSERT_PRODUCT_IMAGE_SQL = "INSERT INTO product_img (productID, imageName) VALUES (?, ?)";
//
//    public void insertProduct(Product product) throws SQLException {
//        try (Connection connection = DatabaseConnection.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
//            
//            preparedStatement.setInt(1, product.getCategoryId());
//            preparedStatement.setInt(2, product.getCollectionId());
//            preparedStatement.setString(3, product.getProductName());
//            preparedStatement.setDouble(4, product.getPrice());
//            preparedStatement.setString(5, product.getDescription());
//            preparedStatement.setString(6, product.getThumbnail());
//
//            int affectedRows = preparedStatement.executeUpdate();
//            if (affectedRows == 0) {
//                throw new SQLException("Creating product failed, no rows affected.");
//            }
//
//            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
//                if (generatedKeys.next()) {
//                    long productId = generatedKeys.getLong(1);
//                    insertProductColors(productId, product.getColorIds());
//                    insertProductSizes(productId, product.getSizeIds());
//                    insertProductImages(productId, product.getAdditionalImages());
//                } else {
//                    throw new SQLException("Creating product failed, no ID obtained.");
//                }
//            }
//        }
//    }
//
//    private void insertProductColors(long productId, String[] colorIds) {
//        try  {
//            Connection connection = con;
//            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_COLOR_SQL);
//            for (String colorId : colorIds) {
//                preparedStatement.setLong(1, productId);
//                preparedStatement.setInt(2, Integer.parseInt(colorId));
//                preparedStatement.addBatch();
//            }
//            preparedStatement.executeBatch();
//        }catch(Exception e) {
//            System.out.println("Color: " + e);
//        }
//    }
//
//    private void insertProductSizes(long productId, String[] sizeIds) {
//        try  {
//            Connection connection = con;
//            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SIZE_SQL);
//            for (String sizeId : sizeIds) {
//                preparedStatement.setLong(1, productId);
//                preparedStatement.setInt(2, Integer.parseInt(sizeId));
//                preparedStatement.addBatch();
//            }
//            preparedStatement.executeBatch();
//        }catch(Exception e) {
//            System.out.println("Insert product: " + e);
//        }
//    }
//
//    private void insertProductImages(long productId, String[] additionalImages) {
//        try {
//            Connection connection = con;
//            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_IMAGE_SQL);
//            for (String imageName : additionalImages) {
//                preparedStatement.setLong(1, productId);
//                preparedStatement.setString(2, imageName);
//                preparedStatement.addBatch();
//            }
//            preparedStatement.executeBatch();
//        }catch(Exception e) {
//            System.out.println("Image fail: " + e);
//        }
//    }
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO product (categoryID, collectionID, productName, price, description) VALUES (?, ?, ?, ?, ?)";
    private static final String INSERT_VARIATION_SQL = "INSERT INTO variation (productID, color_ID, size_ID, qty_in_stock, product_img_ID) VALUES (?, ?, ?, ?, ?)";

    public void insertProduct(Product product) {
        try {
            Connection connection = con;
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, product.getCategoryId());
            preparedStatement.setInt(2, product.getCollectionID());
            preparedStatement.setString(3, product.getProductName());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, product.getDescription());

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows == 0) {
                throw new Exception("Creating product failed, no rows affected.");
            }

            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    long productId = generatedKeys.getLong(1);
                    int id = this.addProductImage(product.getThumbnail(), product.getAdditionalImages());
                    insertVariations(productId, product.getVariations(), id);
                } else {
                    throw new Exception("Creating product failed, no ID obtained.");
                }
            }
        } catch (Exception e) {
            System.out.println("Insert product: " + e);
        }
    }

    private void insertVariations(long productId, List<Variation> variations, int idImage) {
        try {
            Connection connection = con;
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_VARIATION_SQL);
            for (Variation variation : variations) {
                preparedStatement.setLong(1, productId);
                preparedStatement.setInt(2, variation.getColor_ID());
                preparedStatement.setInt(3, variation.getSize_ID());
                preparedStatement.setInt(4, variation.getQtu_in_stock());
                preparedStatement.setInt(5, idImage);
                preparedStatement.addBatch();
            }
            preparedStatement.executeBatch();
        } catch (Exception e) {
            System.out.println("Insert varion:" + e);
        }
    }

    public int addProductImage(String thumbnail, List<String> additionalImages) {
        String sql = "INSERT INTO product_img (thumbnail, product_img_1) "
                + "VALUES (?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            int index = 1;
            statement.setString(index++, thumbnail);
            statement.setString(index++, additionalImages.get(0));
//            if (additionalImages != null) {
//                for (int i = 0; i < additionalImages.size() && i < 3; i++) {
//                    
//                }
//            }

            int rowsAffected = statement.executeUpdate();

            if (rowsAffected == 0) {
                throw new Exception("Creating product image failed, no rows affected.");
            }

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new Exception("Creating product image failed, no ID obtained.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

}
