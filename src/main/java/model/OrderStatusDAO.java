package model;

import entity.OrderStatus;
import java.util.ArrayList;
import java.util.List;

public class OrderStatusDAO extends myDAO{
    
    public List<OrderStatus> findAll() {
        List<OrderStatus> t = new ArrayList<>();
        xSql = "SELECT *\n"
                + "  FROM [Order_Status]";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            while (rs.next()) {
                OrderStatus role = new OrderStatus();
                role.setId(rs.getInt("id"));
                role.setName(rs.getString("name"));
                t.add(role);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }
    
    public static void main(String[] args) {
        for (OrderStatus object : new OrderStatusDAO().findAll()) {
            System.out.println(object);
        }
    }
}
