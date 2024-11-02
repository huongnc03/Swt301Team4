package model;

import entity.Address;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AddressDAO extends myDAO {

    public void insertAddress(String addressLine, String city, String postalCode, String countryID) {
        int xCountryID = Integer.parseInt(countryID);
        xSql = "insert into address (addressline, city, postalcode,CountryID) values (?, ?, ?,?);";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, addressLine);
            ps.setString(2, city);
            ps.setString(3, postalCode);
            ps.setInt(4, xCountryID);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("insertAddress: " + e.getMessage());
        }
    }

    public int addNewAddress(String addressLine, String city, String postalCode, String countryID, int userId, String phone, String fullname) {
        int xCountryID = Integer.parseInt(countryID);
        xSql = "INSERT INTO address (addressline, city, postalcode, CountryID, phone, fullname) VALUES (?, ?, ?, ?, ?, ?);";
        int generatedKey = -1;
        try {
            ps = con.prepareStatement(xSql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, addressLine);
            ps.setString(2, city);
            ps.setString(3, postalCode);
            ps.setInt(4, xCountryID);
            ps.setString(5, phone);
            ps.setString(6, fullname);

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    generatedKey = rs.getInt(1);
                    String sqlUser = "INSERT INTO useraddress (AddressId, UserId) VALUES (?, ?);";
                    PreparedStatement st = con.prepareStatement(sqlUser);
                    st.setInt(1, generatedKey);
                    st.setInt(2, userId);
                    st.executeUpdate();
                }
                rs.close();
            }
            ps.close();
        } catch (Exception e) {
            System.out.println("insertAddress: " + e.getMessage());
        }
        return generatedKey;
    }

    public boolean editAddress(int addressId, String addressLine, String city, String postalCode, String countryID, String phone, String fullname) {
        int xCountryID = Integer.parseInt(countryID);
        String sql = "UPDATE address SET addressline = ?, city = ?, postalcode = ?, CountryID = ?, phone=?, fullname=? WHERE addressID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, addressLine);
            ps.setString(2, city);
            ps.setString(3, postalCode);
            ps.setInt(4, xCountryID);
            ps.setString(5, phone);
            ps.setString(6, fullname);
            ps.setInt(7, addressId);

            int rowsAffected = ps.executeUpdate();
            ps.close();

            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("editAddress: " + e.getMessage());
            return false;
        }
    }

    public List<Address> getUserAddresses(int userId) {
        List<Address> addresses = new ArrayList<>();
        String sql = "SELECT a.AddressID, a.AddressLine, a.City, a.PostalCode, a.CountryID, c.CountryName, a.phone, a.fullname "
                + "FROM address a "
                + "INNER JOIN useraddress ua ON a.AddressID = ua.AddressID "
                + "INNER JOIN country c ON a.CountryID = c.CountryID "
                + "WHERE ua.UserID = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int addressID = rs.getInt("AddressID");
                String addressLine = rs.getString("AddressLine");
                String city = rs.getString("City");
                int postalCode = rs.getInt("PostalCode");
                int countryID = rs.getInt("CountryID");
                String phone = rs.getString("phone");
                String fullname = rs.getString("fullname");
                Address address = new Address(addressID, addressLine, city, postalCode, countryID);
                address.setPhone(phone);
                address.setFullname(fullname);
                addresses.add(address);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println("Error retrieving addresses: " + e.getMessage());
        }

        return addresses;
    }

    public Address getAddress(String xAddressLine, String xCity, String xPostalCode, String xCountryID) {
        xSql = "SELECT * FROM address where addressline = ? and city like ? and postalcode = ? and CountryID = ?";

        Address a = null;
        int xAddressID;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, xAddressLine);
            ps.setString(2, xCity);
            ps.setString(3, xPostalCode);
            ps.setString(4, xCountryID);
            rs = ps.executeQuery();
            while (rs.next()) {
                xAddressID = rs.getInt("AddressID");
                a = new Address(xAddressID, xAddressLine, xCity, Integer.parseInt(xPostalCode), Integer.parseInt(xCountryID));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println("getLatestOrder: " + e.getMessage());
        }
        return a;
    }

    public Address getAddressById(int idAddress) {
        xSql = "SELECT * FROM address where AddressID = ?";

        Address a = null;
        int xAddressID;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, idAddress);
            rs = ps.executeQuery();
            while (rs.next()) {
                String addressLine = rs.getString("addressline");
                String xCity = rs.getString("city");
                String xPostalCode = rs.getString("postalcode");
                int xCountryID = rs.getInt("CountryID");
                xAddressID = rs.getInt("AddressID");
                String phone = rs.getString("phone");
                String fullname = rs.getString("fullname");
                a = new Address(xAddressID, addressLine, xCity, Integer.parseInt(xPostalCode), xCountryID);
                a.setPhone(phone);
                a.setFullname(fullname);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println("getLatestOrder: " + e.getMessage());
        }
        return a;
    }

    public void setAddressIDtoShopOrder() {
        xSql = "UPDATE shop_order SET AddressID = (SELECT MAX(AddressID) FROM address) WHERE shop_orderID = (  SELECT max_shop_orderID FROM (    SELECT MAX(shop_orderID) AS max_shop_orderID FROM shop_order) AS tmp);";
        try {
            ps = con.prepareStatement(xSql);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("setAddressIDtoShopOrder: " + e.getMessage());
        }
    }
}
