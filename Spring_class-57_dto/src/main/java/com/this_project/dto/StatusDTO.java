package com.this_project.dto;
import com.this_project.entity.Status;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class StatusDTO {
    private Long id;

    private String title;

    private String description;

    private String privacy;

//    LocalDateTime createdDateTime;
//
//    Boolean isDeleted;

    private String location;

    private String user;

    private String attachmentPath;
}
