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
        <%@include file="WEB-INF/jspf/head.jspf" %>
    </head>
    <body class="bg-light">
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div class="container">
            <div class="row">
                <div class="col-12 text-center my-5">
                    <h1 class="display-3">Amortização Americana</h1>           
                </div>
            </div>
            <div class="row">
                <div class="col-6 my-3">
                    <h2>Preencha o Formulário</h2>
                    <form method="get" class="my-3">
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
                        <center> <input class="btn botaoForm mb-4" type="submit" value="Gerar" name="calcular"/></center>
                    </form>
                </div>
                <div class="col-6 my-3">
                    <h2>Tabela Resultado</h2>
                    <%
                        if (request.getParameter("calcular") != null && request.getParameter("valor") != "" && request.getParameter("tempo")
                                != "" && request.getParameter("juros") != null) {
                            DecimalFormat decimalFormat = new DecimalFormat();
                            decimalFormat.setMaximumFractionDigits(2);
                            double sd = Double.parseDouble(request.getParameter("valor"));
                            double tj = Double.parseDouble(request.getParameter("juros")) / 100;
                            double p = Double.parseDouble(request.getParameter("tempo"));
                            double amortizacao = sd;
                            double parcelas = 0, juros = 0;
                            double saldoDevedor = sd, jurosA = 0, parcA = 0;
                    %>

                    <table class="table table-hover">
                        <thead class="legenda">
                            <tr>
                                <th>Tempo</th>
                                <th>Saldo Devedor</th>
                                <th>Amortização</th>
                                <th>Juros</th>
                                <th>Parcelas</th>
                            </tr>
                        </thead>

                        <tbody>

                            <% for (int i = 1; i <= p + 1; i++) {%>
                            <tr>
                                <% if (i < p) {%>

                                <td><%= i%></td>
                                <td><%= decimalFormat.format(saldoDevedor)%></td>
                                <td>   <%= "  -- "%></td>
                                    <td> <% juros = saldoDevedor * tj;
                                parcelas = juros;
                                jurosA = jurosA + juros;%><%= decimalFormat.format(juros)%></td>
                                <td> <%parcA = parcA + parcelas;%><%= decimalFormat.format(parcelas)%></td>

                                <% } else if (i == p) {%>

                                <td><%= i%></td>
                                <td><%= decimalFormat.format(sd - sd)%></td>
                                <td><%= decimalFormat.format(sd)%></td>
                                <td><%= decimalFormat.format(juros)%></td>
                                <%parcA = parcA + parcelas;%>
                                <%jurosA = jurosA + juros;%>
                                <td><%= decimalFormat.format(sd + juros)%></td>

                                <% } else if (i == p + 1) {%>

                                <td><%= "Total"%></td>
                                <td><%= "  -- "%></td>
                                <td><%= decimalFormat.format(amortizacao)%></td>
                                <td><%= decimalFormat.format(jurosA)%></td>
                                <td><%= decimalFormat.format(amortizacao + parcA)%></td>

                                <% } %>
                            </tr>
                        </tbody>

                        <% } %> </table>
                        <% }%>
                </div>
            </div>
        </div>
                       
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>

</html>