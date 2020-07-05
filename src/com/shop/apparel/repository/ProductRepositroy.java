package com.shop.apparel.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shop.apparel.db.DBConn;
import com.shop.apparel.dto.ProductDto;
import com.shop.apparel.model.Cart;
import com.shop.apparel.model.Category;
import com.shop.apparel.model.Member;
import com.shop.apparel.model.Product;

public class ProductRepositroy {
	//TAG는 오류 발생시 쉽게 추적하기 위함
	private static final String TAG = "ProductRepositroy : ";
	
	//싱글톤 패턴으로 스스로 객체를 생성해서 다른곳에서 만들어진 이 객체를 사용하기 위함
	//목적 : 하나만 new 해서 사용
	private ProductRepositroy() {} // 다른 곳에서 new 를 막기위해서 생성자를 private로 함
	
	private static ProductRepositroy instance = new ProductRepositroy(); //스스로 생성
	
	public static ProductRepositroy getInstance() {
		return instance; //다른 곳에서 사용할때 이 것을 호출한다.
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// detail.jsp에 쓰기 위해 product중에 필요한 것들만!
	public Product selectByKeyword(String keyword){
		final String SQL = "SELECT id, name, type, titlecomment, price, thumbnailw, thumbnailh, contents, categoryid " + 
				"FROM product " + 
				"WHERE name like ?";
		Product product = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  "%" + keyword + "%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = Product.builder()
						.id(rs.getInt(1))
						.name(rs.getString(2))
						.type(rs.getString(3))
						.titleComment(rs.getString(4))
						.price(rs.getInt(5))
						.thumbnailW(rs.getString(6))
						.thumbnailW(rs.getString(7))
						.contents(rs.getString(8))
						.categoryId(rs.getInt(9))
						.build();
			}
			return product;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "selectByKeyword : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null;
	}
	
	
	// detail.jsp에 쓰기 위해 product중에 필요한 것들만!
	public ProductDto selectByIdForDto(int productId){
		final String SQL = "SELECT id, name, titleComment, price, thumbnailW, contents FROM product WHERE id = ?";
		ProductDto productDto = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				productDto = ProductDto.builder()
						.id(rs.getInt(1))
						.name(rs.getString(2))
						.titleComment(rs.getString(3))
						.price(rs.getInt(4))
						.thumbnailW(rs.getString(5))
						.contents(rs.getString(6))
						.build();
			}
			
			return productDto;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "selectByIdForDto : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public List<Cart> selectAllCartById(int memberId){
		final String SQL = "SELECT * FROM cart WHERE memberId = ?";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, memberId);
			rs = pstmt.executeQuery();
			List<Cart> carts = new ArrayList<>();
			while(rs.next()) {
				Cart cart = Cart.builder()
						.id(rs.getInt(1))
						.memberId(rs.getInt(2))
						.productId(rs.getInt(3))
						.quantity(rs.getInt(4))
						.build();
				carts.add(cart);
			}
			return carts;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "selectAllCartById : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null;
	}
	
	//물품 하나씩 찾기
	public Product selectById(int productId){
		final String SQL = "SELECT * FROM product WHERE id = ?";
		Product product = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = Product.builder()
						.id(rs.getInt(1))
						.name(rs.getString(2))
						.type(rs.getString(3))
						.titleComment(rs.getString(4))
						.price(rs.getInt(5))
						.thumbnailW(rs.getString(6))
						.thumbnailH(rs.getString(7))
						.contents(rs.getString(8))
						.categoryId(rs.getInt(9))
						.build();
			}
			
			return product;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "selectById : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null;
	}
	
	
	//상품 뿌리기
	public List<Product> selectAll(){
		final String SQL = "SELECT * FROM product";
		List<Product> products = new ArrayList<>();
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(SQL);
			
			while(rs.next()) {
				Product product = Product.builder()
						.id(rs.getInt(1))
						.name(rs.getString(2))
						.type(rs.getString(3))
						.titleComment(rs.getString(4))
						.price(rs.getInt(5))
						.thumbnailW(rs.getString(6))
						.thumbnailH(rs.getString(7))
						.contents(rs.getString(8))
						.categoryId(rs.getInt(9))
						.build();
				products.add(product);
			}
			return products;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "selectAll : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public List<Category> findAllCategory() {
		final String SQL = "SELECT id,type " +
				"FROM category " +
				"WHERE id = parenttypeid ";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			List<Category> categories = new ArrayList<>();
			
			while(rs.next()) {
				Category category = Category.builder()
						.id(rs.getInt(1))
						.type(rs.getString(2))
						.build();
				categories.add(category);
			}
			
			return categories;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "findAllCategory : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null;
	}
	
	
	//상품 등록
	public int save(Product product) {
		final String SQL = "INSERT INTO product(id,name,type, titleComment, price,thumbnailW,thumbnailH,contents,categoryId) " + 
				"VALUES(product_SEQ.nextval,?,?,?,?,?,?,?,?)";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, product.getName());
			pstmt.setString(2, product.getType());
			pstmt.setString(3, product.getTitleComment());
			pstmt.setInt(4, product.getPrice());
			pstmt.setString(5, product.getThumbnailW());
			pstmt.setString(6, product.getThumbnailH());
			pstmt.setString(7, product.getContents());
			pstmt.setInt(8, product.getCategoryId());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "save : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return -1;
	}
	
	//상품 등록 return product ID
	public int saveReturnId(Product product) {
		final String SQL = "INSERT INTO product(id,name,type, titleComment, price,thumbnailW,thumbnailH,contents,categoryId) " + 
				"VALUES(product_SEQ.nextval,?,?,?,?,?,?,?,?)";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL, new String[] {"id"});
			pstmt.setString(1, product.getName());
			pstmt.setString(2, product.getType());
			pstmt.setString(3, product.getTitleComment());
			pstmt.setInt(4, product.getPrice());
			pstmt.setString(5, product.getThumbnailW());
			pstmt.setString(6, product.getThumbnailH());
			pstmt.setString(7, product.getContents());
			pstmt.setInt(8, product.getCategoryId());
			pstmt.executeUpdate();
			rs=pstmt.getGeneratedKeys();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "saveReturnId : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return -1;
	}
	
	//상품 등록 후 실행되는 withItem insert
	public int saveWithItem(int parentProductId, int withItemId) {
		final String SQL = "INSERT INTO withItem (id, parentProductId, withitemId) " + 
				"VALUES(withItem_SEQ.nextval, ?, ?)";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, parentProductId);
			pstmt.setInt(2, withItemId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "saveWithItem : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return -1;
	}
}
