package blog.domain.form;

import org.springframework.web.multipart.MultipartFile;

public class UserChangeForm {

    private String emailAddress;

    private MultipartFile avatarImg;

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public MultipartFile getAvatarImg() {
        return avatarImg;
    }

    public void setAvatarImg(MultipartFile avatarImg) {
        this.avatarImg = avatarImg;
    }
}
