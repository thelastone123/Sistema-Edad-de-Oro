
package com.controlador;

import com.modelo.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andrés Alfaro
 */
public class ProcesarEquipo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd = null;
        Equipo eq = new Equipo();
        DaoEquipo dao = new DaoEquipo();
        String msj = "";
        
        try 
        {
            eq.setId(Integer.parseInt(request.getParameter("txtId")));
            eq.setNombres(request.getParameter("txtNombres"));
            eq.setApellidos(request.getParameter("txtApellidos"));
            eq.setTelefono((request.getParameter("txtTelefono")));
            eq.setEdad(Integer.parseInt(request.getParameter("edad")));
            eq.setDui(request.getParameter("txtDui"));
            eq.setDireccion(request.getParameter("txtDireccion"));
            eq.setTipo(request.getParameter("tipo"));
            eq.setEstado(Integer.parseInt(request.getParameter("estado")));
            eq.setHasDetail(Integer.parseInt(request.getParameter("txtDet")));
            
            if(request.getParameter("btnInsertar") != null)
            {
                dao.insertar(eq);
                msj = "Integrante registrado correctamente.";
            }
            else if(request.getParameter("btnModificar") != null)
            {
                dao.modificar(eq);
                msj = "Integrante modificado correctamente.";
            }
            else if(request.getParameter("btnEliminar") != null)
            {
                dao.eliminar(eq);
                msj = "Integrante eliminado correctamente.";
            }
            rd = request.getRequestDispatcher("equipo.jsp");
            request.setAttribute("msj", msj);
        }
        catch (Exception e) 
        {
            request.setAttribute("error", e.toString());
        }
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
