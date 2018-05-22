package blog.service;

import blog.domain.Article;
import blog.domain.Category;
import blog.domain.Tag;
import blog.domain.form.ArticleForm;
import blog.repository.ArticleRepository;
import blog.repository.CategoryRepository;
import blog.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class AdminService {
    @Autowired
    private ArticleRepository articleRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private TagRepository tagRepository;

    public Optional<Article> blogFindById(Long id) {
        return articleRepository.findById(id);
    }

    public void saveArticle(ArticleForm articleForm) {
        Article article = new Article();
        article.setId(articleForm.getId());
        article.setTitle(articleForm.getTitle());
        article.setSummary(articleForm.getSummary());
        article.setHtmlContent(articleForm.getHtmlContent());
        article.setMdContent(articleForm.getMdContent());

        String[] tagNames = articleForm.getTagNames().split(";");
        List<Tag> tags = new ArrayList<>();
        for (String tagName : tagNames) {
            Tag tag = tagRepository.findByName(tagName);
            if (tag == null) {
                tag = new Tag(tagName);
            }
            tags.add(tag);
        }
        article.setTags(tags);

        String categoryName = articleForm.getCategoryName();
        Category category = categoryRepository.findByName(categoryName);
        if (category == null) {
            category = new Category(categoryName);
        }
        article.setCategory(category);

        MultipartFile img = articleForm.getArticleImg();
        if (img != null) {
            System.out.println(img.getOriginalFilename());
            String[] filePath = img.getOriginalFilename().split("\\\\");
            String fileName = "";           //暂时不考虑文件名重复问题。
            fileName = filePath[filePath.length - 1];
            if (!fileName.isEmpty()) {
                File path = new File(new File("upload/imgs/").getAbsolutePath(),
                        fileName);
                if (!path.getParentFile().exists()) {
                    path.getParentFile().mkdirs();
                }
                try {
                    img.transferTo(path);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                article.setImgLink("/imgs/" + fileName);
            }
        }

        articleRepository.save(article);
    }


    public void deleteArticle(Long id) {
        articleRepository.deleteById(id);
    }

    public List<Article> articleList() {
        List<Article> articles = articleRepository.findAll();
        return articles;
    }

    public void deleteTag(Long id) {
        tagRepository.deleteById(id);
    }

    public void updateTag(Tag tag) {
        tagRepository.save(tag);
    }

    public void saveTag(Tag tag) {
        tagRepository.save(tag);
    }

    public List<Tag> tagList() {
        return tagRepository.findAll();
    }

    public void saveCategory(Category category) {
        categoryRepository.save(category);
    }

    public void deleteCategory(Long id) {
        categoryRepository.deleteById(id);
    }

    public void updateCategory(Category category) {
        categoryRepository.save(category);
    }

    public List<Category> categoryList() {
        return categoryRepository.findAll();
    }
}
