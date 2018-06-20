package blog.service;

import blog.domain.Role;
import blog.domain.User;
import blog.domain.form.UserChangeForm;
import blog.domain.form.UserSignupForm;
import blog.repository.RoleRepository;
import blog.repository.UserRepository;
import blog.utils.FileSaveUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDetails user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("用户名未找到");
        }
        return user;
    }

    public boolean checkUsernameExist(String username) {
        User user = userRepository.findByUsernameOrEmailAddress(username, username);
        return user != null;
    }

    public void addUser(UserSignupForm signupForm) {
        PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
        User user = new User();
        user.setUsername(signupForm.getUsername());
        user.setPassword(encoder.encode(signupForm.getPassword()));
        user.setEmailAddress(signupForm.getEmailAddress());
        List<Role> roles = new ArrayList<>();
        Role role = roleRepository.findByName("USER");
        if (role == null) {
            role = new Role();
            role.setName("USER");
        }
        roles.add(role);
        user.setRoles(roles);
        userRepository.save(user);
    }

    public void changeUserBy(UserChangeForm form) {
        User currentUser = (User) getCurrentUser();
        MultipartFile img = form.getAvatarImg();
        if (img != null && !img.isEmpty()) {
            String avatarLink = FileSaveUtil.saveUploadImage(img);
            currentUser.setAvatarLink(avatarLink);
        }
        String emailAddress = form.getEmailAddress();
        if (emailAddress != null && !emailAddress.isEmpty()) {
            currentUser.setEmailAddress(form.getEmailAddress());
        }
        userRepository.save(currentUser);
    }

    public Map<String, Object> changePassword(String oldPassword, String newPassword) {
        Map<String, Object> result = new HashMap<>();
        boolean success = true;
        User user = (User)getCurrentUser();
        PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
        if (!encoder.matches(oldPassword, user.getPassword())) {
            Map<String, String> error = new HashMap<>();
            error.put("errorPos", "oldPassword");
            error.put("errorMsg", "密码不正确");
            result.put("error", error);
            success = false;
        }
        if (newPassword == null || newPassword.isEmpty()) {
            Map<String, String> error = new HashMap<>();
            error.put("errorPos", "newPassword");
            error.put("errorMsg", "密码不能为空");
            result.put("error", error);
            success = false;
        }
        if (success) {
            user.setPassword(encoder.encode(newPassword));
            userRepository.save(user);
        }
        result.put("success", success);
        return result;
    }

    public static Object getCurrentUser() {
        return SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }


}
