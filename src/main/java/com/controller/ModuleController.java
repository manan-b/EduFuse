package com.controller;

import com.model.LearningModule;
import com.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Controller
@RequestMapping("/modules")
public class ModuleController {

    @Autowired
    private ModuleService moduleService;

    @GetMapping
    public String getAllModules(Model model) {
        model.addAttribute("isHomePage", false);
        model.addAttribute("activePage", "modules");
        List<LearningModule> modules = moduleService.getAllModules();
        model.addAttribute("modules", modules);
        return "modules";
    }

    @GetMapping("/{id}")
    public String getModuleById(@PathVariable Long id, Model model) {
        model.addAttribute("isHomePage", false);
        LearningModule module = moduleService.getModuleById(id);
        model.addAttribute("module", module);
        return "module-detail";
    }
}
