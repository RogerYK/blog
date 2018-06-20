package blog.controller;

import blog.domain.form.CommentForm;
import blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> comment(CommentForm form) {
        commentService.saveComment(form);
        Map<String, Object> result = new HashMap<>();
        result.put("success", Boolean.TRUE);
        return result;
    }
}
