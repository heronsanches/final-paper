package tcc.heronsanches.ufba.utils;

public class Constants {

    public static final String STATUS = "status";
    public static final String MESSAGE = "message";
    public static final String SERVICE_ACTIVATED = "service activated";

    /**
     * Incorrect name parameter or without parameter
     */
    public static final byte VERIFY_PARAMETER_NAME = 1;

    public static final byte EMPTY_PARAMETER = 2;
    public static final byte INCORRECT_PARAMETER_VALUE = 3;

    /**
     * It means that request's answer is valid
     */
    public static final byte OK = 4;

    public static final byte NOT_FOUND = 5;

    public static final byte ERROR = 6;

    public static final byte NO_DATA = 7;

    public static final byte NOT_UPDATED = 8;


    private Constants() {}
    

}