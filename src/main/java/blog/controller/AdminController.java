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
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private AdminService adminService;

    @RequestMapping("")
    public String index() {
        return "redirect:/admin/blogmanage";
    }


    @RequestMapping("/blogmanage")
    public String blogManager(Model model) {
        List<Article> articles = adminService.articleList();
        model.addAttribute("articles", articles);
        return "admin/blogmanage";
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
            return "admin/error";
        } else {
            model.addAttribute("articleForm", new ArticleForm(articleOptional.get()));
        }
        return "admin/blogadd";
    }

    @RequestMapping("/deleteblog/{id}")
    public String deleteBlog(@PathVariable("id") Long id) {
        adminService.deleteArticle(id);
        return "redirect:/admin/blogmanage";
    }


    @RequestMapping(value = "/saveblog", method = RequestMethod.POST)
    public String saveBlog(ArticleForm articleForm) {
        adminService.saveArticle(articleForm);
        return "redirect:/admin/blogmanage";
    }

    @RequestMapping("/updateblog/{id}")
    public String updateBlog(ArticleForm articleForm) {
        adminService.saveArticle(articleForm);
        return "redirect:/admin/blogmanage";
    }


    @RequestMapping("/tagmanage")
    public String tagManager(Model model) {
        List<Tag> tags = adminService.getTagList();
        model.addAttribute("tags", tags);
        return "admin/tagmanage";
    }

    @RequestMapping(value = "/updatetag/{id}", method = RequestMethod.POST)
    public String updateTag(Tag tag) {
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
