package blog.controller;

import blog.domain.Article;
import blog.domain.Category;
import blog.domain.Tag;
import blog.service.FrontService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class FrontController {

    @Autowired
    private FrontService frontService;

    @RequestMapping("")
    public String indexPage(Model model) {
        List<Article> articles =  frontService.blogList();
        List<Tag> tags = frontService.tagList();
        List<Category> categories = frontService.categoryList();
        model.addAttribute("articles", articles);
        model.addAttribute("tags", tags);
        model.addAttribute("categories", categories);
        return "front/index";
    }

    @RequestMapping("/detail/{id}")
    public String detailPage(@PathVariable("id") Long id, HttpSession session, Model model) {
        Article article = frontService.getArticle(id, session);
        model.addAttribute("article", article);
        return "front/detail";
    }

    @RequestMapping("/archive")
    public String archivePage(Model model) {
        List<Tag> tags = frontService.tagList();
        List<Category> categories = frontService.categoryList();
        Map<Integer, Map<Integer, List<Article>>> yearMap = frontService.blogDateList();
        model.addAttribute("yearMap", yearMap);
        model.addAttribute("tags", tags);
        model.addAttribute("categories", categories);
        return "front/archive";
    }

    @RequestMapping("/category/{id}")
    public String categoryPage(@PathVariable("id") Long id, Model model) {
        if (id == null) {
            return "common/error";
        }
        List<Tag> tags = frontService.tagList();
        List<Category> categories = frontService.categoryList();
        Category category = frontService.getCategory(id);
        List<Article> articles = frontService.getArticles(category);

        model.addAttribute("currentCategory", category);
        model.addAttribute("articles", articles);
        model.addAttribute("tags", tags);
        model.addAttribute("categories", categories);
        return "front/category";
    }

    @RequestMapping("/tag/{id}")
    public String tagPage(@PathVariable("id") Long id, Model model) {
        if (id == null) {
            return "common/error";
        }
        List<Tag> tags = frontService.tagList();
        List<Category> categories = frontService.categoryList();
        Tag tag = frontService.getTag(id);
        List<Article> articles = frontService.getArticles(tag);

        model.addAttribute("currentTag", tag);
        model.addAttribute("articles", articles);
        model.addAttribute("tags", tags);
        model.addAttribute("categories", categories);
        return "front/tag";
    }

    @RequestMapping("/search")
    public String searchPage(String keyword, Model model) {
        List<Tag> tags = frontService.tagList();
        List<Category> categories = frontService.categoryList();
        List<Article> articles = frontService.getArticlesByKeyword(keyword);

        model.addAttribute("keyword", keyword);
        model.addAttribute("articles", articles);
        model.addAttribute("tags", tags);
        model.addAttribute("categories", categories);
        return "front/search";
    }

    @RequestMapping("/about")
    public String aboutPage(Model model) {
        List<Tag> tags = frontService.tagList();
        List<Category> categories = frontService.categoryList();

        model.addAttribute("tags", tags);
        model.addAttribute("categories", categories);
        return "front/about";
    }
}
