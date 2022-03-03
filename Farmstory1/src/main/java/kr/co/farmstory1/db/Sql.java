package kr.co.farmstory1.db;

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
	
	public static final String SELECT_COUNT_UID   = "SELECT COUNT(`uid`) FROM `Board_user` WHERE `uid`=?"; 
	public static final String SELECT_COUNT_NICK  = "SELECT COUNT(`nick`) FROM `Board_user` WHERE `nick`=?"; 
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) FROM `Board_user` WHERE `email`=?"; 
	public static final String SELECT_COUNT_HP    = "SELECT COUNT(`hp`) FROM `Board_user` WHERE `hp`=?"; 
	public static final String SELECT_USER = "SELECT * FROM `Board_user` WHERE `uid`=? AND `pass`=PASSWORD(?)";
	
	// board
	public static final String SELECT_MAX_ID   = "SELECT MAX(`id`) FROM `Board_article`";
	public static final String SELECT_COUNT_NO = "SELECT COUNT(`no`) FROM `Board_article` WHERE `parent`=0 AND `type`=?";
	public static final String SELECT_FILE     = "SELECT * FROM `Board_file` WHERE `fno`=?";
	public static final String SELECT_ARTICLE  = "SELECT * FROM `Board_article` AS a "
												+ "LEFT JOIN `Board_file` AS b "
												+ "ON a.no=b.parent "
												+ "WHERE `no`=?";
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.`nick` FROM `Board_article` AS a "
												+ "JOIN `Board_user` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE a.parent = 0 AND a.type = ? "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	
	public static final String SELECT_COMMENTS = "SELECT a.*, b.nick FROM `Board_article` AS a "
												+ "JOIN `Board_user` AS b ON a.uid = b.uid "
												+ "WHERE `parent`=? ORDER BY `no` ASC";
	
	public static final String SELECT_LATESTS = "(SELECT * FROM `Board_article` WHERE `parent`=0 AND `type`='grow'   ORDER BY `no` DESC LIMIT 5) "
												+ "UNION "
												+ "(SELECT * FROM `Board_article` WHERE `parent`=0 AND `type`='school' ORDER BY `no` DESC LIMIT 5) "
												+ "UNION "
												+ "(SELECT * FROM `Board_article` WHERE `parent`=0 AND `type`='story'  ORDER BY `no` DESC LIMIT 5)"; 
	
	public static final String INSERT_ARTICLE = "INSERT INTO `Board_article` SET "
												+ "`type`=?,"
												+ "`title`=?,"
												+ "`content`=?,"
												+ "`file`=?,"
												+ "`uid`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	
	public static final String INSERT_COMMENT = "INSERT INTO `Board_article` SET "
												+ "`parent`=?,"
												+ "`content`=?,"
												+ "`uid`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	
	public static final String INSERT_FILE = "INSERT INTO `Board_file` SET "
											+ "`parent`=?,"
											+ "`oName`=?,"
											+ "`nName`=?,"
											+ "`rdate`=NOW()";
	
	
	public static final String UPDATE_FILE_COUNT  = "UPDATE `Board_file` SET `download` = `download` + 1 WHERE `fno`=?";
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `Board_article` SET `hit` = `hit` + 1 WHERE `no`=?";
	public static final String UPDATE_ARTICLE_COMMENT_PLUS  = "UPDATE `Board_article` SET `comment` = `comment` + 1 WHERE `no`=?";
	public static final String UPDATE_ARTICLE_COMMENT_MINUS = "UPDATE `Board_article` SET `comment` = `comment` - 1 WHERE `no`=?";
	
	public static final String UPDATE_ARTICLE = "UPDATE `Board_article` SET `title`=?, `content`=? WHERE `no`=?";
	public static final String UPDATE_COMMENT = "UPDATE `Board_article` SET `content`=? WHERE `no`=?";
	public static final String DELETE_COMMENT = "DELETE FROM `Board_article` WHERE `no`=?";
											  
	
}
