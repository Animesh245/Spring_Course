package controller;

import config.Properties;
import dao.AttachmentDAO;
import entity.Attachment;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Controller
@RequestMapping(value = "/file")
public class FileController {

    @Autowired
    private AttachmentDAO attachmentDAO;

    @PostMapping(value = "/upload")
    public Attachment uploadFile(@RequestParam(value = "file")MultipartFile file) throws IOException
    {
        String fileName = file.getOriginalFilename();
        String fileExtension = FilenameUtils.getExtension(fileName);
        String filepath = Properties.WRITE_PATH + fileName;
        Path path = Paths.get(filepath);
        Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

        Attachment attachment = new Attachment();
        attachment.setAttachmentPath(filepath);
        attachment.setAttachmentName(fileName);
        attachment.setAttachmentType(fileExtension);
        return attachment;
    }

    @GetMapping(value = "/getFile/{id}")
    public void getFileById(@PathVariable(value = "id") Long id, HttpServletResponse response) throws IOException
    {
        Attachment attachment = attachmentDAO.findById(id);

        File file = new File(attachment.getAttachmentPath());
        String mimeType = URLConnection.guessContentTypeFromName(attachment.getAttachmentName());

        if (mimeType == null)
        {
            mimeType = "application/octet-stream";
        }
        response.setContentType(mimeType);
        response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));
        response.setContentLength((int) file.length());
        InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
        FileCopyUtils.copy(inputStream, response.getOutputStream());
    }


}
