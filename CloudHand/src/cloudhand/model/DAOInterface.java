/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cloudhand.model;

import cloudhand.domain.CHException;

/**
 *
 * @author Administrator
 */
public interface DAOInterface<K, T> {
    abstract void insert(T data) throws CHException;
    void update(T data) throws CHException;
    public abstract void delete(T data) throws CHException;
    public T get(K id) throws CHException;
    //List<T> getAll();
}
