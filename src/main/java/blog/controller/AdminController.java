package blog.controller;

import blog.domain.Article;
import blog.domain.Category;
import blog.domain.Tag;
import blog.domain.form.ArticleForm;
import blog.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private Logger logger = LoggerFactory.getLogger(AdminController.class);
    //TODO: 解决删除问题， 美化页面

    @Value("${blog.username}")
    private String username;

    @Value("${blog.password}")
    private String password;

    @Autowired
    private AdminService adminService;

    @RequestMapping("")
    public String index() {
        return "redirect:/admin/login";
    }

    @RequestMapping("/index")
    public String index(Model model) {
        List<Article> articles = adminService.articleList();
        model.addAttribute("articles", articles);
        return "admin/index";
    }

    @RequestMapping("/login")
    public String login() {
        return "admin/login";
    }

    @RequestMapping(value = "/dologin", method = RequestMethod.POST)
    public String dologin(String username, String password, Model model) {
        if (this.username.equals(username) && this.password.equals(password)) {
            return "redirect:index";
        } else {
            model.addAttribute("error", "用户名或密码错误");
            return "redirect:admin/login";
        }
    }

    @RequestMapping("/blogmanage")
    public String blogManager(Model model) {
        List<Article> articles = adminService.articleList();
        model.addAttribute("articles", articles);
        return "/admin/blogmanage";
    }

    @RequestMapping("/blogadd")
    public String blogWrite() {
        return "admin/blogadd";
    }

    @RequestMapping("/blogupdate/{id}")
    public String blogUpdate(@PathVariable("id") Long id, Model model) {
        Optional<Article> articleOptional = adminService.blogFindById(id);
        if (!articleOptional.isPresent()) {
            model.addAttribute("error", "指定文章不存在");
            return "/admin/error";
        } else {
            model.addAttribute("articleForm", new ArticleForm(articleOptional.get()));
        }
        return "/admin/blogadd";
    }

    @RequestMapping("/deleteblog/{id}")
    public String deleteBlog(@PathVariable("id") Long id) {
        adminService.deleteArticle(id);
        return "redirect:/admin";
    }


    @RequestMapping(value = "/saveblog", method = RequestMethod.POST)
    public String saveBlog(ArticleForm articleForm) {
        adminService.saveArticle(articleForm);
        return "redirect:/admin";
    }

    @RequestMapping("/updateblog/{id}")
    public String updateBlog(ArticleForm articleForm) {
        adminService.saveArticle(articleForm);
        return "redirect:/admin";
    }


    @RequestMapping("/tagmanage")
    public String tagManager(Model model) {
        List<Tag> tags = adminService.tagList();
        model.addAttribute("tags", tags);
        return "/admin/tagmanage";
    }

    @RequestMapping(value = "/updatetag/{id}", method = RequestMethod.POST)
    public String updateTag(Tag tag) {
        System.out.println(tag);
        adminService.updateTag(tag);
        return "redirect:/admin/tagmanage";
    }

    @RequestMapping("/addtag")
    public String addTag(Tag tag) {
        adminService.saveTag(tag);
        return "redirect:/admin/tagmanage";
    }

    @RequestMapping("/deletetag/{id}")
    public String deleteTag(@PathVariable("id") Long id) {
        adminService.deleteTag(id);
        return "redirect:/admin/tagmanage";
    }


    @RequestMapping("/categorymanage")
    public String categoryManager(Model model) {
        List<Category> categories = adminService.categoryList();
        model.addAttribute("categories", categories);
        return "/admin/categorymanage";
    }

    @RequestMapping("/addcategory")
    public String addCategory(Category category) {
        adminService.saveCategory(category);
        return "redirect:/admin/categorymanage";
    }

    @RequestMapping("/updatecategory/{id}")
    public String updateCategory(Category category) {
        adminService.updateCategory(category);
        return "redirect:/admin/categorymanage";
    }

    @RequestMapping("/deletecategory/{id}")
    public String deleteCategory(@PathVariable("id") Long id) {
        adminService.deleteCategory(id);
        return "redirect:/admin/categorymanage";
    }
}
