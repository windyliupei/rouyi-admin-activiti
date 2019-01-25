package com.ruoyi;

import org.activiti.engine.*;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.task.Task;
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
 * 任务单元测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@Ignore
public class ActivitiTaskTest {
    private static final Logger Log = LoggerFactory.getLogger(ActivitiTaskTest.class);

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
    public void showTasksPage(){

        List<Task> tasks = taskService.createTaskQuery().listPage(0, 10);
        for (Task task : tasks) {
            System.out.println(task.getId());
        }
        taskService.createTaskQuery().taskOwner("1212").orderByTaskId().asc();

    }

    @Test
    public void showInboxPage(){

        List<Task> tasks = taskService.createTaskQuery().listPage(0, 10);
        for (Task task : tasks) {
            System.out.println(task.getId());
        }

        //
        taskService.createTaskQuery().taskAssignee("").orderByTaskId().asc();
    }

    @Test
    public void showQueuedPage(){

        List<Task> tasks = taskService.createTaskQuery().listPage(0, 10);
        for (Task task : tasks) {
            System.out.println(task.getId());
        }


        taskService.createTaskQuery().taskCandidateGroup("groupId").taskUnassigned().orderByTaskId().asc();

    }

    /**
     * 受邀任务
     */
    @Test
    public void showInvolvedPage(){
        taskService.createTaskQuery().taskInvolvedUser("userId").orderByTaskId().asc();
    }

    /**
     * 已归档任务
     */
    @Test
    public void showArchivedPage(){
        List<HistoricTaskInstance> historicTaskInstances = historyService.createHistoricTaskInstanceQuery().taskOwner("userId").finished().listPage(0, 10);
        for (HistoricTaskInstance historicTaskInstance : historicTaskInstances) {
            System.out.println(historicTaskInstance.getName()+","+historicTaskInstance.getClaimTime());
        }

    }



}
