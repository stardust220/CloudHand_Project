/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cloudhand.domain;

/**
 *
 * @author Administrator
 */
public class CHException extends Exception {

    /**
     * Creates a new instance of <code>VGBException</code> without detail
     * message.
     */
    public CHException() {
    }

    /**
     * Constructs an instance of <code>VGBException</code> with the specified
     * detail message.
     *
     * @param msg the detail message.
     */
    public CHException(String msg) {
        super(msg);
    }

    //for JDBC
    public CHException(String message, Throwable cause) {
        super(message, cause);
    }
    
}
