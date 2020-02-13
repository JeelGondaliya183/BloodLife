package com.bloodlife.service.Impl;

import com.bloodlife.DAO.GalleryRepository;
import com.bloodlife.models.Gallery;
import com.bloodlife.models.Organization;
import com.bloodlife.service.GalleryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GalleryServiceImpl implements GalleryService {

    @Autowired
    GalleryRepository galleryRepository;

    @Override
    public void saveImage(Gallery galleryObj) {
        try{
            galleryRepository.save(galleryObj);
        }catch(Exception ex){
            ex.printStackTrace();

        }

    }

    @Override
    public Gallery findById(long id) {
        return galleryRepository.findById(id);
    }

    @Override
    public List<Gallery> findByOrganization(Organization organization) {
        return galleryRepository.findByOrganization(organization);
    }

    @Override
    public boolean deleteById(long id) {
        try{
            galleryRepository.deleteById(id);
            return true;
        }catch(Exception ex){
            ex.printStackTrace();
            return false;
        }

    }
}
