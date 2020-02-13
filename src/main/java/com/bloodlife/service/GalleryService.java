package com.bloodlife.service;

import com.bloodlife.models.Gallery;
import com.bloodlife.models.Organization;

import java.util.List;

public interface GalleryService {

    public void saveImage(Gallery galleryObj);
    public Gallery findById(long id);
    public List<Gallery> findByOrganization(Organization organization);
    public  boolean deleteById(long id);
}
