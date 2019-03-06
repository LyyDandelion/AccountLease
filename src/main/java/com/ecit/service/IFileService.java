package com.ecit.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * lyy
 */
public interface IFileService {

    String upload(MultipartFile file, String path);
}
