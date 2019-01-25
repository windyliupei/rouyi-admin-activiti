package com.ruoyi;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.ruoyi.web.controller.activiti.ProcessController;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentQuery;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.Job;
import org.activiti.engine.runtime.ProcessInstance;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@RunWith(SpringRunner.class)
@SpringBootTest
@Ignore
public class ActivitiTest {
    private static final Logger Log = LoggerFactory.getLogger(ProcessController.class);

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
    @Ignore
    public  void load() throws JsonProcessingException {

        Log.info("===流程定义数========>>>>" + repositoryService.createProcessDefinitionQuery().count());

        for (ProcessDefinition p : repositoryService.createProcessDefinitionQuery().list()) {
            Log.info(p.getId() + "," + p.getDeploymentId()+","+p.getName()+","+p.getCategory()+","+p.getResourceName()+",version:"+p.getVersion()+","+ p.getKey());
        }


        // Log.info("根据key启动一个流程======>>");
        // ProcessInstance onboarding = runtimeService.startProcessInstanceByKey("onboarding");
        // Log.info("businessKey:"+onboarding.getBusinessKey()+",dep"+onboarding.getDeploymentId());
        // long count = runtimeService.createProcessInstanceQuery().count();
        // System.out.println("===流程实例========>>>>" + count);
        // ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().list().get(0);

        //
        // List<Task> list = taskService.createTaskQuery().list();
        // System.out.println("=====任务========>>>>"+list.size());
        // List<Task> tasks = taskService.createTaskQuery().list();
        // for (Task task : tasks) {
        //     Log.info("Task available: " +task.getId()+","+ task.getName()+","+task.getAssignee()+","+task.getOwner()+","+task.getDueDate()+","+ task.getAssignee());
        //     FormData formData = formService.getTaskFormData(task.getId());
        //     Log.info(formData.getFormKey()+","+formData.getDeploymentId()+",");
        //     List<FormProperty> formProperties = formData.getFormProperties();
        //     Log.info(new ObjectMapper().writeValueAsString(formProperties));
        // }
        // Map<String, Object> variables = new HashMap<>();
        // Task task = tasks.get(0);
        // variables.put("fullName","matosiki");
        // variables.put("yearsOfExperience",10L);
        // taskService.complete(task.getId(), variables);
        //
        // List<HistoricActivityInstance> activities =
        //         historyService.createHistoricActivityInstanceQuery()
        //                 .processInstanceId(processInstance.getId()).finished()
        //                 .orderByHistoricActivityInstanceEndTime().asc()
        //                 .list();
        //
        // for (HistoricActivityInstance activity : activities) {
        //     if (activity.getActivityType() == "startEvent") {
        //         Log.info("BEGIN " + activity.getActivityId()
        //                 + " [" + processInstance.getProcessDefinitionKey()
        //                 + "] " + activity.getStartTime());
        //     }
        // }
    }


    /**
     * 脱裤 获取流程实例的每张表数据数
     *
     * 数据库
     */

    @Test
    public void mangerGetTableCount() {


        TreeMap<String, Long> tables = new TreeMap<String, Long>(managementService.getTableCount()); // treemap because we want to sort it on name
        for (String tableName : tables.keySet()) {
            System.out.println("addItem======>"+tableName);

            if (tableName.contains("ACT_HI")) {
                System.out.println("icon" + "DATABASE_HISTORY");
            } else if (tableName.contains("ACT_RU")) {
                System.out.println("icon" + "DATABASE_RUNTIME");

            } else if (tableName.contains("ACT_RE")) {
                System.out.println("icon" + "DATABASE_REPOSITORY");

            } else if (tableName.contains("ACT_ID")) {
                System.out.println("icon" + "DATABASE_IDENTITY");
            } else {
                System.out.println("icon" + "未知类型");
            }

            System.out.println("tableName"+" (" + tables.get(tableName) + ")");
        }
    }

    /**
     * 直接获取某张表数据
     */
    @Test
    public void managerTableQuery() {
        List<Map<String, Object>> rows = managementService.createTablePageQuery().tableName("sys_job").listPage(1, 10).getRows();

        for (Map<String, Object> row : rows) {
            for (String k : row.keySet()) {
                System.out.println("k===>"+k+",value===>"+row.get(k));
            }
        }

    }

    @Test
    public void getDateDeployPackage(){
        DeploymentQuery deploymentListQuery = repositoryService.createDeploymentQuery()
                .orderByDeploymentName().asc()
                .orderByDeploymentId().asc();
        for (Deployment deployment : deploymentListQuery.list()) {
            System.out.println("id===>"+ deployment.getId()+"");
            Deployment d = repositoryService.createDeploymentQuery().deploymentId(deployment.getId()).singleResult();

            System.out.println(d.getId()+",,,,,,"+d.getName());

            if (deployment.getName() != null) {
                System.out.println("name==>"+ deployment.getName());
            } else {
                System.out.println("name==>"+ "deployment.no.name");
            }
        }
    }

    @Test
    public void showActiveProcessDefinitionsPage(){
        List<ProcessDefinition> processDefinitions = repositoryService.createProcessDefinitionQuery()
                .active()
                .orderByProcessDefinitionName().asc()
                .orderByProcessDefinitionVersion().asc()
                .listPage(0, 10);

        for (ProcessDefinition processDefinition : processDefinitions) {
            String id = processDefinition.getId();
            repositoryService.createProcessDefinitionQuery()
                    .processDefinitionId(id).singleResult();
            System.out.println("获取活动流程 id==>"+id+"name==>"+processDefinition.getName());

        }

    }

    @Test
    public void showSuspendedProcessDefinitionsPage(){
        List<ProcessDefinition> processDefinitions = repositoryService.createProcessDefinitionQuery()
                .suspended()
                .orderByProcessDefinitionName().asc()
                .orderByProcessDefinitionVersion().asc()
                .listPage(0, 10);
        for (ProcessDefinition processDefinition : processDefinitions) {
            String id = processDefinition.getId();
            repositoryService.createProcessDefinitionQuery()
                    .processDefinitionId(id).singleResult();
            System.out.println("获取挂起的流程id==>"+id+"name:"+processDefinition.getName());
        }

    }


    @Test
    public void showJobPage(){
        List<Job> jobs = managementService.createJobQuery()
                .orderByJobDuedate().asc()
                .orderByJobId().asc()
                .list();
        for (Job job : jobs) {
            Job j = managementService.createJobQuery().jobId(job.getId()).singleResult();
            System.out.println("获取作业==》"+j.getId()+"dueDate:"+j.getDuedate());
        }
    }

    @Test
    public void showUserPage(){
        List<User> users = identityService.createUserQuery()
                .orderByUserFirstName().asc()
                .orderByUserLastName().asc()
                .orderByUserId().asc()
                .listPage(0, 10);

        for (User user : users) {
            User u = identityService.createUserQuery().userId(user.getId()).singleResult();
            System.out.println("id:"+u.getId()+",name:"+u.getFirstName());
        }
    }

    @Test
    public  void showGroupPage(){
        List<Group> groups = identityService.createGroupQuery()
                .orderByGroupId().asc()
                .orderByGroupName().asc()
                .listPage(0, 10);

        for (Group group : groups) {
            Group g = identityService.createGroupQuery().groupId(group.getId()).singleResult();
            System.out.println("组"+g.getId());
        }
    }

    @Test
    public void showProcessInstancePage(){
        List<ProcessInstance> processInstances = runtimeService.createProcessInstanceQuery()
                .orderByProcessInstanceId().asc()
                .listPage(0, 1);
        for (ProcessInstance processInstance : processInstances) {
            String id = processInstance.getDeploymentId();
            // ProcessDefinition definition = repositoryService.createProcessDefinitionQuery()
            //         .processDefinitionId(id).singleResult();
            // System.out.println("活动的流程实例：id"+definition.getDeploymentId()+",name===>"+definition.getName());
        }
    }

    @Test
    public void dataBaseDetail(){
        String databaseType = processEngineConfiguration.getDatabaseType();
        System.out.println("数据库类型:"+databaseType);
        String databaseSchemaUpdate = processEngineConfiguration.getDatabaseSchemaUpdate();
        System.out.println("更新数据库Schema:"+databaseSchemaUpdate);
        String databaseConfigType = getDatabaseType(processEngineConfiguration);
        System.out.println("Database configuration:"+databaseConfigType);
        if ("JNDI".equals(databaseConfigType)) {
            System.out.println("数据源类:"+processEngineConfiguration.getDataSourceJndiName());
        } else if ("Datasource".equals(databaseConfigType)) {
            System.out.println("数据源类:" +processEngineConfiguration.getDataSource().getClass().getName());
        } else {
            System.out.println("数据源类:" +processEngineConfiguration.getJdbcUrl());
        }
    }

    protected String getDatabaseType(ProcessEngineConfiguration processEngineConfiguration) {
        String databaseType = null;
        if (processEngineConfiguration.getDataSourceJndiName() != null) {
            databaseType = "JNDI";
        } else if (processEngineConfiguration.getDataSource() != null) {
            databaseType = "Datasource";
        } else {
            databaseType = "JDBC config";
        }
        return databaseType;
    }

    @Test
    public void showCrystalBallPage(){
        List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery().orderByProcessDefinitionName().asc().list();
        Map<String, ProcessDefinition> definitionMap = new HashMap<String, ProcessDefinition>();
        for (ProcessDefinition processDefinition : list) {
            definitionMap.put(processDefinition.getId(), processDefinition);

        }
        List<HistoricProcessInstance> instanceList = historyService.createHistoricProcessInstanceQuery().orderByProcessInstanceStartTime().desc().list();
        for (HistoricProcessInstance processInstance : instanceList) {

            ProcessDefinition definition = definitionMap.get(processInstance.getProcessDefinitionId());
            String definitionName = "";
            if (definition != null) {
                if (definition.getName() != null) {
                    definitionName = definition.getName();
                } else {
                    definitionName = definition.getId();
                }

                definitionName += " (v" + definition.getVersion() + ")";
            }

            System.out.println(new String[]{processInstance.getId()+","+
                    definitionName + "," + processInstance.getStartTime().toString() + "," +
                    processInstance.getEndTime() != null ? processInstance.getEndTime().toString() : ""} + "," + processInstance.getId());
        }

    }
}
