package com.controller;

import com.model.*;
import com.service.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.util.MultiValueMap;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.List;
import java.util.Optional;

/* Main web controller for handling all web requests and routing.
   Handles home, dashboard, modules, quizzes, results, and authentication. 
*/

@Controller
public class WebController {

    @Autowired
    private AuthService authService;

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private OpenAIService openAIService;

    @Autowired
    private QuizService quizService;

    @Autowired
    private ResultService resultService;

    // Home page mapping. Sets isHomePage flag for view.
    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("isHomePage", true);
        return "index";
    }

    // Dashboard page for logged-in users. Loads student and module info.
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("isHomePage", false);
        model.addAttribute("activePage", "dashboard");
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        // Check if user is authenticated
        if (auth == null || !auth.isAuthenticated() || auth.getPrincipal().equals("anonymousUser")) {
            return "redirect:/login";
        }
        String emailId = auth.getName();
        Optional<Student> studentOpt = authService.getStudentByEmail(emailId);
        if (studentOpt.isPresent()) {
            Student student = studentOpt.get();
            model.addAttribute("student", student);
            List<LearningModule> modules = moduleService.getAllModules();
            model.addAttribute("modules", modules);
            return "dashboard";
        } else {
            return "redirect:/login";
        }
    }

    /**
     * View a specific module by ID. Fetches content from OpenAI service.
     */
    @GetMapping("/modules/{moduleId}")
    public String viewModule(@PathVariable Long moduleId, 
                           HttpServletRequest request, 
                           Model model) {
        model.addAttribute("isHomePage", false);
        Integer studentId = getStudentIdFromCookie(request);
        if (studentId == null) {
            return "redirect:/login";
        }
        try {
            LearningModule module = moduleService.getModuleById(moduleId);
            model.addAttribute("module", module);
            // Fetch content from OpenAI service
            String moduleContent = openAIService.getModuleContent(module.getModuleName());
            model.addAttribute("moduleContent", moduleContent);
            return "module-detail";
        } catch (RuntimeException e) {
            // Log the error if needed
            return "redirect:/modules";
        }
    }

    // Logout handler. Removes studentId cookie and redirects to login.

    @GetMapping("/logout")
    public String logout(HttpServletResponse response) {
        Cookie cookie = new Cookie("studentId", null);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return "redirect:/login";
    }

    /**
     * Utility method to extract studentId from cookies.
     */
    public static Integer getStudentIdFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("studentId")) {
                    try {
                        return Integer.parseInt(cookie.getValue());
                    } catch (NumberFormatException e) {
                        return null;
                    }
                }
            }
        }
        return null;
    }

    /**
     * List all quizzes and show quizzes page.
     */
    @GetMapping("/quizzes")
    public String listQuizzes(Model model) {
        model.addAttribute("isHomePage", false);
        model.addAttribute("activePage", "quizzes");
        List<Quiz> quizzes = quizService.getAllQuizzes();
        model.addAttribute("quizzes", quizzes);
        model.addAttribute("title", "Quizzes");
        model.addAttribute("content", "quizzes");
        return "layout";
    }

    /**
     * Show quiz page for a specific quiz.
     */
    @GetMapping("/quiz/{quizId}")
    public String takeQuiz(@PathVariable Integer quizId, Model model) {
        model.addAttribute("isHomePage", false);
        Quiz quiz = quizService.getQuizById(quizId);
        if (quiz == null) {
            model.addAttribute("error", "Quiz not found");
            return "redirect:/quizzes";
        }
        List<Question> questions = quizService.getQuestionsByQuizId(quizId);
        model.addAttribute("quiz", quiz);
        model.addAttribute("questions", questions);
        model.addAttribute("title", quiz.getQuizName());
        model.addAttribute("content", "quiz");
        return "layout";
    }

    /**
     * Handle quiz submission, calculate score, and save result.
     */
    @PostMapping("/quiz/{quizId}")
    public String submitQuiz(@PathVariable Integer quizId, @RequestParam MultiValueMap<String, String> formData, Model model, HttpServletRequest request) {
        model.addAttribute("isHomePage", false);
        List<Question> questions = quizService.getQuestionsByQuizId(quizId);
        int score = 0;
        // Calculate score by comparing user answers to correct answers
        for (Question q : questions) {
            String userAns = formData.getFirst("q" + q.getId());
            String correctAns = q.getCorrectAnswer();
            if (userAns != null && correctAns != null && userAns.trim().equalsIgnoreCase(correctAns.trim())) {
                score++;
            }
        }
        Quiz quiz = quizService.getQuizById(quizId);
        model.addAttribute("quiz", quiz);
        model.addAttribute("score", score);
        model.addAttribute("total", questions.size());
        model.addAttribute("questions", questions);
        model.addAttribute("title", quiz != null ? quiz.getQuizName() : "Quiz");
        model.addAttribute("content", "quiz-result");

        // Save result to DB if student is logged in
        try {
            Integer studentId = getStudentIdFromCookie(request);
            if (studentId != null && quiz != null) {
                Optional<Student> studentOpt = authService.getStudentById(studentId);
                if (studentOpt.isPresent()) {
                    Student student = studentOpt.get();
                    Result result = new Result();
                    result.setStudent(student);
                    result.setQuiz(quiz);
                    result.setScore(score);
                    result.setSubmittedAt(java.time.LocalDateTime.now());
                    resultService.save(result);
                }
            }
        } catch (RuntimeException e) {
            // Log error but do not break result page
        }
        return "layout";
    }

    @GetMapping("/results")
    public String viewResults(Model model, HttpServletRequest request) {
        model.addAttribute("isHomePage", false);
        model.addAttribute("activePage", "results");
        Integer studentId = getStudentIdFromCookie(request);
        if (studentId == null) {
            return "redirect:/login";
        }
        Optional<Student> studentOpt = authService.getStudentById(studentId);
        if (studentOpt.isEmpty()) {
            return "redirect:/login";
        }
        Student student = studentOpt.get();
        List<Result> results = resultService.getResultsForStudent(student);
        model.addAttribute("results", results);
        return "results";
    }
}