package johnny_tech.idosotech.app_idoso_tech;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@ConfigurationProperties
@Configuration
public class WebConfig implements WebMvcConfigurer {

    // Configuração CORS global
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")  // Permite acesso para todos os endpoints
                .allowedOrigins("http://10.0.2.2:8080", "http://192.168.x.x:8080", "http://localhost:4200", "http://localhost:8080")  // Permite acesso das origens do Flutter (substitua conforme necessário)
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")  // Métodos HTTP permitidos
                .allowedHeaders("*")  // Permite qualquer cabeçalho
                .allowCredentials(true)  // Permite credenciais como cookies ou tokens de autenticação
                .maxAge(3600);  // Cache do pre-flight para 1 hora (opcional)
    }
}
