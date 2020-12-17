<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OatJang - 메인 페이지</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="/oatjang/styles/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script>
        $(document).ready(function () {
            var is_search = false;
            // search 버튼을 누를때 실행
            $('#search').on('click', function () {
                if (is_search) {
                    $('#middle').animate({
                        opacity: 1
                    }, 200, function () {
                        // complete
                        is_search = false;
                    });

                    //서치바
                    $('#search_engine').animate({
                        opacity: 0
                    }, {
                        step: function(fx) {
                            $(this).css('transform', 'translate(0)');
                        },
                        duration: 'fast'
                    }, 'linear');
                } else {
                    // 메뉴
                    $('#middle').animate({
                        opacity: 0
                    }, 200, function () {
                        // complete
                        is_search = true;
                    });

                    //서치바
                    $('#search_engine').animate({
                        opacity: 1
                    }, {
                        step: function(fx) {
                            $(this).css('transform', 'translate(-25vw)');
                        },
                        duration: 'fast'
                    }, 'linear');
                }

            });
        });
        
        function searchBoard()
        {

           var searchentity = document.sear.searchentity.value
           var pg = document.sear.pg.value
           document.sear.action=location.href="/oatjang/boardSearch.do?searchentity="+searchentity+"&pg="+pg;
           document.sear.submit()
        }

    </script>
</head>

<body class="container">
    <header class="header1">
        <h1 class="logo">
            <a href="/oatjang/index.jsp">OatJang</a>
        </h1>

        <div id="right" class="right container red topBotomBordersOut">
            <a href="#" alt="search" id="search">search</a>
            <a href="/oatjang/login/login.jsp" alt="login">login</a></li>
            <a href="/oatjang/login/register.jsp" alt="join us">join us</a></li>
        </div>
        

        <div id="middle" class="middle container red topBotomBordersOut">
            <a href="#" alt="all">all</a>
            <a href="board.html" alt="community">community</a>
            <a href="#" alt="deals">deals</a>
            <a href="/oatjang/map.do" alt="maps">maps</a>
            <a href="#" alt="service">service</a>
        </div>
    </header>
    <div id="search_engine" class="search_engine">
        <form onsubmit="searchBoard();" name="sear" id="frm">
            <input type="text" id="search_keyword" name="searchentity" class="searchTerm"  placeholder="What are you looking for?">
             <input type ="hidden" name="pg" value ="1"> 
            <button type="submit"><i class="fa fa-search search_checkbox" id="search_image"></i></button>
        </form>
    </div>
</body>

</html>