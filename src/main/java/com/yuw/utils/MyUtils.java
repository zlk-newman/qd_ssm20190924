package com.yuw.utils;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public class MyUtils {

    /**
     * 单个文件上传
     *
     * @param file_userimg       文件流对象
     * @param userInfoBean       保存文件路径进行的实体类参数
     * @param serverFileSavePath 服务器保存文件的路径地址
     * @param fileNamePrefix     上传文件的前缀
     */
    public static void uploadSingleFile(MultipartFile file_userimg, Object userInfoBean, String serverFileSavePath, String fileNamePrefix) {
        // springmvc将form表单中的file控件的流文件内容映射到 MultipartFile 形参变量file_userimg上

        /*
         * 1、在服务器上创建保存文件的目录
         */
        // 将文件对象file_userimg 中的文件流上传到服务器
        // 获取文件的服务器的保存路径
        System.out.println("basepath:" + System.getProperty("server.basePath"));
        // 当前项目在web服务器上的部署的绝对路径：例如：D:\yuwworkspace\QSTWorkspace\ssm20190920\target\ssm20190920
        String serverBasePath = System.getProperty("server.basePath");

        // 设置服务器的保存文件的路径名
        //String serverFileSavePath = "uploadfiles/userimgfiles/";
        // 完整的服务器保存路径为 serverBasePath+ serverFileSavePath
        String serverSavePath = serverBasePath + serverFileSavePath;
        // 验证服务器是否已经创建了该目录
        File fileSave = new File(serverSavePath);
        // 判断保存路径文件对象是否存在
        if (!fileSave.exists()) {
            // 创建该目录
            fileSave.mkdirs();
        }

        /*
         * 2、给上传文件进行重命名：命名规则： 前缀+系统时间毫秒数+文件后缀
         */
        // 文件需要在服务器上进行重命名，然后进行保存
        // 获取文件类型
        String fileContentType = file_userimg.getContentType();
        // 获取文件后缀
        String fileType = fileContentType.substring(fileContentType.indexOf("/") + 1);
        // 文件名前缀
        //String fileNamePrefix = "userimg";
        // 生成新的文件名
        String fileNewName = fileNamePrefix + System.currentTimeMillis() + "." + fileType;
        System.out.println("新文件名：" + fileNewName);

        /*
         * 3、将文件以流的形式写出到服务器指定目录
         */
        // 将文件流写出到服务器保存路径
        try {
            file_userimg.transferTo(new File(serverSavePath + fileNewName));
        } catch (IOException e) {
            System.out.println("文件上传异常：" + e.getMessage());
            e.printStackTrace();
        }

        /*
         * 4、将文件在服务器的访问的相对路径，保存到实体类对应的成员变量属性上
         *
         */
        // 需要保存的文件的访问路径
        String fileRelativePath = serverFileSavePath + fileNewName;
        System.out.println("文件的访问路径：" + fileRelativePath);
        // 将文件对象的访问路径映射给实体类对象的成员属性上
        //userInfoBean.setUserimg(fileRelativePath);
        // 使用反射，将设置属性的方法具有通用性
        // 提取需要保存的属性名
        String propertyName = file_userimg.getName().replace("file_", "");
        try {
            // 课下作业：不使用BeanUtils，使用原生的反射，如何实现？
            BeanUtils.setProperty(userInfoBean, propertyName, fileRelativePath);
        } catch (Exception e) {
            System.out.println("文件上传异常：" + e.getMessage());
            e.printStackTrace();
        }
    }
}
