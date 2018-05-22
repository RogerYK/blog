package blog.repository;

import blog.domain.Article;
import blog.domain.Category;
import blog.domain.Tag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Long> {

    List<Article>  findByTitleContaining(String title);

    List<Article> findByCategory(Category category);

    List<Article> findByTagsContaining(Tag tag);

}
