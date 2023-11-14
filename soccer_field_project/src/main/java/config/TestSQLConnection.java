package config;

import java.sql.Connection;
import java.sql.SQLException;

public class TestSQLConnection {
    public static void main(String[] args) {
        // Lấy kết nối từ lớp SQLServerConfig
        Connection connection = SQLServerConfig.getConnection();

        if (connection != null) {
            System.out.println("Kết nối đến cơ sở dữ liệu thành công.");
            try {
                // Đóng kết nối sau khi sử dụng
                connection.close();
                System.out.println("Kết nối đã được đóng.");
            } catch (SQLException e) {
                System.out.println("Lỗi khi đóng kết nối: " + e.getLocalizedMessage());
            }
        } else {
            System.out.println("Không thể kết nối đến cơ sở dữ liệu.");
        }
    }
}
