//package com.this_project.controller;
//
//import com.this_project.config.Properties;
//import com.this_project.dao.AttachmentDAO;
//import com.this_project.entity.Attachment;
//import org.apache.commons.io.FilenameUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.IOException;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//
//@Controller
//public class FileUploadController {
//
//    @Autowired
//    AttachmentDAO attachmentDAO;
//
//    @PostMapping("/upload")
//    public Attachment uploadFile(@RequestParam("attachment")MultipartFile multipartFile) throws IOException {
//    String fileName = multipartFile.getOriginalFilename();
//    String fileNameExtension = FilenameUtils.getExtension(fileName); /* multipartFile.getContentType();*/
//    String filePath = Properties.USER_FOLDER + fileName;
//
//    Path path = Paths.
//
//    }
//}
