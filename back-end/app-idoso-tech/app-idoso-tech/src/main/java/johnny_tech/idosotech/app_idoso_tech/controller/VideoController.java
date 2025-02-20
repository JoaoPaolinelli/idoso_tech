package johnny_tech.idosotech.app_idoso_tech.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import johnny_tech.idosotech.app_idoso_tech.model.Video;
import johnny_tech.idosotech.app_idoso_tech.service.VideoService;


@RestController
@RequestMapping("/videos")
public class VideoController {

    
    @Autowired
    VideoService videoService;

    @GetMapping("/show")
    public List<Video> listVideos() {

        // Video video = Video.builder().id_categoria("1").nome("johnny").build();
        //System.out.println("Nome do video by Johnnytech: "+ video.getNome());
        
                return videoService.listAllVideos();
    }

    @GetMapping("/categoria/{id}")
    public List<Video> getVideosByCategory(@PathVariable("id") String idCategoria) {
        return videoService.getVideoByCategory(idCategoria);
    }
}
