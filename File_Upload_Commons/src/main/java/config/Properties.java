package config;

public class Properties
{
    public static final String  TMP_FOLDER = "/tmp";
    public static final String  STORE_FOLDER = System.getProperty("user.home") + "/Documents/fileUploadFiles/";
    public static final int MAX_UPLOAD_SIZE = (1 * 1024 * 1024) * 10; // 1MB * 10 = 10 MB
}
