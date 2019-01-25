package com.ruoyi;

import org.activiti.engine.*;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * 流程
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@Ignore
public class ActivitiProcessTest {
    private static final Logger logger = LoggerFactory.getLogger(ActivitiProcessTest.class);

    @Autowired
    private ProcessEngineConfiguration processEngineConfiguration;
    @Autowired
    RepositoryService repositoryService;
    @Autowired
    FormService formService;
    @Autowired
    TaskService taskService;


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
    public void showDeployedProcessDefinitionPage() {
        ProcessDefinitionQuery active = repositoryService
                .createProcessDefinitionQuery()
                .latestVersion()
                .active();
    }

    @Test
    public  void showEditorProcessDefinitionPage(){
        List<Model> list = repositoryService.createModelQuery().list();
        for (Model model : list) {
            logger.info(model.getId()+","+model.getName());
        }


    }
    @Test
    @Ignore
    public void showMyProcessInstancesPage(){

        HistoricProcessInstance processInstance = historyService.createHistoricProcessInstanceQuery()
                .startedBy("loginUserId")
                .unfinished()
                .processInstanceId("id").singleResult();
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processInstance.getProcessDefinitionId()
        ).singleResult();


        if (processDefinition == null) {
            processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processInstance.getProcessDefinitionId()
            ).singleResult();
        }

        String itemName = processDefinition.getName() + " (" + processInstance.getId() + ")"
                + (processInstance.getBusinessKey() != null ? processInstance.getBusinessKey() : "");
    }
}
