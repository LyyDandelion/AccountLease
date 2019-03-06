package com.ecit.service;

import com.ecit.common.ResponseData;
import com.ecit.bean.Category;

import java.util.List;

/**
 * lyy
 */
public interface ICategoryService {
    ResponseData addCategory(String categoryName, Integer parentId);
    ResponseData updateCategoryName(Integer categoryId, String categoryName);
    ResponseData<List<Category>> getChildrenParallelCategory(Integer categoryId);
    ResponseData<List<Integer>> selectCategoryAndChildrenById(Integer categoryId);

    ResponseData<Category> getCategoryByCode(String code);
}
