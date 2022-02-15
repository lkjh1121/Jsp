package kr.co.board1.db;

public class Sql {
	
	// user
	public static final String SELECT_TERMS = "SELECT * FROM `Board_terms`";
	public static final String INSERT_USER  = "INSERT INTO `Board_user` SET "
											+ "`uid`=?,"
											+ "`pass`=PASSWORD(?),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW()";
	
	public static final String SELECT_USER = "SELECT * FROM `Board_user` WHERE `uid`=? AND `pass`=PASSWORD(?)";
	
	
	
	

	
	
	// board
	

}