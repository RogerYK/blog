package blog.controller;

import blog.domain.User;
import blog.domain.form.UserChangeForm;
import blog.domain.form.UserSignupForm;
import blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/account")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "front/login";
    }


    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signupPage() {
        return "front/signup";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> signup(UserSignupForm signupForm) {
        Map<String, Object> respond = new HashMap<>();
        String username = signupForm.getUsername();
        String password = signupForm.getPassword();
        String emailAddress = signupForm.getEmailAddress();
        if (username == null || username.isEmpty()) {
            Map<String, String> error = new HashMap<>();
            error.put("errorPos", "username");
            error.put("errorMsg", "用户名为空");
            respond.put("error", error);
        } else if (userService.checkUsernameExist(username)) {
            Map<String, String> error = new HashMap<>();
            error.put("errorPos", "username");
            error.put("errorMsg", "用户名重复");
            respond.put("error", error);
        } else if (password == null || password.isEmpty()) {
            Map<String, String> error = new HashMap<>();
            error.put("errorPos", "password");
            error.put("errorMsg", "密码不能为空");
            respond.put("error", error);
        } else if (emailAddress == null || emailAddress.isEmpty()) {
            Map<String, String> error = new HashMap<>();
            error.put("errorPos", "emailAddress");
            error.put("errorMsg", "电子邮件不能为空");
            respond.put("error", error);
        } else {
            userService.addUser(signupForm);
            respond.put("success", Boolean.TRUE);
        }
        return respond;
    }

    @RequestMapping("/profile")
    public String profilePage() {
        return "front/profile";
    }

    @RequestMapping(value = "/profile/change", method = RequestMethod.GET)
    public String profileChangePage() {
        return "front/profile_change";
    }

    @RequestMapping(value = "/profile/change", method = RequestMethod.POST)
    public String changeProfile(UserChangeForm form) {
        userService.changeUserBy(form);
        return "front/profile";
    }

    @RequestMapping(value = "/password/change", method = RequestMethod.GET)
    public String passwordChangePage() {
        return "front/password_change";
    }

    @RequestMapping(value = "/password/change", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> changePassword(String oldPassword, String newPassword) {
        return userService.changePassword(oldPassword, newPassword);
    }

}
