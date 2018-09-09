<%-- 
    Document   : tabela-price
    Created on : 02/09/2018, 12:00:43
    Author     : usuario
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
        <link rel='stylesheet' type='text/css' href='css/bootstrap.css'/>
        <%@include file="WEB-INF/jspf/head.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>        
        <form method="GET">
            <div class="form-group">
                <label for="pv">PV:</label>
                <input type="text" name="pv"/>            
            </div>
            <div class="form-group">
                <label for="taxa">Taxa:</label>
                <input type="text" name="taxa"/>            
            </div>
            
            <div class="form-group">
                <label for="periodos">Períodos:</label>
                <input type="text" name="periodos"/>
            </div>
            <input class="btn btn-primary" type="submit" value="Gerar"/>
            
        </form>
            <%
             if ((request.getParameter("pv") != null)&&(request.getParameter("taxa") != null)&&(request.getParameter("periodos") != null)){
              double pv = Double.parseDouble(request.getParameter("pv"));

              double taxa = Double.parseDouble(request.getParameter("taxa"));
              
              taxa = taxa/100;
              double n = Double.parseDouble(request.getParameter("periodos"));
              DecimalFormat decimalFormat = new DecimalFormat();
              decimalFormat.setMaximumFractionDigits(2);
                    double totalP = 0.0;
                    double totalPmt = 0.0;
                    double totalJ = 0.0;
                    double totalAmo=0.0;
                    double pmt=0.0,juros=0.0,amotizacao=0.0,pvN=0.0;
                    int counter = 0;
              %>
        <table class="table">
            <thead class="thead-light">
                
                <tr>
                    <th>Períodos</th>
                    <th>Saldo devedor(Pv)</th>
                    <th>Parcela</th>
                    <th>Juros</th>
                    <th>Amortização</th>
                </tr>
                
            </thead>            
            <tbody>
                <%
                    
                    pmt = pv*(((Math.pow((1+taxa), n))*taxa)/(((Math.pow((1+taxa), n))-1)));
                    for(int i=0;i<=n;i++){
                        
                        if(i==0){%>
                   <tr>         
                    <td><%=i%></td>
                    <td><%=pv%></td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                   </tr>
                <% 
                  }else{                             
                    juros = pv * taxa;
                    amotizacao = pmt-juros;
                    pv = pv - amotizacao;
                    
                %>
                  <tr>
                  <td><%=decimalFormat.format(i)%></td>                  
                  <td><%=decimalFormat.format(pv)%></td>
                  <td><%=decimalFormat.format(pmt)%></td>
                  <td><%=decimalFormat.format(juros)%></td>
                  <td><%=decimalFormat.format(amotizacao)%></td>
                  </tr>
                  
                  <%
                 }                   

                   totalP=pv;
                   totalP = totalP-pv;
                   
                   totalJ=totalJ+juros;
                   totalAmo=totalAmo+amotizacao;
                   counter = i;
                   totalPmt=i*pmt;
                }
                
         %>
                    <tr>
                      <td>Total</td> 
                      <td><%=decimalFormat.format(totalP)%></td>
                      <td><%=decimalFormat.format(totalPmt)%></td>
                      <td><%=decimalFormat.format(totalJ)%></td>
                      <td><%=decimalFormat.format(totalAmo)%></td>
                    </tr>

<% }       %>
            </tbody>
        </table>
        
        
    </body>
</html>
