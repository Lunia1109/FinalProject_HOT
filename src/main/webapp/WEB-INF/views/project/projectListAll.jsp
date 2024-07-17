<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="UTF-8">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:import url="${path }/WEB-INF/views/common/sidebar.jsp"/>
<c:import url="${path }/WEB-INF/views/common/header.jsp"/>
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">

    <style>
        :root {
  --cor-de-fundo: #2d3548;
  --cor-clara: rgba(255, 255, 255, 0.6);
  --cor-clara2: rgba(255, 255, 255, 0.9);
  --medida-espaco-8: 8px;
  --medida-espaco-16: 16px;
  --medida-espaco-24: 24px;
  --medida-espaco-32: 32px;
  --medida-espaco-64: 64px;
  --largura-caixa-geral: 1200px;
}


html {
  height: 100%;
  font-family: "Montserrat", sans-serif;
  font-size: 14px;
}

body {
  height: 100%;
}

.conteudo__geral {
  align-items: flex-start;
  background-color: #212123;
  display: flex;
  min-height: 100%;
  justify-content: center;
  padding: var(--medida-espaco-64) var(--medida-espaco-24);
}

.conteudo__cartoes-grid {
  display: grid;
  grid-template-columns: repeat(1, 1fr);
  grid-column-gap: var(--medida-espaco-24);
  grid-row-gap: var(--medida-espaco-24);
  max-width: var(--largura-caixa-geral);
  width: 100%;
}

@media (min-width: 540px) {
  .conteudo__cartoes-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 960px) {
  .conteudo__cartoes-grid {
    grid-template-columns: repeat(4, 1fr);
  }
}

.elemento__cartao {
  list-style: none;
  position: relative;
}

.elemento__cartao:before {
  content: "";
  display: block;
  padding-bottom: 150%;
  width: 100%;
}

.elemento__cartao--fundo {
  background-size: cover;
  background-position: center;
  border-radius: var(--medida-espaco-24);
  bottom: 0;
  filter: brightness(0.75) saturate(1.2) contrast(0.85);
  left: 0;
  position: absolute;
  right: 0;
  top: 0;
  transform-origin: center;
  transform: scale(1) translateZ(0);
  transition: filter 200ms linear, transform 200ms linear;
}

.elemento__cartao:hover .elemento__cartao--fundo {
  transform: scale(1.05) translateZ(0);
}

.conteudo__cartoes-grid:hover
  > .elemento__cartao:not(:hover)
  .elemento__cartao--fundo {
  filter: brightness(0.5) saturate(0) contrast(1.2) blur(20px);
}

.elemento__cartao--conteudo {
  left: 0;
  padding: var(--medida-espaco-24);
  position: absolute;
  top: 0;
}

.elemento__cartao--texto-categoria {
  color: var(--cor-clara);
  font-size: 0.9rem;
  margin-bottom: var(--medida-espaco-8);
  text-transform: uppercase;
}

.elemento__cartao--texto-titulo {
  color: var(--cor-clara2);
  font-size: 1.9rem;
  text-shadow: 2px 2px 20px rgba(0, 0, 0, 0.2);
  line-height: 1.4;
  word-spacing: 100vw;
}
    </style>

  <section class="conteudo__geral">
        <div class="conteudo__cartoes-grid">
            <a class="elemento__cartao" href="#">
                <!-- utilizar background-image direto no css é uma boa prática -->
                <div class="elemento__cartao--fundo"
                    style="background-image: url(https://images.pexels.com/photos/1078983/pexels-photo-1078983.jpeg)">
                </div>
                <div class="elemento__cartao--conteudo">
                    <p class="elemento__cartao--texto-categoria">Paisagem</p>
                    <h3 class="elemento__cartao--texto-titulo">Praia</h3>
                </div>
            </a>
            <a class="elemento__cartao" href="#">
                <div class="elemento__cartao--fundo"
                    style="background-image: url(https://images.pexels.com/photos/12101259/pexels-photo-12101259.jpeg)">
                </div>
                <div class="elemento__cartao--conteudo">
                    <p class="elemento__cartao--texto-categoria">Paisagem</p>
                    <h3 class="elemento__cartao--texto-titulo">Deserto</h3>
                </div>
            </a>
            <a class="elemento__cartao" href="#">
                <div class="elemento__cartao--fundo"
                    style="background-image: url(https://images.pexels.com/photos/731423/pexels-photo-731423.jpeg)">
                </div>
                <div class="elemento__cartao--conteudo">
                    <p class="elemento__cartao--texto-categoria">Paisagem</p>
                    <h3 class="elemento__cartao--texto-titulo">Campo Verde</h3>
                </div>
            </a>
            <a class="elemento__cartao" href="#">
                <div class="elemento__cartao--fundo"
                    style="background-image: url(https://images.pexels.com/photos/4215100/pexels-photo-4215100.jpeg)">
                </div>
                <div class="elemento__cartao--conteudo">
                    <p class="elemento__cartao--texto-categoria">Paisagem</p>
                    <h3 class="elemento__cartao--texto-titulo">Montanhas Geladas</h3>
                </div>
            </a>
            <div>
    </section>
</div>
<c:import url="${path }/WEB-INF/views/common/footer.jsp"/>