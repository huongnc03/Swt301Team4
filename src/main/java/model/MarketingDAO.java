package model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dto.*;

public class MarketingDAO extends myDAO {

    public List<ProductListDTO> getAllProducts() {
        List<ProductListDTO> products = new ArrayList<>();
        xSql = "SELECT v.VariationID, p.ProductName, c.CategoryName, p.Price, col.CollectionName, colr.color_Name, s.size_Name, img.thumbnail "
                + "FROM variation v "
                + "JOIN product p ON v.ProductID = p.ProductID "
                + "JOIN category c ON p.CategoryID = c.CategoryID "
                + "JOIN collection col ON p.CollectionID = col.CollectionID "
                + "JOIN color colr ON v.color_ID = colr.color_ID "
                + "JOIN size s ON v.size_ID = s.size_ID "
                + "JOIN product_img img ON v.product_img_ID = img.product_img_ID";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            while (rs.next()) {
                ProductListDTO product = new ProductListDTO();
                product.setVariationID(rs.getInt("VariationID"));
                product.setProductName(rs.getString("ProductName"));
                product.setCategoryName(rs.getString("CategoryName"));
                product.setPrice(rs.getFloat("Price"));
                product.setCollectionName(rs.getString("CollectionName"));
                product.setColorName(rs.getString("color_Name"));
                product.setSizeName(rs.getString("size_Name"));
                product.setThumbnail(rs.getString("thumbnail"));
                products.add(product);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public int getIdAddCurrent() {
        String sql = "SELECT @@IDENTITY AS LastInsertedId;";

        try {
            ps = connection.prepareStatement(sql.toString());
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Handle or log exception as needed
        }

        return 0; // Default return value if no count retrieved
    }

    public int createProduct(int categoryID, String productName, int collectionID, String description) throws SQLException {
        String sql = "INSERT INTO product (CategoryID, ProductName, CollectionID, description, Price) VALUES (?, ?, ?, ?, NULL)";
        ps = con.prepareStatement(sql);
        ps.setInt(1, categoryID);
        ps.setString(2, productName);
        ps.setInt(3, collectionID);
        ps.setString(4, description);
        ps.executeUpdate();

        return getIdAddCurrent();
    }

    public int createProductImage(String thumbnail) throws SQLException {
        String sql = "INSERT INTO product_img (thumbnail, product_img_1, product_img_2, product_img_3, product_img_name) VALUES (?, NULL, NULL, NULL, NULL)";
        ps = con.prepareStatement(sql);
        ps.setString(1, thumbnail);
        ps.executeUpdate();

        return getIdAddCurrent();

    }

    public void createVariation(int productID, int colorID, int sizeID, int productImgID) throws SQLException {
        String sql = "INSERT INTO variation (ProductID, color_ID, size_ID, qty_in_stock, product_img_ID) VALUES (?, ?, ?, NULL, ?)";
        ps = con.prepareStatement(sql);
        ps.setInt(1, productID);
        ps.setInt(2, colorID);
        ps.setInt(3, sizeID);
        ps.setInt(4, productImgID);
        ps.executeUpdate();
    }

    public List<CategoryDTO> getAllCategories() throws SQLException {
        List<CategoryDTO> categories = new ArrayList<>();
        String sql = "SELECT * FROM category";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            CategoryDTO category = new CategoryDTO();
            category.setCategoryID(rs.getInt("CategoryID"));
            category.setCategoryName(rs.getString("CategoryName"));
            categories.add(category);
        }

        return categories;
    }

    public List<CollectionDTO> getAllCollections() throws SQLException {
        List<CollectionDTO> collections = new ArrayList<>();
        String sql = "SELECT * FROM collection";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            CollectionDTO collection = new CollectionDTO();
            collection.setCollectionID(rs.getInt("CollectionID"));
            collection.setCollectionName(rs.getString("CollectionName"));
            collections.add(collection);
        }

        return collections;
    }

    public List<ColorDTO> getAllColors() throws SQLException {
        List<ColorDTO> colors = new ArrayList<>();
        String sql = "SELECT * FROM color";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            ColorDTO color = new ColorDTO();
            color.setColor_ID(rs.getInt("color_ID"));
            color.setColor_Name(rs.getString("color_Name"));
            colors.add(color);
        }

        return colors;
    }

    public List<SizeDTO> getAllSizes() throws SQLException {
        List<SizeDTO> sizes = new ArrayList<>();
        String sql = "SELECT * FROM size";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            SizeDTO size = new SizeDTO();
            size.setSize_ID(rs.getInt("size_ID"));
            size.setSize_Name(rs.getString("size_Name"));
            sizes.add(size);
        }

        return sizes;
    }

    public ProductListDTO getProductByVariationID(int variationID) throws SQLException {
        String sql = "SELECT v.VariationID, p.ProductName, c.CategoryName, p.Price, co.CollectionName, col.color_Name, s.size_Name, i.thumbnail, p.description "
                + "FROM variation v "
                + "JOIN product p ON v.ProductID = p.ProductID "
                + "JOIN category c ON p.CategoryID = c.CategoryID "
                + "JOIN collection co ON p.CollectionID = co.CollectionID "
                + "JOIN color col ON v.color_ID = col.color_ID "
                + "JOIN size s ON v.size_ID = s.size_ID "
                + "JOIN product_img i ON v.product_img_ID = i.product_img_ID "
                + "WHERE v.VariationID = ?";
        ProductListDTO product = null;
        ps = con.prepareStatement(sql);
        ps.setInt(1, variationID);
        rs = ps.executeQuery();
        if (rs.next()) {
            product = new ProductListDTO();
            product.setVariationID(rs.getInt("VariationID"));
            product.setProductName(rs.getString("ProductName"));
            product.setCategoryName(rs.getString("CategoryName"));
            product.setPrice(rs.getFloat("Price"));
            product.setCollectionName(rs.getString("CollectionName"));
            product.setColorName(rs.getString("color_Name"));
            product.setSizeName(rs.getString("size_Name"));
            product.setThumbnail(rs.getString("thumbnail"));
            product.setDescription(rs.getString("description")); // Thêm description
        }
        return product;
    }

    public void updateProduct(int variationID, int categoryID, String productName, int collectionID, String description, String thumbnail) throws SQLException {
        String sql = "UPDATE product SET CategoryID = ?, ProductName = ?, CollectionID = ?, description = ? "
                + "WHERE ProductID = (SELECT ProductID FROM variation WHERE VariationID = ?)";
        ps = con.prepareStatement(sql);
        ps.setInt(1, categoryID);
        ps.setString(2, productName);
        ps.setInt(3, collectionID);
        ps.setString(4, description);
        ps.setInt(5, variationID);
        ps.executeUpdate();

        sql = "UPDATE product_img SET thumbnail = ? "
                + "WHERE product_img_ID = (SELECT product_img_ID FROM variation WHERE VariationID = ?)";
        ps = con.prepareStatement(sql);
        ps.setString(1, thumbnail);
        ps.setInt(2, variationID);
        ps.executeUpdate();
    }

    public void updateVariation(int variationID, int colorID, int sizeID) throws SQLException {
        String sql = "UPDATE variation SET color_ID = ?, size_ID = ? WHERE VariationID = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, colorID);
        ps.setInt(2, sizeID);
        ps.setInt(3, variationID);
        ps.executeUpdate();
    }
    
       public List<ProductListDTO> getProductsByPage(int page, int pageSize) {
        List<ProductListDTO> products = new ArrayList<>();
        String sql = "SELECT v.VariationID, p.ProductName, c.CategoryName, p.Price, co.CollectionName, col.color_Name, s.size_Name, i.thumbnail, p.description " +
                     "FROM variation v " +
                     "JOIN product p ON v.ProductID = p.ProductID " +
                     "JOIN category c ON p.CategoryID = c.CategoryID " +
                     "JOIN collection co ON p.CollectionID = co.CollectionID " +
                     "JOIN color col ON v.color_ID = col.color_ID " +
                     "JOIN size s ON v.size_ID = s.size_ID " +
                     "JOIN product_img i ON v.product_img_ID = i.product_img_ID " +
                     "ORDER BY v.VariationID desc " +
                     "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, (page - 1) * pageSize);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductListDTO product = new ProductListDTO();
                product.setVariationID(rs.getInt("VariationID"));
                product.setProductName(rs.getString("ProductName"));
                product.setCategoryName(rs.getString("CategoryName"));
                product.setPrice(rs.getFloat("Price"));
                product.setCollectionName(rs.getString("CollectionName"));
                product.setColorName(rs.getString("color_Name"));
                product.setSizeName(rs.getString("size_Name"));
                product.setThumbnail(rs.getString("thumbnail"));
                product.setDescription(rs.getString("description"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public int getTotalProducts() {
        String sql = "SELECT COUNT(*) FROM variation";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
        MarketingDAO dao = new MarketingDAO();

        try {
            // Test getAllCategories
            List<CategoryDTO> categories = dao.getAllCategories();
            if (categories != null && !categories.isEmpty()) {
                System.out.println("Test getAllCategories passed: The category list is not null and not empty");
                for (CategoryDTO category : categories) {
                    System.out.println("CategoryID: " + category.getCategoryID());
                    System.out.println("CategoryName: " + category.getCategoryName());
                }
            } else {
                System.out.println("Test getAllCategories failed: The category list is either null or empty");
            }

            // Test getAllCollections
            List<CollectionDTO> collections = dao.getAllCollections();
            if (collections != null && !collections.isEmpty()) {
                System.out.println("Test getAllCollections passed: The collection list is not null and not empty");
                for (CollectionDTO collection : collections) {
                    System.out.println("CollectionID: " + collection.getCollectionID());
                    System.out.println("CollectionName: " + collection.getCollectionName());
                }
            } else {
                System.out.println("Test getAllCollections failed: The collection list is either null or empty");
            }

            // Test getAllColors
            List<ColorDTO> colors = dao.getAllColors();
            if (colors != null && !colors.isEmpty()) {
                System.out.println("Test getAllColors passed: The color list is not null and not empty");
                for (ColorDTO color : colors) {
                    System.out.println("ColorID: " + color.getColor_ID());
                    System.out.println("ColorName: " + color.getColor_Name());
                }
            } else {
                System.out.println("Test getAllColors failed: The color list is either null or empty");
            }

            // Test getAllSizes
            List<SizeDTO> sizes = dao.getAllSizes();
            if (sizes != null && !sizes.isEmpty()) {
                System.out.println("Test getAllSizes passed: The size list is not null and not empty");
                for (SizeDTO size : sizes) {
                    System.out.println("SizeID: " + size.getSize_ID());
                    System.out.println("SizeName: " + size.getSize_Name());
                }
            } else {
                System.out.println("Test getAllSizes failed: The size list is either null or empty");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
