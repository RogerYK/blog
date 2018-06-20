package blog.domain.form;

public class CommentForm {

    private Long replyArticleId;

    private Long replyCommentId;

    private String replyUsername;

    private String content;

    public Long getReplyCommentId() {
        return replyCommentId;
    }

    public void setReplyCommentId(Long replyCommentId) {
        this.replyCommentId = replyCommentId;
    }

    public String getReplyUsername() {
        return replyUsername;
    }

    public void setReplyUsername(String replyUsername) {
        this.replyUsername = replyUsername;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getReplyArticleId() {
        return replyArticleId;
    }

    public void setReplyArticleId(Long replyArticleId) {
        this.replyArticleId = replyArticleId;
    }
}
