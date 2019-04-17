package blog.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;

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

    public static String saveBase64Img(String img) {
        String url = null;
        String[] data = img.split(",");
        String header = data[0];
        String imgType = header.split("/")[1].split(";")[0];
        if (imgType.equals("jpeg")) {
            imgType = "jpg";
        }
        String fileName = getRandomName() + "." + imgType;
        try {
            Files.write(Paths.get("upload/img/" + fileName),
                    Base64.getDecoder().decode(data[1]));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "imgs/" + fileName;
    }

    private static String getRandomName() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 5; i++) {
            sb.append((int)(Math.random()*100));
        }
        return sb.toString();
    }
}
