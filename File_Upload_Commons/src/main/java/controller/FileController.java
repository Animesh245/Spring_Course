package controller;

import config.Properties;
import model.Product;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Controller
public class FileController
{
    private static final Log logger = LogFactory.getLog(FileController.class);

    @GetMapping(value = "/")
    public String inputProduct(Model model)
    {
        model.addAttribute("product", new Product());
        model.addAttribute("img", "img.png");
        return "form";
    }

    @PostMapping(value = "/save-file")
    public String saveFile(HttpSession session, /*HttpServletRequest req,*/ @RequestParam("image") CommonsMultipartFile file, Model model) throws IOException {


//        System.out.println("File upload handler");
//        System.out.println(file.getOriginalFilename());
//        System.out.println(file.getName());
//        System.out.println(file.getResource());
//        System.out.println(file.getSize());
//        System.out.println(file.isEmpty());
//        System.out.println(file.getContentType());
//        System.out.println(file.getStorageDescription());


        byte[] byteFile = file.getBytes();         //store byte data in a file
//        String path = req.getSession().getServletContext().getRealPath()
//        String path = session.getServletContext().getRealPath("/")+ "WEB-INF/resources/images/" + file.getOriginalFilename();
//        String path = "/home/warrior245/Documents/Projects/File_Upload_Commons/src/main/webapp/WEB-INF/resources/images/" + file.getOriginalFilename();
        Path path = Paths.get(Properties.STORE_FOLDER);
        Path desPath = path.resolve(file.getOriginalFilename());
//        Path path = Paths.get(session.getServletContext().getRealPath("/") + "WEB-INF" +File.separator+ "resources" +File.separator+ "images"+File.separator+ file.getOriginalFilename()); // file is stored in the server
        System.out.println(path);
        System.out.println(desPath.toFile().exists());

            if(!desPath.toFile().exists()) {
                desPath.toFile().createNewFile();
                System.out.println(desPath);
            }


        System.out.println(desPath.toFile().exists());


//        Path paath = Path.of(path);
//        if(!Files.exists(paath)) paath.toFile().mkdir();

        try {
//            FileOutputStream fileOutputStream = new FileOutputStream(path);
            FileOutputStream fileOutputStream = new FileOutputStream(desPath.toString());
            fileOutputStream.write(byteFile);
            fileOutputStream.close();
            System.out.println("File is uploaded");
            model.addAttribute("msg", "Upload Successful");
            model.addAttribute("fileName", file.getOriginalFilename());
        }catch (IOException e)
        {
            e.printStackTrace();
            System.out.println("Uploading error");
            model.addAttribute("msg", "Upload Error");
        }


//        String imageName = productImage.getOriginalFilename();
//
//        File imageFile = new File(req.getServletContext().getRealPath("/image"), imageName);
//
//        try
//        {
//            productImage.transferTo(imageFile);
//        }catch (IOException e)
//        {
//            e.printStackTrace();
//        }




        return "details";
    }
}
