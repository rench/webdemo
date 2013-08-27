/*
 * 描          述:  <描述>
 * 修  改   人:  PengQingyang
 * 修改时间:  2013-8-27
 * <修改描述:>
 */
package com.tx.component.operator.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tx.component.operator.model.Organization;
import com.tx.component.operator.service.OrganizationService;
import com.tx.core.tree.util.TreeUtils;

/**
 * <功能简述>
 * <功能详细描述>
 * 
 * @author  PengQingyang
 * @version  [版本号, 2013-8-27]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
@Controller
@RequestMapping("/organization")
public class OrganizationController {
    
    @Resource(name = "organizationService")
    private OrganizationService organizationService;
    
    /**
      * 跳转到组织查询页面
      *<功能详细描述> [参数说明]
      * 
      * @return void [返回类型说明]
      * @exception throws [异常类型] [异常说明]
      * @see [类、类#方法、类#成员]
     */
    @RequestMapping("/toQueryOrganizationTreeList")
    public String toQueryOrganizationTreeList() {
        
        return "/operator/queryOrganizationTreeList";
    }
    
    /**
     * 跳转到添加组织页面
     *<功能详细描述>
     * @param organization [参数说明]
     * 
     * @return void [返回类型说明]
     * @exception throws [异常类型] [异常说明]
     * @see [类、类#方法、类#成员]
    */
    @RequestMapping("/toAddOrganization")
    @ResponseBody
    public String toAddOrganization() {
        return "/operator/addOrganization";
    }
    
    /**
      * 查询所有组织的树列表<br/>
      *<功能详细描述>
      * @return [参数说明]
      * 
      * @return List<Organization> [返回类型说明]
      * @exception throws [异常类型] [异常说明]
      * @see [类、类#方法、类#成员]
     */
    @RequestMapping("/queryAllOrganizationTreeList")
    @ResponseBody
    public List<Organization> queryAllOrganizationTreeList() {
        
        List<Organization> orgList = this.organizationService.queryOrganizationList();
        
        List<Organization> resTreeList = TreeUtils.changToTree(orgList);
        return resTreeList;
    }
    
    /**
     * 跳转到添加组织结构页面
     *<功能详细描述>
     * @param organization [参数说明]
     * 
     * @return void [返回类型说明]
     * @exception throws [异常类型] [异常说明]
     * @see [类、类#方法、类#成员]
    */
    @RequestMapping("/addOrganization")
    @ResponseBody
    public boolean addOrganization(Organization organization) {
        this.organizationService.insertOrganization(organization);
        
        return true;
    }
    
    /**
      * 更新组织结构信息<br/>
      *<功能详细描述>
      * @param organization
      * @return [参数说明]
      * 
      * @return boolean [返回类型说明]
      * @exception throws [异常类型] [异常说明]
      * @see [类、类#方法、类#成员]
     */
    @RequestMapping("/updateOrganization")
    @ResponseBody
    public boolean updateOrganization(Organization organization){
        //this.organizationService.insertOrganization(organization);
        return true;
    }
    
}