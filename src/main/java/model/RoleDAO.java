package model;

import entity.Role;
import java.util.ArrayList;
import java.util.List;

public class RoleDAO extends myDAO {

    public List<Role> findAll() {
        List<Role> t = new ArrayList<>();
        xSql = "SELECT *\n"
                + "  FROM [Role]";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Role role = new Role();
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
        for (Role object : new RoleDAO().findAll()) {
            System.out.println(object);
        }
    }
}
