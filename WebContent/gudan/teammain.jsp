<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>

<script type="text/javascript">
control = "/gudan";
</script>    
<a href="<%=root%>/gudan?act=mvhome&tno=2" style="color: white !important;">    
<div class="py-5 opaque-overlay" style="background-image: url(<%=root%>/img/gudan/bgimg/doosan-cover.png); background-size: cover;">
    <div class="container py-5">
      <div class="row py-5">
        <div class="align-self-center col-md-6 text-white">
          <h1 class="text-center text-md-left display-4">
          두산 베어스
          </h1>
          <p class="lead">DOOSAN BEARS</p>
        </div>
        <div class="col-md-6"></div>
      </div>
    </div>
</div>
</a>
<a href="<%=root%>/gudan?act=mvhome&tno=8" style="color: white !important;">   
<div class="py-5 opaque-overlay" style="background-image: url(<%=root%>/img/gudan/bgimg/hanwha-cover.jpg); background-size: cover;">
    <div class="container py-5">
      <div class="row py-5">
        <div class="col-md-6"></div>
        <div class="align-self-center col-md-6 text-white">
          <h1 class="text-center text-md-left display-4">한화 이글스</h1>
          <p class="lead">HANWHA EAGLES</p>
        </div>
      </div>
    </div>
</div>
</a>
<a href="<%=root%>/gudan?act=mvhome&tno=1" style="color: white !important;">   
<div class="py-5 opaque-overlay" style="background-image: url(<%=root%>/img/gudan/bgimg/kia-cover.jpg); background-size: cover;">
    <div class="container py-5">
      <div class="row py-5">
        <div class="align-self-center col-md-6 text-white">
          <h1 class="text-center text-md-left display-4">KIA 타이거즈</h1>
          <p class="lead">KIA TIGERS</p>
        </div>
        <div class="col-md-6"></div>
      </div>
    </div>
</div>
</a>
<div class="py-5 opaque-overlay" style="background-image: url(<%=root%>/img/etc/grass.jpg);">
    <div class="container py-5">
      <div class="row py-5">
        <div class="col-md-6"></div>
        <div class="align-self-center col-md-6 text-white">
          <h1 class="text-center text-md-left display-4">롯데 자이언츠</h1>
          <p class="lead">LOTTE GIANTS</p>
        </div>
      </div>
    </div>
</div>
<div class="py-5 opaque-overlay" style="background-image: url(<%=root%>/img/etc/grass.jpg);">
    <div class="container py-5">
      <div class="row py-5">
        <div class="align-self-center col-md-6 text-white">
          <h1 class="text-center text-md-left display-4">NC 다이노스</h1>
          <p class="lead">NC DINOS</p>
        </div>
        <div class="col-md-6"></div>
      </div>
    </div>
</div>
<div class="py-5 opaque-overlay" style="background-image: url(<%=root%>/img/etc/grass.jpg);">
    <div class="container py-5">
      <div class="row py-5">
        <div class="col-md-6"></div>
        <div class="align-self-center col-md-6 text-white">
          <h1 class="text-center text-md-left display-4">SK 와이번스</h1>
          <p class="lead">SK WYBERNS</p>
        </div>
      </div>
    </div>
</div>
<div class="py-5 opaque-overlay" style="background-image: url(<%=root%>/img/etc/grass.jpg);">
    <div class="container py-5">
      <div class="row py-5">
        <div class="align-self-center col-md-6 text-white">
          <h1 class="text-center text-md-left display-4">LG 트윈스</h1>
          <p class="lead">LG TWINS</p>
        </div>
        <div class="col-md-6"></div>
      </div>
    </div>
</div>
<div class="py-5 opaque-overlay" style="background-image: url(<%=root%>/img/etc/grass.jpg);">
    <div class="container py-5">
      <div class="row py-5">
        <div class="col-md-6"></div>
        <div class="align-self-center col-md-6 text-white">
          <h1 class="text-center text-md-left display-4">넥센 히어로즈</h1>
          <p class="lead">NEXEN HEROES</p>
        </div>
      </div>
    </div>
</div>
<div class="py-5 opaque-overlay" style="background-image: url(<%=root%>/img/etc/grass.jpg);">
    <div class="container py-5">
      <div class="row py-5">
        <div class="align-self-center col-md-6 text-white">
          <h1 class="text-center text-md-left display-4">삼성 라이온즈</h1>
          <p class="lead">SAMSUNG LIONS</p>
        </div>
        <div class="col-md-6"></div>
      </div>
    </div>
</div>
<div class="py-5 opaque-overlay" style="background-image: url(<%=root%>/img/etc/grass.jpg);">
    <div class="container py-5">
      <div class="row py-5">
        <div class="col-md-6"></div>
        <div class="align-self-center col-md-6 text-white">
          <h1 class="text-center text-md-left display-4">KT 위즈</h1>
          <p class="lead">KT WIZ</p>
        </div>
      </div>
    </div>
</div>


<!-- 구단별 로고 >> 링크 구단페이지로 -->
<div class="py-5" style="background-color: #3452FF;">
   <div class="container text-center">
      <div class="row">
         <div class="col-md-12 col-12">
            <a class="text-white" href="<%=root%>/gudan?act=mvhome&tno=2">두산 베어스</a> <span
               class="border-r mx-2" style="border-color: white;"></span> <a
               class="text-white" href="<%=root%>/gudan?act=mvhome&tno=8">한화 이글스</a> <span class="border-r mx-2"
               style="border-color: white;"></span> <a class="text-white" href="<%=root%>/gudan?act=mvhome&tno=1">KIA
               타이거즈</a> <span class="border-r mx-2" style="border-color: white;"></span>
            <a class="text-white" href="#">롯데 자이언츠</a> <span
               class="border-r mx-2" style="border-color: white;"></span> <a
               class="text-white" href="#">삼성 라이온즈</a> <span class="border-r mx-2"
               style="border-color: white;"></span> <a class="text-white" href="#">KT
               위즈</a> <span class="border-r mx-2" style="border-color: white;"></span>
            <a class="text-white" href="#">넥센 히어로즈</a> <span
               class="border-r mx-2" style="border-color: white;"></span> <a
               class="text-white" href="#">NC 다이노스</a> <span class="border-r mx-2"
               style="border-color: white;"></span> <a class="text-white" href="#">SK
               와이번스</a> <span class="border-r mx-2" style="border-color: white;"></span>
            <a class="text-white" href="#">LG 트윈스</a>
         </div>
      </div>
   </div>
</div>
<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>