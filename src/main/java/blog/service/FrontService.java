package blog.service;

import blog.domain.Article;
import blog.domain.Category;
import blog.domain.Tag;
import blog.repository.ArticleRepository;
import blog.repository.CategoryRepository;
import blog.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.*;

@Service
public class FrontService {
    @Autowired
    private ArticleRepository articleRepository;

    @Autowired
    private TagRepository tagRepository;

    @Autowired
    private CategoryRepository categoryRepository;


    public List<Article> blogList() {
        return articleRepository.findAll();
    }

    public Optional<Article> blogFindById(Long id) {
        return articleRepository.findById(id);
    }

    public Map<Integer, Map<Integer, List<Article>>> blogDateList() {
        List<Article> articles = articleRepository.findAll();
        Map<Integer, Map<Integer, List<Article>>> yearMap = new HashMap<>();

        for (Article article : articles) {
            Date date = article.getCreateTime();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            int year = calendar.get(Calendar.YEAR);

            Map<Integer, List<Article>> monthMap = yearMap.computeIfAbsent(year, key -> new HashMap<>());
            int month = calendar.get(Calendar.MONTH) + 1;

            List<Article> monthList = monthMap.computeIfAbsent(month, key -> new ArrayList<>());
            monthList.add(article);
        }
        return yearMap;
    }


    public List<Tag> tagList() {
        return tagRepository.findAll();
    }

    public Tag getTag(Long id) {
        return tagRepository.getOne(id);
    }

    public List<Category> categoryList() {
        return categoryRepository.findAll();
    }

    public Category getCategory(Long id) {
        return categoryRepository.getOne(id);
    }

    @Transactional
    public Article getArticle(Long id, HttpSession session) {
        Article article = articleRepository.getOne(id);
        String key = "read_time_" + id;
        Object readTime = session.getAttribute(key);
        if (readTime == null) {
            article.setShowCount(article.getShowCount() + 1);
            session.setAttribute(key, new Date());
        } else {
            Date nowTime = new Date();
            long offsetTime = nowTime.getTime() - ((Date)readTime).getTime();
            if (offsetTime / 1000 > 60 * 30) {
                article.setShowCount(article.getShowCount() + 1);
                session.setAttribute(key, new Date());
            }
        }
        return article;
    }

    public List<Article> getArticles(Category category) {
        return articleRepository.findByCategory(category);
    }

    public List<Article> getArticles(Tag tag) {
        return articleRepository.findByTagsContaining(tag);
    }

    public List<Article> getArticlesByKeyword(String keyword) {
        return articleRepository.findByTitleContaining(keyword);
    }
}
