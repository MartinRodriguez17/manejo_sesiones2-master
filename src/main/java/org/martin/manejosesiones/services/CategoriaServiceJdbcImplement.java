package org.martin.manejosesiones.services;

import org.martin.manejosesiones.models.Categoria;
import org.martin.manejosesiones.repositorio.CategoriaRepositoryJdbcImplement;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class CategoriaServiceJdbcImplement implements CategoriaService {

    //Creamos una variable de tipo CategoriaRepositoryJdbcImplmet
    //creamos una variable de tipo COnnection
    private CategoriaRepositoryJdbcImplement repositoryJdbc;
    public CategoriaServiceJdbcImplement(Connection conn){
        this.repositoryJdbc = new CategoriaRepositoryJdbcImplement(conn);
    }

    @Override
    public List<Categoria> listar() {
        try{
            return repositoryJdbc.listar();
        }catch(SQLException throwables){
            throw  new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }

    @Override
    public Optional<Categoria> porId(Long id) {
        try{
            return Optional.ofNullable(repositoryJdbc.porId(id));
        }catch(SQLException throwables){
            throw  new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }
    @Override
    public void guardar (Categoria categoria){
        try {
            repositoryJdbc.guardar(categoria);
        }catch ( SQLException throwables){
            throw new ServiceJdbcException(throwables.getMessage(),throwables.getCause());
        }
    }
}
