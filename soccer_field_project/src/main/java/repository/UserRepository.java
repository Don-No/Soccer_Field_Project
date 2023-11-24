package repository;

import java.sql.Statement;
import java.sql.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import config.SQLServerConfig;
import entity.Pitch;
import entity.PitchType;
import entity.Product;
import entity.ProductData;
import entity.UserEntity;

public class UserRepository {
	Connection connection = SQLServerConfig.getConnection();
	private List<Product> products;
	private List<Pitch> pitchs;

	public int signUpUser(String username, String password, String fullname, String email, String phone) {

		int count = 0;

//		EXEC InsertUser 'sampleUsername', 'samplePassword', 'John Doe', 'john@example.com', '1234567000'
		String query = "EXEC InsertUserAndBookingUser ?, ?, ?, ?, ?";

		try {
			PreparedStatement statement = connection.prepareStatement(query);

			statement.setString(1, username);
			statement.setString(2, password);
			statement.setString(3, fullname);
			statement.setString(4, email);
			statement.setString(5, phone);

			count = statement.executeUpdate();

		} catch (SQLException e) {

			System.out.println("Error signup: " + e.getLocalizedMessage());

		} finally {

			try {
				connection.close();

			} catch (Exception e) {
				System.out.println("Error close connection " + e.getLocalizedMessage());
			}
		}
		return count;
	}

	public UserEntity getCustomerByUserName(String username) {
		String query = "select * from [User] where userName = ?";
		try {
			PreparedStatement pstm = connection.prepareStatement(query);
			pstm.setString(1, username);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {

				return new UserEntity(rs.getInt("userID"), rs.getString("userName"), rs.getString("passWord"),
						rs.getString("fullName"), rs.getString("email"), rs.getString("address"), rs.getInt("roleID"),
						rs.getString("phoneNumber"));
			}
		} catch (SQLException e) {
		}
		return null;
	}

	public UserEntity Login(UserEntity user) {
		String query = "select * from [User] where userName = ? and passWord =?";
		try {
			PreparedStatement pstm = connection.prepareStatement(query);
			pstm.setString(1, user.getUsername());
			pstm.setString(2, user.getPassword());
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				return new UserEntity(rs.getInt("userID"), rs.getString("userName"), rs.getString("passWord"),
						rs.getString("fullName"), rs.getString("email"), rs.getString("address"), rs.getInt("roleID"),
						rs.getString("phoneNumber"));
			}

		} catch (SQLException e) {
		}
		return null;
	}

	public void updateProfile(UserEntity user) {
		String query = "update [User]\n" + "\tset fullName = ?, email = ?, address = ?, phoneNumber = ?\n"
				+ "\twhere userID = ?";
		try {
			PreparedStatement pstm = connection.prepareStatement(query);
			pstm.setString(1, user.getFullname());
			pstm.setString(2, user.getEmail());
			pstm.setString(3, user.getAddress());
			pstm.setString(4, user.getPhone());
			pstm.setInt(5, user.getUserID());
			pstm.executeUpdate();
		} catch (Exception e) {
		}
	}

	public List<Product> convertResultSetToList(ResultSet rs) throws SQLException {
		List<Product> products = new ArrayList<>();

		while (rs.next()) {
			Product product = new Product((rs.getInt("productID")), rs.getString("productName"), rs.getString("img"),
					rs.getInt("productPrice"), rs.getInt("quantity"));

			products.add(product);
		}
		return products;
	}

	public List<Product> getAllProducts() throws SQLException {
		String query = "SELECT * FROM Product ";

		PreparedStatement pstm = connection.prepareStatement(query);

//	        if (!cacheValid || productInfos == null) {
		products = new ArrayList<>();
		ResultSet rs = pstm.executeQuery();
		products = convertResultSetToList(rs);
//	        }
		return products;
	}

	public List<Pitch> convertResultSetPitchToList(ResultSet rs) throws SQLException {
		List<Pitch> pitchs = new ArrayList<>();

		while (rs.next()) {
			PitchType pitchType = new PitchType(rs.getInt("pitchTypeID"), rs.getString("name"));

			pitchs.add(new Pitch((rs.getInt("pitchID")), rs.getString("img"), rs.getDouble("price"), pitchType));
		}
		return pitchs;
	}

	public List<Pitch> getAllPitchs() throws SQLException {
		String query = "SELECT p.pitchID, p.img, p.price,p.pitchTypeID, pt.name"
				+ "               FROM Pitch p JOIN pitchType pt ON p.pitchTypeID = pt.pitchTypeID";

		PreparedStatement pstm = connection.prepareStatement(query);

//		        if (!cacheValid || productInfos == null) {
		pitchs = new ArrayList<>();
		ResultSet rs = pstm.executeQuery();
		pitchs = convertResultSetPitchToList(rs);
//		        }
		return pitchs;

	}

	public Pitch getPitchByID(int pid) {
		String query = "SELECT p.pitchID, p.img, p.price,p.pitchTypeID, pt.name "
				+ "FROM Pitch p JOIN pitchType pt ON p.pitchTypeID = pt.pitchTypeID " + "Where pitchID=?";
		try {
			PreparedStatement pstm = connection.prepareStatement(query);
			pstm.setInt(1, pid);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				PitchType pitchType = new PitchType(rs.getInt("pitchTypeID"), rs.getString("name"));
				return new Pitch(rs.getInt("pitchID"), rs.getString("img"), rs.getDouble("price"), pitchType);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}

	public UserEntity getUserById(int id) {
		String query = "select * from [User] where userID=?";
		try {
			PreparedStatement pstm = connection.prepareStatement(query);
			pstm.setInt(1, id);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				return new UserEntity(rs.getInt("userID"), rs.getString("userName"), rs.getString("passWord"),
						rs.getString("fullName"), rs.getString("email"), rs.getString("address"), rs.getInt("roleID"),
						rs.getString("phoneNumber"));
			}
		} catch (SQLException e) {
		}
		return null;
	}

	public void changePassword(UserEntity user) {
		String query = "update [User] set passWord = ? where userName = ?";
		try {
			PreparedStatement pstm = connection.prepareStatement(query);
			pstm.setString(1, user.getPassword());
			pstm.setString(2, user.getUsername());
			pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<String> getAvailableBookingSlots(int pid,LocalDate selectedDate) {
		List<String> allSlots = getAllBookingSlots();
		List<String> bookedSlots = getBookedSlots(pid,selectedDate);

		allSlots.removeAll(bookedSlots);
		if (!selectedDate.isAfter(LocalDate.now())) {
            removePastTimeSlots(allSlots);
        }
//		for(String temp: allSlots) {
//			System.out.println(temp);
//		}
		return allSlots;
	}

	public void removePastTimeSlots(List<String> slots) {
		// Lấy thời gian hiện tại
		LocalTime currentTime = LocalTime.now();

		// Loại bỏ những thời gian đã qua
		slots.removeIf(slot -> {
			String[] times = slot.split(" - ");
			LocalTime startTime = LocalTime.parse(times[0]);
			return startTime.isBefore(currentTime);
		});
	}

	public List<String> getAllBookingSlots() {
		List<String> allSlots = new ArrayList<>();

		// Thêm tất cả các giờ trong ngày vào danh sách
		for (int i = 0; i <= 23; i++) {
			if (i < 23) {
				allSlots.add(String.format("%02d:00 - %02d:00", i, i + 1));
			} else {
				allSlots.add(String.format("%02d:00 - %02d:00", i, 0));
			}
		}

		return allSlots;
	}

	private List<String> getBookedSlots(int pid,LocalDate selectedDate) {
		List<String> bookedSlots = new ArrayList<>();
		
		try {
			String query = "SELECT startTime, endTime FROM [Order] where pitchID=? and oderDate=?";
			PreparedStatement pstm = connection.prepareStatement(query);
			pstm.setInt(1, pid);
			pstm.setDate(2, Date.valueOf(selectedDate));

			ResultSet resultSet = pstm.executeQuery();

			while (resultSet.next()) {
				
				String startTime = LocalTime.parse(resultSet.getTime("startTime").toString()).format(DateTimeFormatter.ofPattern("HH:mm"));
                String endTime = LocalTime.parse(resultSet.getTime("endTime").toString()).format(DateTimeFormatter.ofPattern("HH:mm"));
               
				bookedSlots.add(String.format("%s - %s", startTime, endTime));
			}

		} catch (SQLException e) {
			e.printStackTrace();

		}

		return bookedSlots;
	}
	public  Date convertToLocalDateToDate(LocalDate localDate) {
        // Convert LocalDate to Date
		 return java.sql.Date.valueOf(localDate);
    }
	public float getHeso(LocalTime startTime) {
		try {
			String query = "SELECT coefficient FROM Coefficient where startTimeC <= ? and endTimeC > ?";
			PreparedStatement pstm = connection.prepareStatement(query);
//			pstm.setTime(1, Time.valueOf(startTime));
//			pstm.setTime(2, Time.valueOf(startTime));
			pstm.setString(1, startTime.toString());
            pstm.setString(2, startTime.toString());
			ResultSet resultSet = pstm.executeQuery();
			while (resultSet.next()) {
				return resultSet.getFloat("coefficient");
			}

		} catch (SQLException e) {
			e.printStackTrace();

		}
		return 0;
	}
	public int getIDHeso(LocalTime startTime) {
		try {
			String query = "SELECT coefficientID FROM Coefficient where startTimeC <= ? and endTimeC > ? ";
			PreparedStatement pstm = connection.prepareStatement(query);
//			pstm.setTime(1, Time.valueOf(startTime));
//			pstm.setTime(2, Time.valueOf(startTime));
			pstm.setString(1, startTime.toString());
            pstm.setString(2, startTime.toString());
			ResultSet resultSet = pstm.executeQuery();
			while (resultSet.next()) {
				return resultSet.getInt("coefficientID");
			}

		} catch (SQLException e) {
			e.printStackTrace();

		}
		return 0;
	}
public Product getProductByID(int key) throws SQLException {
	String query = "SELECT * FROM Product where productID= ?";
	PreparedStatement pstm = connection.prepareStatement(query);
	pstm.setInt(1, key);

	ResultSet resultSet = pstm.executeQuery();
	while (resultSet.next()) {
		return new Product(resultSet.getInt("productID"),resultSet.getString("productName"),resultSet.getString("img"),resultSet.getDouble("productPrice"),resultSet.getInt("quantity"));
	}


		return null;
	}
public boolean updateQuantityProduct(String productId, String quantity) throws SQLException {
	String query = " Update Product set quantity=quantity-? where productID= ?";
	try{
		PreparedStatement pstm = connection.prepareStatement(query);
	pstm.setInt(1, Integer.parseInt(quantity));
	pstm.setInt(2, Integer.parseInt(productId));
	 pstm.executeUpdate();
} catch (SQLException e) {
    return false;
}
	return true;
	
	}
	public boolean InsertOrder(int pitchid, float bookingprice,LocalDate localDate, LocalTime startTime, LocalTime endTime,
			 float heso, List<ProductData> cart,UserEntity account,float total) throws SQLException {
		String query = "insert into [Order](pitchID,bookingPrice,oderDate,startTime,endTime,coefficientID)" +
                " values(?,?,?,?,?,?);";
		try{
			PreparedStatement pstm = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
		pstm.setInt(1, pitchid);
		pstm.setFloat(2, bookingprice);
		pstm.setDate(3, Date.valueOf(localDate));
		pstm.setString(4,String.valueOf(startTime));
		pstm.setString(5,String.valueOf(endTime));
		
		pstm.setInt(6, getIDHeso(startTime));

		pstm.executeUpdate();
		 ResultSet generatedKeys = pstm.getGeneratedKeys();
         int orderId = 0;
         if (generatedKeys.next()) {
             orderId = generatedKeys.getInt(1);
         }
         InsertOrderDetails(cart, orderId, account,total);
	} catch (SQLException e) {
        return false;
    }
		return true;
	}
	private void InsertOrderDetails(List<ProductData> cart, int orderId, UserEntity account,float total) {
		String query = "insert into OrderDetail(currentTime,orderID,userID,totalPrice) values( GETDATE(),?,?,?);";

        try {
            PreparedStatement pstm = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
                pstm.setInt(1, orderId);
                pstm.setInt(2, account.getUserID());
                pstm.setFloat(3, total);
                pstm.executeUpdate();
                ResultSet generatedKeys = pstm.getGeneratedKeys();
                int orderDetailId = 0;
                if (generatedKeys.next()) {
                	orderDetailId = generatedKeys.getInt(1);
                }
                InsertProductDetails(cart, orderDetailId);
          
        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}

	private void InsertProductDetails(List<ProductData> cart, int orderDetailId) {
		String query = "insert into ProductDetail(orderDetailID,productID,quantityOrder) values( ?,?,?);";

        try {
            PreparedStatement pstm = connection.prepareStatement(query);
                
            for (ProductData product : cart) {
                pstm.setInt(1, orderDetailId);
                pstm.setInt(2, Integer.parseInt(product.getProductId()));
                pstm.setInt(3, Integer.parseInt(product.getQuantity()));
                pstm.executeUpdate();
            }
          
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	public static void main(String[] args) throws ParseException, SQLException {
		UserRepository userService = new UserRepository();
//		UserEntity user=new UserEntity("Quangtien1", "password1");
//		System.out.println(userService.getPitchByID(2));
//		System.out.println(userService.getBookedSlots(1));


//		 System.out.println(userService.getAvailableBookingSlots(1,localDate));
//		 System.out.println(userService.getAllProducts());
//LocalTime localtime=LocalTime.of(21, 0);
//			String starttime="21:00:00";
//			String endtime="22:00:00";
//			 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
//				LocalTime startTime = LocalTime.parse(starttime, formatter);
//				LocalTime endTime = LocalTime.parse(endtime, formatter);
//		 LocalDate localDate=LocalDate.of(2023, 11, 21);
//		 
//		 Float price=(float) 180000;
//		 System.out.println(userService.getProductByID(1));
//		 System.out.println(userService.InsertOrder(11,price ,localDate, startTime, endTime, userService.getIDHeso(localtime) ));
//		 System.out.println(startTime);
//		 System.out.println(userService.getIDHeso(localtime));
//		 
//		 System.out.println(userService.updateQuantityProduct("9","5"));
//		 System.out.println(userService.getAvailableBookingSlots(11, localDate));
//		 System.out.println(userService.getBookedSlots(11, localDate));
//		List<String> list = userService.getAvailableBookingSlots(1,LocalDate.of(2023, 11, 18));
		 System.out.println(userService.getAllPitchs());
	}

	

	





}
