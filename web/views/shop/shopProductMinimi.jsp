<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- 외부 스타일시트 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
    <!-- <link rel="stylesheet" href="../css/shopProductMusic.css"> -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/shopProductMinimi.css">
    <!-- 폰트 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap">
</head>
<body>
	<form>
	<table id="MinimiTable">
        <tr>
            <td>
                <div class="productMinimi">
                    <div class="MinimiPicture">
                        <img src="http://www.kocca.kr/cmm/fnw/getImage.do?atchFileId=FILE_900000000000968&fileSn=1" alt="[대체]음악사진">
                    </div>
                    <br>
                    <div class="MinimiInfo">
                        <input class="shopMinimiCheck" type="checkbox">
                        <ul>
                            <li><b>[여자]</b></li>
                            <li><b>봄꽃 미소</b></li>
                            <li><b>도토리 5개</b></li>
                        </ul>
                        <input class="shopMinimiCheck" type="checkbox">
                    </div>  
                </div>
            </td>
            <td>
                <div class="productMinimi">
                    <div class="MinimiPicture">
                        <img src="http://www.kocca.kr/cmm/fnw/getImage.do?atchFileId=FILE_900000000000966&fileSn=1" alt="[대체]음악사진">
                    </div>
                    <br>
                    <div class="MinimiInfo">
                        <input class="shopMinimiCheck" type="checkbox">
                        <ul>
                            <li><b>[남자]</b></li>
                            <li><b>복싱선수</b></li>
                            <li><b>도토리 6개</b></li>
                        </ul>
                        <input class="shopMinimiCheck" type="checkbox">
                    </div>  
                </div> 
            </td>
            <td>
                <div class="productMinimi">
                    <div class="MinimiPicture">
                        <img src="http://www.kocca.kr/cmm/fnw/getImage.do?atchFileId=FILE_900000000000971&fileSn=1" alt="[대체]음악사진">
                    </div>
                    <br>
                    <div class="MinimiInfo">
                        <input class="shopMinimiCheck" type="checkbox">
                        <ul>
                            <li><b>[여자]</b></li>
                            <li><b>부끄부끄소녀</b></li>
                            <li><b>도토리 6개</b></li>
                        </ul>
                        <input class="shopMinimiCheck" type="checkbox">
                    </div>  
                </div> 
            </td>
        </tr>
        <tr>
            <td>
                <div class="productMinimi">
                    <div class="MinimiPicture">
                        <img src="http://www.kocca.kr/cmm/fnw/getImage.do?atchFileId=FILE_900000000000970&fileSn=1" alt="[대체]음악사진">
                    </div>
                    <br>
                    <div class="MinimiInfo">
                        <input class="shopMinimiCheck" type="checkbox">
                        <ul>
                            <li><b>[남자]</b></li>
                            <li><b>부끄부끄소년</b></li>
                            <li><b>도토리 6개</b></li>
                        </ul>
                        <input class="shopMinimiCheck" type="checkbox">
                    </div>  
                </div> 
            </td>
            <td>
                <div class="productMinimi">
                    <div class="MinimiPicture">
                        <img src="http://www.kocca.kr/cmm/fnw/getImage.do?atchFileId=FILE_900000000000977&fileSn=1" alt="[대체]음악사진" alt="[대체]음악사진">
                    </div>
                    <br>
                    <div class="MinimiInfo">
                        <input class="shopMinimiCheck" type="checkbox">
                        <ul>
                            <li><b>[동물]</b></li>
                            <li><b>분노팬더</b></li>
                            <li><b>도토리 7개</b></li>
                        </ul>
                        <input class="shopMinimiCheck" type="checkbox">
                    </div>  
                </div> 
            </td>
            <td>
                <div class="productMinimi">
                    <div class="MinimiPicture">
                        <img src="http://www.kocca.kr/cmm/fnw/getImage.do?atchFileId=FILE_900000000000980&fileSn=1" alt="[대체]음악사진" alt="[대체]음악사진">
                    </div>
                    <br>
                    <div class="MinimiInfo">
                        <input class="shopMinimiCheck" type="checkbox">
                        <ul>
                            <li><b>[탈것]</b></li>
                            <li><b>붕붕라이더</b></li>
                            <li><b>도토리 10개</b></li>
                        </ul>
                        <input class="shopMinimiCheck" type="checkbox">
                    </div>  
                </div> 
            </td>
        </tr> 
        <tr>
        	<td>
                <div class="productMinimi">
                    <div class="MinimiPicture">
                        <img src="http://www.kocca.kr/cmm/fnw/getImage.do?atchFileId=FILE_900000000000974&fileSn=1" alt="[대체]음악사진" alt="[대체]음악사진">
                    </div>
                    <br>
                    <div class="MinimiInfo">
                        <input class="shopMinimiCheck" type="checkbox">
                        <ul>
                            <li><b>[동물]</b></li>
                            <li><b>부리부리깡총</b></li>
                            <li><b>도토리 6개</b></li>
                        </ul>
                        <input class="shopMinimiCheck" type="checkbox">
                    </div>  
                </div> 
            </td>
        </tr>           
    </table>
    </form>

</body>
</html>