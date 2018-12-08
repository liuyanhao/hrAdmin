package com.lxc.enums;

/**
 * 会员审批状态
 * Created by Lxc on 2018/3/12 0012.
 */
public enum MobilizeState {
    NO_EXAMINE(0,"未审核"),
    PASS(1,"通过"),
    NO_PASS(2,"不通过");

    private int code;

    private String name;

    public int getCode(){
        return code;
    }

    public String getName(){
        return name;
    }

    private MobilizeState(int code, String name){
        this.code = code;
        this.name = name;
    }

    public static MobilizeState getEnum(int code){
        for(MobilizeState enumValue : MobilizeState.values()){
            if(enumValue.getCode() == code){
                return enumValue;
            }
        }
        return null;
    }
}
