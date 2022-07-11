package model;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.List;

@Data
public class Product
{
    @NotNull
    @Size(min = 1, max = 10)
//    private String name;
//    private String description;
//    private int price;
    private MultipartFile image;
}
