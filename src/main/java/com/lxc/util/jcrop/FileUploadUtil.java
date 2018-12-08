package com.lxc.util.jcrop;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * jcrop 上传头像工具 (文件上传工具类)
 * Created by liuxicai on 2018/3/10 0010.
 */
public class FileUploadUtil {
    public static final List<String> ALLOW_TYPES = Arrays.asList(
        "image/jpg","image/jpeg","image/png","image/gif"
);
    //文件重命名
    public static String rename(String fileName){
        int i = fileName.lastIndexOf(".");
        String str = fileName.substring(i);
        return new Date().getTime()+""+ new Random().nextInt(99999999) +str;
    }
    //校验文件类型是否是被允许的
    public static boolean allowUpload(String postfix){
        return ALLOW_TYPES.contains(postfix);
    }
}
