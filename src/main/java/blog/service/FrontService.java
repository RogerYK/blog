package blog.service;

import blog.domain.Article;
import blog.domain.Category;
import blog.domain.Tag;
import blog.repository.ArticleRepository;
import blog.repository.CategoryRepository;
import blog.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
