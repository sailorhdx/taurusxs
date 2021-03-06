
package com.taurusx.xsite.common.web;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.ckfinder.connector.configuration.Configuration;
import com.taurusx.xsite.common.config.Global;
import com.taurusx.xsite.common.utils.FileUtils;
import com.taurusx.xsite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.taurusx.xsite.modules.sys.utils.UserUtils;

/**
 * CKFinder配置
 * 
 * @author ThinkGem
 * @version 2014-06-25
 */
public class CKFinderConfig extends Configuration {

    public CKFinderConfig(ServletConfig servletConfig) {
        super(servletConfig);
    }

    @Override
    protected Configuration createConfigurationInstance() {
        Principal principal = (Principal) UserUtils.getPrincipal();
        if (principal == null) {
            return new CKFinderConfig(this.servletConf);
        }
        try {
            this.baseURL = FileUtils.path(Servlets.getRequest().getContextPath()
                    + Global.USERFILES_BASE_URL + principal + "/");
            this.baseDir = FileUtils.path(Global.getUserfilesBaseDir()
                    + Global.USERFILES_BASE_URL + principal + "/");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return new CKFinderConfig(this.servletConf);
    }

    /**
     * CKFinder 建议通过重写 checkAuthentication 方法来控制用户操作权限，
     * 用户具有权限时，才允许用户具有 CKFinder 的操作权限
     */
    @Override
    public boolean checkAuthentication(final HttpServletRequest request) {
        return UserUtils.getPrincipal() != null;
    }

}
