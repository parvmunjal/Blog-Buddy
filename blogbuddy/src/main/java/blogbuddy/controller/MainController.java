package blogbuddy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;

import blogbuddy.dao.UserDao;
import blogbuddy.entity.User;

@Controller
public class MainController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping("/signup")
    public String signup() {
        return "signup";
    }

    @RequestMapping(value = "/handle-signup", method = RequestMethod.POST)
    public RedirectView signIn(@ModelAttribute User user, HttpServletRequest request) {
        System.out.println(user);
        userDao.createUser(user);
        RedirectView redirectView = new RedirectView();
        redirectView.setUrl(request.getContextPath() + "/chat");
        return redirectView;
    }

    @RequestMapping("/chat")
    public String chat() {
        return "chat";
    }
    
    @Autowired
    private ObjectMapper objectMapper;

    public MainController(RestTemplate restTemplate, ObjectMapper objectMapper) {
        this.restTemplate = restTemplate;
        this.objectMapper = objectMapper;
    }

    @PostMapping("/generate-blog")
    public String generateBlog(@RequestParam String topic, Model model) {
        // Prepare request headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // Prepare request body
        String requestBody = "{\"input\": {\"topic\": \"" + topic + "\"}}";

        // Make HTTP POST request to the FastAPI server
        String apiUrl = "http://localhost:8000/essay/invoke";
        try {
            String response = restTemplate.postForObject(apiUrl, new HttpEntity<>(requestBody, headers), String.class);
            
            // Parse the JSON response
            JsonNode rootNode = objectMapper.readTree(response);
            String content = rootNode.path("output").path("content").asText();
            
            // Add the blog content to the model
            model.addAttribute("blogContent", content);
            
            // Return the name of the view where the blog content will be displayed
            return "blog-content-view";
        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace();
            // Return an error message or handle the exception as needed
            return "error-view";
        }
    }





}
