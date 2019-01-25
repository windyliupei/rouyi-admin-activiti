package com.ruoyi;

import com.ruoyi.system.domain.SysUser;
import org.activiti.engine.*;
import org.activiti.engine.identity.User;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
@Ignore
public class ActivitiUserTest {
    private static final Logger logger = LoggerFactory.getLogger(ActivitiUserTest.class);

    @Autowired
    private ProcessEngineConfiguration processEngineConfiguration;
    @Autowired
    RepositoryService repositoryService;
    @Autowired
    FormService formService;
    @Autowired
    TaskService taskService;
    // @Autowired
    // ActTaskService actTaskService;

    @Autowired
    RuntimeService runtimeService;

    @Autowired
    ManagementService managementService;

    @Autowired
    IdentityService identityService;

    @Autowired
    HistoryService historyService;

    @Autowired
    DynamicBpmnService dynamicBpmnService;


    @Test
    public  void test(){
        SysUser user = new SysUser();
        user.setUserId(123123L);
        user.setUserName("系统管理员");
        user.setLoginName("admin1");
        user.setEmail("wx11055@163.com");

        List<User> list = identityService.createUserQuery().list();
        System.out.println(list.size());


    }
}
