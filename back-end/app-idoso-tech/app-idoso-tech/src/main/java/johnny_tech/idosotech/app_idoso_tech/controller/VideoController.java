package johnny_tech.idosotech.app_idoso_tech.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import johnny_tech.idosotech.app_idoso_tech.service.VideoService;

import johnny_tech.idosotech.app_idoso_tech.model.Video;

@RestController
@RequestMapping("/videos")
public class VideoController {

    
    @Autowired
    VideoService videoService;

    @GetMapping("/show")
    public List<Video> listVideos() {
        return videoService.listAllVideos();
    }
}
