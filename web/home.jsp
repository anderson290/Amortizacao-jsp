<%-- 
    Document   : home
    Created on : 02/09/2018, 11:59:43
    Author     : usuario
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto !</title>
        <%@include file="WEB-INF/jspf/head.jspf" %>
    </head>
    <body class="bg-light">
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div class="container">
            <div class="jumbotron jumbotron-fluid text-center">
                <h1>Apresentação da Equipe</h1>
            </div>


            <div class="row mb-5">
                <div class="col-sm-4">
                    <div class="card">   
                        <div class="card-body">
                            <h4 class="card-title">Amortização Americana</h4>                        
                            <p class="card-text"> 
                                É um tipo de quitação de empréstimo que favorece aqueles 
                                que desejam pagar o valor principal através de uma única parcela.
                            </p>
                        </div>   

                        <div class="card-footer text-muted">
                            Por Nicole Medina
                        </div>
                    </div>

                </div>
                <div class="col-sm-4">
                    <div class="card">    
                        <div class="card-body">
                            <h4 class="card-title">Amortização Constante</h4>                        
                            <p class="card-text"> 
                                Consiste no pagamento da dívida baseada em parcelas de amortizações iguais com prestações e juros decrescentes.
                            </p>
                        </div>   

                        <div class="card-footer text-muted">
                            Por Bruno de Lima
                        </div>
                    </div>

                </div>
                <div class="col-sm-4">
                    <div class="card">                 

                        <div class="card-body">
                            <h4 class="card-title">Tabela Price</h4>                        
                            <p class="card-text"> 
                                Tabela Price, também chamado de sistema francês de amortização, 
                                é um método usado em amortização de empréstimo cuja 
                                principal característica é apresentar prestações (ou parcelas) iguais.
                            </p>
                        </div>   

                        <div class="card-footer text-muted">
                            Por Anderson Nunes
                        </div>
                    </div>
                </div>

            </div>
        </div>
            <%@include file="WEB-INF/jspf/footer.jspf" %> 
    </body>
</html>