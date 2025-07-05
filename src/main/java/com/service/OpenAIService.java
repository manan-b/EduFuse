package com.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;

import java.util.HashMap;
import java.util.Map;

@Service
public class OpenAIService {

    @Value("${openai.api.key:}")
    private String apiKey;

    @Value("${openai.api.url:https://api.openai.com/v1/chat/completions}")
    private String apiUrl;

    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;

    public OpenAIService() {
        this.restTemplate = new RestTemplate();
        this.objectMapper = new ObjectMapper();
    }

    public String getModuleContent(String moduleTitle) {
        if (apiKey == null || apiKey.isEmpty()) {
            return getDefaultContent(moduleTitle);
        }
        try {
            String prompt = createSpecificPrompt(moduleTitle);
            String response = callOpenAI(prompt);
            return parseResponse(response);
        } catch (Exception e) {
            return getDefaultContent(moduleTitle);
        }
    }

    private String createSpecificPrompt(String moduleTitle) {
        String basePrompt = "Create comprehensive educational content for a Java programming module titled '" + moduleTitle + "'. ";
        String formatInstructions = "Format the response as plain text with proper structure. Use clear headings, bullet points, and code examples. For code blocks, use triple backticks (```) to mark the beginning and end of code sections. Make it engaging and suitable for students learning Java programming. Include practical examples and best practices.";
        String specificContent = getSpecificModuleContent(moduleTitle);
        return basePrompt + specificContent + formatInstructions;
    }

    private String getSpecificModuleContent(String moduleTitle) {
        return "Provide a comprehensive overview of Java programming concepts with practical examples and best practices.";
    }

    private String callOpenAI(String prompt) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Authorization", "Bearer " + apiKey);
            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("model", "gpt-3.5-turbo");
            Map<String, String> message = new HashMap<>();
            message.put("role", "user");
            message.put("content", prompt);
            requestBody.put("messages", new Object[]{message});
            requestBody.put("max_tokens", 3000);
            requestBody.put("temperature", 0.7);
            HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, headers);
            ResponseEntity<String> response = restTemplate.postForEntity(apiUrl, request, String.class);
            return response.getBody();
        } catch (Exception e) {
            throw e;
        }
    }

    private String parseResponse(String response) {
        try {
            JsonNode jsonNode = objectMapper.readTree(response);
            JsonNode choices = jsonNode.get("choices");
            if (choices != null && choices.isArray() && choices.size() > 0) {
                JsonNode firstChoice = choices.get(0);
                JsonNode message = firstChoice.get("message");
                if (message != null) {
                    String content = message.get("content").asText();
                    return content;
                }
            }
            return "Content not available";
        } catch (Exception e) {
            return "Content not available";
        }
    }

    private String getDefaultContent(String moduleTitle) {
        // Return comprehensive default content for each module in plain text format
        return """
            Java Programming
            
            Welcome to the Java programming module. This module covers essential concepts and best practices in Java development.
            
            Please select a specific module to view detailed content.
            """;
    }
} 