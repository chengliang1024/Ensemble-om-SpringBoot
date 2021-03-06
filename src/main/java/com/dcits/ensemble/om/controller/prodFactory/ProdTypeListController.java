package com.dcits.ensemble.om.controller.prodFactory;

import com.alibaba.fastjson.JSON;
import com.dcits.ensemble.om.controller.model.Result;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import com.dcits.ensemble.om.model.dbmodel.MbProdType;
import com.dcits.ensemble.om.repository.prodFactory.MbProdTypeRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by ligan on 2018/8/28.
 */
@Controller
public class ProdTypeListController {
    @Resource
    private MbProdTypeRepository mbProdTypeRepository;

    @RequestMapping("/getProdListByClass")
    public
    @ResponseBody
    Result getProdList(HttpServletResponse response,@RequestBody Map map){
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        String prodClass=(String)map.get("prodClass");
        List<MbProdType> mbProdTypeList= mbProdTypeRepository.findByProdClass(prodClass);
        return   ResultUtils.success(mbProdTypeList);
    }
}
