package blog.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public class FileSaveUtil {

    public static String saveUploadImage(MultipartFile file) {
        String url = null;
        String[] filePath = file.getOriginalFilename().split("\\\\");
        String fileName = "";           //暂时不考虑文件名重复问题。
        fileName = filePath[filePath.length - 1];
        if (!fileName.isEmpty()) {
            File path = new File(new File("upload/imgs/").getAbsolutePath(),
                    fileName);
            if (!path.getParentFile().exists()) {
                path.getParentFile().mkdirs();
            }
            try {
                file.transferTo(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
            url = "/imgs/" + fileName;
        }
        return url;
    }
}
