package blog.domain.form;

import blog.domain.Article;
import blog.domain.Tag;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class ArticleForm {

    private Long id;

    private String title;

    private String mdContent;

    private String htmlContent;

    private String summary;

    private MultipartFile articleImg;

    private String categoryName;

    private String tagNames;

    public ArticleForm() { }

    public ArticleForm(Article article) {
        setId(article.getId());
        setTitle(article.getTitle());
        setMdContent(article.getMdContent());
        setHtmlContent(article.getHtmlContent());
        setSummary(article.getSummary());
        setCategoryName(article.getCategory().getName());
        List<Tag> tags = article.getTags();
        if (tags != null) {
            StringBuilder tagNames = new StringBuilder();
            for (Tag tag : tags) {
                tagNames.append(tag.getName());
                tagNames.append(";");
            }
            setTagNames(tagNames.toString());
        }
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMdContent() {
        return mdContent;
    }

    public void setMdContent(String mdContent) {
        this.mdContent = mdContent;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getHtmlContent() {
        return htmlContent;
    }

    public void setHtmlContent(String htmlContent) {
        this.htmlContent = htmlContent;
    }

    public MultipartFile getArticleImg() {
        return articleImg;
    }

    public void setArticleImg(MultipartFile articleImg) {
        this.articleImg = articleImg;
    }

    public String toString() {
        return title + mdContent + htmlContent + summary + articleImg.toString() + categoryName + tagNames;
    }

    public String getTagNames() {
        return tagNames;
    }

    public void setTagNames(String tagNames) {
        this.tagNames = tagNames;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
