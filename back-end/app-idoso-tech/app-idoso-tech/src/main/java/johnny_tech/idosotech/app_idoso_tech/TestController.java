package johnny_tech.idosotech.app_idoso_tech;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class TestController {
    @GetMapping("/ping")
    public String ping() {
        return "API está rodando!";
    }
}