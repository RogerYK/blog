package blog.domain;




import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@EntityListeners(AuditingEntityListener.class)
public class Article {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @JsonIgnore
    @ManyToOne
    private User author;

    @Column(name = "title")
    private String title;

    @Column(name = "md_content", columnDefinition = "text")
    private String mdContent;

    @Column(name = "html_content", columnDefinition = "text")
    private String htmlContent;

    @Column(name = "summary", columnDefinition = "text")
    private String summary;

    @Column(name = "create_time")
    @CreatedDate
    private Date createTime;

    @Column(name = "update_time")
    @LastModifiedDate
    private Date updateTime;

    @Column(name = "img_link")
    private String imgLink;

    @Column(name = "show_count", columnDefinition = "tinyint default 0")
    private Integer showCount = 0;

    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST})
    private Category category;

    @JsonIgnore
    @ManyToMany(cascade = {CascadeType.PERSIST})
    @JoinTable(name = "article_tag",
        joinColumns = {@JoinColumn(name = "article_id")},
        inverseJoinColumns = {@JoinColumn(name = "tag_id")})
    private List<Tag> tags;

    @JsonIgnore
    @OneToMany(mappedBy = "belongArticle",cascade = CascadeType.REMOVE)
    private List<Comment> comments;


    public Article() { }

    public Article(String title, String content) {
        this.title = title;
        this.mdContent = content;
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

    public void setId(Long id)
    {
        this.id = id;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getImgLink() {
        return imgLink;
    }

    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }


    public String getHtmlContent() {
        return htmlContent;
    }

    public void setHtmlContent(String htmlContent) {
        this.htmlContent = htmlContent;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getShowCount() {
        return showCount;
    }

    public void setShowCount(Integer showCount) {
        this.showCount = showCount;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}
