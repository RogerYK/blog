package blog.controller;

import blog.domain.Article;
import blog.domain.Category;
import blog.domain.Tag;
import blog.domain.form.ArticleForm;
import blog.domain.form.JArticleForm;
import blog.service.AdminService;
import blog.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/madmin")
public class JAdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/")
    public String index() {
        return "madmin/index";
    }

    @RequestMapping(value = "/article", method = RequestMethod.GET)
    @ResponseBody()
    public JsonResult getArticles() {
        JsonResult result = new JsonResult();
        List<Article> articles = adminService.articleList();
        result.setStatus("succeed");
        result.setData(articles);
        return result;
    }

    @RequestMapping(value = "/article", method = RequestMethod.POST)
    @ResponseBody()
    public JsonResult saveArticle(JArticleForm form) {
        JsonResult result = new JsonResult();
        adminService.saveArticle(form);
        return result;
    }

    @RequestMapping(value = "/article/{id}", method = RequestMethod.GET)
    @ResponseBody()
    public JsonResult getArticle(@PathVariable("id") Long id) {
        JsonResult result = new JsonResult();
        Optional<Article> opArticle = adminService.blogFindById(id);
        if (opArticle.isPresent()) {
            result.setStatus("succeed");
            result.setData(opArticle.get());
        } else {
            result.setStatus("error");
            result.setError("文章没找到");
        }
        return result;
    }

    @RequestMapping(value = "/article", method = RequestMethod.PUT)
    @ResponseBody()
    public JsonResult updateArticle(JArticleForm form) {
        JsonResult result = new JsonResult();
        adminService.saveArticle(form);
        result.setStatus("succeed");
        return result;
    }

    @RequestMapping(value = "/tag", method = RequestMethod.GET)
    @ResponseBody()
    public JsonResult getTags() {
        JsonResult result = new JsonResult();
        List<Tag> tags = adminService.getTagList();
        result.setStatus("succeed");
        result.setData(tags);
        return result;
    }

    @RequestMapping(value = "/tag", method = RequestMethod.POST)
    @ResponseBody()
    public JsonResult saveTag(Tag tag) {
        JsonResult result = new JsonResult();
        adminService.saveTag(tag);
        result.setStatus("succeed");
        return result;
    }

    @RequestMapping(value = "/tag", method = RequestMethod.PUT)
    @ResponseBody()
    public JsonResult updateTag(Tag tag) {
        JsonResult result = new JsonResult();
        adminService.updateTag(tag);
        result.setStatus("succeed");
        return result;
    }

    @RequestMapping(value = "/tag/{id}", method = RequestMethod.DELETE)
    @ResponseBody()
    public JsonResult deleteTag(@PathVariable("id") Long id) {
        JsonResult result = new JsonResult();
        adminService.deleteTag(id);
        result.setStatus("succeed");
        return result;
    }

    @RequestMapping(value = "/category", method = RequestMethod.GET)
    @ResponseBody()
    public JsonResult getCategories() {
        JsonResult result = new JsonResult();
        List<Category> categories = adminService.categoryList();
        result.setStatus("succeed");
        result.setData(categories);
        return result;
    }

    @RequestMapping(value = "/category", method = RequestMethod.POST)
    @ResponseBody()
    public JsonResult saveCategory(Category category) {
        JsonResult result = new JsonResult();
        adminService.saveCategory(category);
        result.setStatus("succeed");
        return result;
    }

    @RequestMapping(value = "/category", method = RequestMethod.PUT)
    @ResponseBody()
    public JsonResult updateCategory(Category category) {
        JsonResult result = new JsonResult();
        adminService.updateCategory(category);
        result.setStatus("succeed");
        return result;
    }

    @RequestMapping(value = "/category/{id}", method = RequestMethod.DELETE)
    @ResponseBody()
    public JsonResult deleteCategory(@PathVariable("id") Long id) {
        JsonResult result = new JsonResult();
        adminService.deleteCategory(id);
        result.setStatus("succeed");
        return result;
    }
}
