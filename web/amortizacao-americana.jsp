<%-- 
    Document   : amotizacao-americana
    Created on : 02/09/2018, 12:00:32
    Author     : usuario
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP - Amortização Americana</title>
        <link rel='stylesheet' type='text/css' href='css/bootstrap.css'/>
        <%@include file="WEB-INF/jspf/head.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <form method="get">
            <div class="form-group">
                <label>Saldo Devedor: </label>
                <input type="text" class="form-control" name="valor" placeholder="R$">
            </div>
            <div class="form-group">
                <label>Taxa de Juros (%): </label>
                <input type="text" class="form-control" name="juros">
            </div>
            <div class="form-group">
                <label>Tempo: </label>
                <input type="text" class="form-control" name="tempo" placeholder="Meses">
            </div>
            <input class="btn btn-primary" type="submit" value="Calcular" name="calcular"/>
        </form>
        <%
            if (request.getParameter("calcular") != null && request.getParameter("valor") != "" && request.getParameter("tempo") != "" && request.getParameter("juros") != null){
                DecimalFormat decimalFormat = new DecimalFormat();
                decimalFormat.setMaximumFractionDigits(2);
                double sd = Double.parseDouble(request.getParameter("valor")); 
                double tj = Double.parseDouble(request.getParameter("juros"))/100;
                double p = Double.parseDouble(request.getParameter("tempo"));
                double amortizacao = sd;
                double parcelas, juros;
                double saldoDevedor = sd, jurosAcu = 0, amortizacaoAcu = 0, parcelasAcu = 0;   
        %>
            <table class="table">
                <thead class="thead-light">
                    <tr>
                    <th scope="col">#</th>
                    <th scope="col">Saldo Devedor</th>
                    <th scope="col">Amortizações</th>
                    <th scope="col">Juros</th>
                    <th scope="col">Parcelas</th>
                   
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 1; i <= p+1; i++) {%>
                    <tr>
                        <% if (i == p) { %>
                                <th class="table-active" scope="row"><%= "=" %></th>
                                <td class="table-active"><%= decimalFormat.format(sd - sd) %></td>
                                <td class="table-active"><%= decimalFormat.format(sd) %></td>
                                <td class="table-active"><%= decimalFormat.format(juros) %></td>
                                <td class="table-active"><%= decimalFormat.format(sd + juros) %></td>
                                <td class="table-active"><%= "Total" %></td>
                        <% } else {%>
                            <th scope="row"><%= i %></th>
                            <td><%
                                juros = saldoDevedor * tj; parcelas = juros;
                                parcA += parcelas;%> <%= decimalFormat.format(parcelas)%></td>
                            <td><%=%></td>
                            <td><%= decimalFormat.format(juros)%> <% jurosAcu += juros; %></td>
                            <td><<%= decimalFormat.format(saldoDevedor)%></td>
                        <% } else if(i == p+1){ %>
                            <th class="table-active" scope="row"><%= "=" %></th>
                                <td class="table-active"><%= decimalFormat.format(parcA) %></td>
                                <td class="table-active"><%= decimalFormat.format(amortizacaoAcu) %></td>
                                <td class="table-active"><%= decimalFormat.format(jurosAcu) %></td>
                                <td class="table-active"><%= "Total" %></td>
                        %>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %> 
    </body>
    <footer>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </footer>
</html>