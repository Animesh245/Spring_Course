package config;

import entity.Attachment;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class Utils {
    public static Attachment saveFile(MultipartFile file, String userId) {
        Path rootLocation = Paths.get(System.getProperty("user.home") + "/social-community");

        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            Path destinationFile = rootLocation.resolve(Paths.get(userId + fileExtension)).normalize().toAbsolutePath();


            if (!destinationFile.toFile().exists()) {
                destinationFile.toFile().mkdirs();
            }
            try (InputStream inputStream = file.getInputStream()) {
                Files.copy(inputStream, destinationFile, StandardCopyOption.REPLACE_EXISTING);
                Attachment attachment = new Attachment();

                attachment.setAttachmentName(fileName);
                attachment.setAttachmentPath(destinationFile.toAbsolutePath().toString());
                attachment.setAttachmentType(file.getContentType());

                return attachment;
            }catch (IOException e) {
                e.printStackTrace();
            }
        }

        return null;
    }
}
