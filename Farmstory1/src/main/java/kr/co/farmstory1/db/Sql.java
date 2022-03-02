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
	public static final String SELECT_COUNT_ID = "SELECT COUNT(`id`) FROM `Board_article` WHERE `parent`=0";
	public static final String SELECT_FILE     = "SELECT * FROM `Board_file` WHERE `fid`=?";
	public static final String SELECT_ARTICLE  = "SELECT * FROM `Board_article` AS a "
												+ "LEFT JOIN `Board_file` AS b "
												+ "ON a.id=b.parent "
												+ "WHERE `id`=?";
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.`nick` FROM `Board_article` AS a "
												+ "JOIN `Board_user` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE a.parent = 0 "
												+ "ORDER BY `id` DESC "
												+ "LIMIT ?, 10";
	
	public static final String SELECT_COMMENTS = "SELECT a.*, b.nick FROM `Board_article` AS a "
												+ "JOIN `Board_user` AS b ON a.uid = b.uid "
												+ "WHERE `parent`=? ORDER BY `id` ASC";
	
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
	
	
	public static final String UPDATE_FILE_COUNT  = "UPDATE `Board_file` SET `download` = `download` + 1 WHERE `fid`=?";
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `Board_article` SET `hit` = `hit` + 1 WHERE `id`=?";
	public static final String UPDATE_ARTICLE_COMMENT_PLUS  = "UPDATE `Board_article` SET `comment` = `comment` + 1 WHERE `id`=?";
	public static final String UPDATE_ARTICLE_COMMENT_MINUS = "UPDATE `Board_article` SET `comment` = `comment` - 1 WHERE `id`=?";
	
	public static final String UPDATE_COMMENT = "UPDATE `Board_article` SET `content`=? WHERE `id`=?";
	public static final String DELETE_COMMENT = "DELETE FROM `Board_article` WHERE `id`=?";
											  
	
}