package johnny_tech.idosotech.app_idoso_tech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import johnny_tech.idosotech.app_idoso_tech.model.Video;
import johnny_tech.idosotech.app_idoso_tech.repository.VideoRepository;

@Service
public class VideoService {

    @Autowired
    VideoRepository videoRepository;

    public List<Video> listAllVideos() {
        return videoRepository.findAll();
    }
 
}
