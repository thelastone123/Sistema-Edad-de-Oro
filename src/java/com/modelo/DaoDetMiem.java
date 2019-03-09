 
package com.modelo;

import java.sql.*;
import java.util.*;
import com.conexion.Conexion;

/**
 *
 * @author Andrés Alfaro
 */
public class DaoDetMiem extends Conexion{
    public List<DetMiem> mostrar() throws Exception
    {
        List<DetMiem> lista = new ArrayList();
        ResultSet rs;
        
        try 
        {
            this.conectar();
            String sql = "select * from detalleMiembro;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            
            while(rs.next())
            {
                DetMiem dm = new DetMiem();
                dm.setIdMiembro(rs.getInt("idMiembro"));
                dm.setFechaIngreso(rs.getString("fechaIngreso"));
                dm.setFechaNacimiento(rs.getString("fechaNacimiento"));
                dm.setMedicamentos(rs.getString("medicamentos"));
                dm.setDiscapacidad(rs.getString("discapacidad"));
                dm.setEnfermedad(rs.getString("enfermedad"));
                dm.setNombreEmergencia(rs.getString("nombreEmergencia"));
                dm.setParentesco(rs.getString("parentesco"));
                dm.setTelefonoEmergencia(rs.getString("telefonoEmergencia"));
                
                lista.add(dm);
            }
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        
        return lista;
    }
    
    public List<DetMiem> filtrarDet() throws Exception
    {
        List<DetMiem> lista = new ArrayList();
        ResultSet rs;
        
        try 
        {
            this.conectar();
            String sql = "select * from detalleMiembro where hasDetail <> 2";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            
            while(rs.next())
            {
                DetMiem dm = new DetMiem();
                dm.setIdMiembro(rs.getInt("idMiembro"));
                dm.setFechaIngreso(rs.getString("fechaIngreso"));
                dm.setFechaNacimiento(rs.getString("fechaNacimiento"));
                dm.setMedicamentos(rs.getString("medicamentos"));
                dm.setDiscapacidad(rs.getString("discapacidad"));
                dm.setEnfermedad(rs.getString("enfermedad"));
                dm.setNombreEmergencia(rs.getString("nombreEmergencia"));
                dm.setParentesco(rs.getString("parentesco"));
                dm.setTelefonoEmergencia(rs.getString("telefonoEmergencia"));
                
                lista.add(dm);
            }
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        
        return lista;
    }
    
    public void insertar(DetMiem dm) throws Exception
    {
        Miembros m = new Miembros();
        DaoMiembros dao = new DaoMiembros();
        try 
        {
            this.conectar();
            String sql = "insert into detalleMiembro values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setInt(1, dm.getIdMiembro());
            pre.setString(2, dm.getFechaIngreso());
            pre.setString(3, dm.getFechaNacimiento());
            pre.setString(4, dm.getMedicamentos());
            pre.setString(5, dm.getDiscapacidad());
            pre.setString(6, dm.getEnfermedad());
            pre.setString(7, dm.getNombreEmergencia());
            pre.setString(8, dm.getParentesco());
            pre.setString(9, dm.getTelefonoEmergencia());
            pre.setInt(10, dm.getHasDetail());
                    
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void replaceDetail(DetMiem dm) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "update miembros set hasDetail = ? where id = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setInt(1, dm.getHasDetail());
            pre.setInt(2, dm.getIdMiembro());
            
            pre.executeUpdate();
        }
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void undoDetail(DetMiem dm) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "update miembros set hasDetail = 2 where id = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setInt(1, dm.getIdMiembro());
            
            pre.executeUpdate();
        }
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void modificar(DetMiem dm) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "update detalleMiembro set fechaIngreso=?,fechaNacimiento=?,"
                    + "medicamentos=?,discapacidad=?,enfermedad=?,nombreEnfermedad=?,"
                    + "parentesco=?,telefonoEmergencia=?, hasDetail=? where idMiembro=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setString(1, dm.getFechaIngreso());
            pre.setString(2, dm.getFechaNacimiento());
            pre.setString(3, dm.getMedicamentos());
            pre.setString(4, dm.getDiscapacidad());
            pre.setString(5, dm.getEnfermedad());
            pre.setString(6, dm.getNombreEmergencia());
            pre.setString(7, dm.getParentesco());
            pre.setString(8, dm.getTelefonoEmergencia());
            pre.setInt(9, dm.getHasDetail());
            pre.setInt(10, dm.getIdMiembro());
            
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void eliminar(DetMiem dm) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "delete from detalleMiembro where idMiembro=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setInt(1, dm.getIdMiembro());
            
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public DetMiem getDetMiem(int id) throws Exception
    {
        DetMiem dm = new DetMiem();
        ResultSet rs;
        
        try 
        {
            this.conectar();
            String sql = "select * from detalleMiembro where idMiembro = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, id);
            rs = pre.executeQuery();
            
            while(rs.next())
            {
                dm.setIdMiembro(rs.getInt("idMiembro"));
                dm.setFechaIngreso(rs.getString("fechaIngreso"));
                dm.setFechaNacimiento(rs.getString("fechaNacimiento"));
                dm.setMedicamentos(rs.getString("medicamentos"));
                dm.setDiscapacidad(rs.getString("discapacidad"));
                dm.setEnfermedad(rs.getString("enfermedad"));
                dm.setNombreEmergencia(rs.getString("nombreEmergencia"));
                dm.setParentesco(rs.getString("parentesco"));
                dm.setTelefonoEmergencia(rs.getString("telefonoEmergencia"));
            }
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        
        return dm;
    }
    
}
