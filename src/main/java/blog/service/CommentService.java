package blog.service;

import blog.domain.Article;
import blog.domain.Comment;
import blog.domain.User;
import blog.domain.form.CommentForm;
import blog.repository.ArticleRepository;
import blog.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    ArticleRepository articleRepository;

    public void saveComment(CommentForm form) {
        Comment comment = new Comment();
        comment.setAuthor((User) UserService.getCurrentUser());
        comment.setContent(form.getContent());
        Long replyId = form.getReplyCommentId();
        if (replyId != null) {
            Comment replyComment = commentRepository.getOne(replyId);
            Comment topComment = replyComment.getParentComment();   //判断是否为顶级评论
            if (topComment == null) {
                topComment = replyComment;
            }
            comment.setParentComment(topComment);
            comment.setReplyName(form.getReplyUsername());
        } else {
            Article article = articleRepository.getOne(form.getReplyArticleId());
            comment.setBelongArticle(article);
        }
        System.out.println("comment content:" + form.getContent());
        System.out.println("comment article id:" + form.getReplyArticleId());
        commentRepository.save(comment);
    }
}
