<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 상품관리</title>
    
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    <style>
    
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif;
            background: #f5f7fa;
            color: #333;
        }

        /* 헤더 */
        .header {
            background: white;
            border-bottom: 1px solid #e0e0e0;
            padding: 20px 40px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #1a237e;
            letter-spacing: -1px;
            cursor: pointer;
            text-decoration: none;
        }
        
        .logo span {
            color: #3949ab;
        }

        .admin-badge {
            background: #d32f2f;
            color: white;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            margin-left: 12px;
        }

        .header-right {
            display: flex;
            gap: 16px;
            align-items: center;
        }

        .header-user {
            font-size: 14px;
            color: #666;
        }

        .btn-logout {
            padding: 8px 16px;
            background: white;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
            transition: all 0.3s;
        }

        .btn-logout:hover {
            border-color: #1a237e;
            color: #1a237e;
        }

        /* 컨테이너 */
        .container {
            max-width: 1600px;
            margin: 40px auto;
            padding: 0 48px;
        }

        /* 레이아웃 */
        .admin-layout {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 30px;
        }

        /* 사이드바 */
        .sidebar {
            background: white;
            border-radius: 12px;
            padding: 30px 0;
            height: fit-content;
            position: sticky;
            top: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .sidebar-section {
            margin-bottom: 30px;
        }

        .sidebar-title {
            padding: 0 24px 12px;
            font-size: 14px;
            font-weight: 600;
            color: #999;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .sidebar-menu {
            list-style: none;
        }

        .sidebar-menu a {
            display: block;
            padding: 14px 24px;
            color: #666;
            text-decoration: none;
            font-size: 15px;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }

        .sidebar-menu a:hover {
            background: #f5f7fa;
            color: #1a237e;
        }

        .sidebar-menu a.active {
            background: #e8eaf6;
            color: #1a237e;
            font-weight: 600;
            border-left-color: #1a237e;
        }

        /* 메인 컨텐츠 */
        .main-content {
            min-height: 600px;
        }

        .section-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            padding-bottom: 16px;
            border-bottom: 2px solid #1a237e;
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            color: #1a237e;
        }

        /* 버튼 */
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background: #1a237e;
            color: white;
        }

        .btn-primary:hover {
            background: #0d47a1;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: white;
            color: #1a237e;
            border: 2px solid #1a237e;
        }

        .btn-secondary:hover {
            background: #f5f7fa;
        }

        .btn-danger {
            background: #d32f2f;
            color: white;
        }

        .btn-danger:hover {
            background: #c62828;
        }

        /* 검색바 */
        .search-controls {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .search-input {
            flex: 1;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
        }

        .search-input:focus {
            outline: none;
            border-color: #1a237e;
        }

        /* 테이블 스타일 */
        .table-container {
            overflow-x: auto;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .product-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            min-width: 800px;
        }

        .product-table th {
            background: #f8f9fa;
            padding: 15px 12px;
            text-align: center;
            font-weight: 600;
            color: #666;
            border-bottom: 2px solid #e0e0e0;
            font-size: 14px;
        }

        .product-table td {
            padding: 15px 12px;
            text-align: center;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
            font-size: 14px;
        }

        .product-table tbody tr:hover {
            background: #f5f7fa;
        }

        .product-table td.text-left {
            text-align: left;
        }

        .product-image {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        /* 관리 버튼 */
        .manage-buttons {
            display: flex;
            flex-direction: column;
            gap: 5px;
            align-items: center;
        }

        .btn-sm {
            padding: 6px 12px;
            font-size: 12px;
            border-radius: 6px;
            min-width: 60px;
        }

        /* 페이징 스타일 */
        .pagination-wrapper {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .pagination {
            display: flex;
            gap: 5px;
            list-style: none;
            padding: 0;
        }

        .page-item {
            margin: 0;
        }

        .page-link {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 8px 12px;
            min-width: 40px;
            height: 40px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            color: #1a237e;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        .page-link:hover {
            background: #f5f7fa;
            border-color: #1a237e;
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .page-item.active .page-link {
            background: #1a237e;
            border-color: #1a237e;
            color: white;
            font-weight: 600;
            box-shadow: 0 2px 5px rgba(26, 35, 126, 0.3);
        }

        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 2000;
            overflow-y: auto;
        }

        .modal.active {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .modal-content {
            background: white;
            border-radius: 12px;
            width: 100%;
            max-width: 600px;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        .modal-header {
            padding: 24px;
            border-bottom: 1px solid #e0e0e0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-title {
            font-size: 20px;
            font-weight: bold;
            color: #1a237e;
        }

        .modal-close {
            background: none;
            border: none;
            font-size: 28px;
            color: #999;
            cursor: pointer;
            transition: color 0.3s;
        }

        .modal-close:hover {
            color: #333;
        }

        .modal-body {
            padding: 24px;
        }

        .modal-footer {
            padding: 24px;
            border-top: 1px solid #e0e0e0;
            display: flex;
            gap: 12px;
            justify-content: flex-end;
        }

        /* 폼 스타일 */
        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: 600;
            color: #333;
        }

        .form-input,
        .form-select,
        .form-textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
            transition: border-color 0.3s;
        }

        .form-input:focus,
        .form-select:focus,
        .form-textarea:focus {
            outline: none;
            border-color: #1a237e;
            box-shadow: 0 0 0 2px rgba(26, 35, 126, 0.1);
        }

        .form-textarea {
            resize: vertical;
            min-height: 100px;
        }

        /* 현재 이미지 표시 */
        .current-image-container {
            margin-bottom: 20px;
            text-align: center;
        }

        .current-image {
            max-width: 200px;
            max-height: 200px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .container {
                padding: 0 20px;
            }

            .admin-layout {
                grid-template-columns: 1fr;
            }

            .sidebar {
                position: static;
            }

            .search-controls {
                flex-direction: column;
            }

            .search-input {
                width: 100%;
            }

            .product-table {
                font-size: 12px;
            }

            .product-table th,
            .product-table td {
                padding: 8px 6px;
            }

            .product-image {
                width: 40px;
                height: 40px;
            }

            .modal-content {
                margin: 10px;
            }
        
		         /* 재고모달 */
		
			.btn-success {
			    background: #388e3c;
			    color: white;
			}
			
			.btn-success:hover {
			    background: #2e7d32;
			}
			
			/* 재고 이력 테이블 */
			.remain-history-table {
			    width: 100%;
			    border-collapse: collapse;
			    margin-top: 20px;
			}
			
			.remain-history-table th,
			.remain-history-table td {
			    padding: 10px;
			    border: 1px solid #e0e0e0;
			    text-align: center;
			    font-size: 13px;
			}
			
			.remain-history-table th {
			    background: #f8f9fa;
			    font-weight: 600;
			}
			
			.remain-history-table tbody tr:nth-child(even) {
			    background: #f9f9f9;
			}
			
			thead th {
			    padding: 12px 20px; /* 세로 12px, 가로 20px */
			}
		        
				       /* 관리 버튼 반응형 개선 */
		    .manage-buttons {
		        flex-direction: row;
		        gap: 3px;
		        justify-content: center;
		        flex-wrap: wrap;
		    }
		    
		    .btn-sm {
		        padding: 4px 8px;
		        font-size: 10px;
		        min-width: 45px;
		    }
		    
		    /* 버튼 텍스트 줄임 */
		    .manage-buttons .btn-success {
		        /* "재고" 텍스트가 이미 짧아서 그대로 사용 */
		    }
		    
		    /* 재고 모달 반응형 */
		    .modal-content {
		        width: 95%;
		        margin: 5px;
		        max-height: 95vh;
		    }
		    
		    .modal-header,
		    .modal-body,
		    .modal-footer {
		        padding: 15px;
		    }
		    
		    /* 재고 이력 테이블 반응형 */
		    .remain-history-table {
		        font-size: 11px;
		    }
		    
		    .remain-history-table th,
		    .remain-history-table td {
		        padding: 6px 4px;
		    }
		    
		    /* 폼 요소들 반응형 */
		    .form-input,
		    .form-select,
		    .form-textarea {
		        padding: 10px 12px;
		        font-size: 16px; /* iOS에서 줌 방지 */
		    }
		    
		    /* 헤더 반응형 개선 */
		    .header {
		        padding: 15px 20px;
		        flex-direction: column;
		        gap: 10px;
		    }
		    
		    .header-right {
		        gap: 10px;
		    }
		    
		    .logo {
		        font-size: 24px;
		    }
		    
		    /* 섹션 헤더 반응형 */
		    .section-header {
		        flex-direction: column;
		        gap: 15px;
		        align-items: stretch;
		    }
		    
		    .section-header > div {
		        display: flex;
		        gap: 8px;
		        justify-content: center;
		    }
		    
		    /* 페이징 반응형 개선 */
		    .page-link {
		        padding: 6px 10px;
		        min-width: 35px;
		        height: 35px;
		        font-size: 12px;
		    }
		    
		    /* 검색 컨트롤 개선 */
		    .search-controls form {
		        flex-direction: column !important;
		        gap: 10px !important;
		    }
		    
		    .search-controls .btn {
		        width: 100%;
		        justify-content: center;
		    }
		}
		
		/* 아주 작은 화면 (320px 이하) */
		@media (max-width: 320px) {
		    .container {
		        padding: 0 10px;
		    }
		    
		    .btn-sm {
		        padding: 3px 6px;
		        font-size: 9px;
		        min-width: 35px;
		    }
		    
		    .product-table th,
		    .product-table td {
		        padding: 6px 3px;
		        font-size: 11px;
		    }
		    
		    .product-image {
		        width: 30px;
		        height: 30px;
		    }
		}
		
		/* 태블릿 크기 (769px ~ 1024px) */
		@media (min-width: 769px) and (max-width: 1024px) {
		    .container {
		        padding: 0 30px;
		    }
		    
		    .admin-layout {
		        grid-template-columns: 200px 1fr;
		        gap: 20px;
		    }
		    
		    .sidebar {
		        padding: 20px 0;
		    }
		    
		    .sidebar-menu a {
		        padding: 12px 20px;
		        font-size: 14px;
		    }
		    
	   /* 플레이스홀더 스타일링 */
		input::placeholder {
		    color: #bbb;
		    font-style: italic;
		}
		
		/* 송장번호 입력 필드 */
		input[type="text"] {
		    border: 1px solid #e0e0e0;
		    border-radius: 3px;
		    background-color: #fafafa;
		}
		
		input[type="text"]:focus {
		    border-color: #007bff;
		    background-color: white;
		    outline: none;
		}
		
		/* 셀렉트 박스 스타일 */
		select {
		    border: 1px solid #e0e0e0;
		    border-radius: 3px;
		    background-color: #fafafa;
		}
		
		select:focus {
		    border-color: #007bff;
		    background-color: white;
		    outline: none;
		}
			
			/* 송장번호 입력 필드 */
	.tracking-input {
    width: 60px;           /* 85px → 60px로 더 줄임 */
    height: 35px;          /* 높이 추가! */
    padding: 8px 4px;      /* 세로 패딩 늘리고 가로 패딩 줄임 */
    font-size: 10px;       /* 11px → 10px로 줄임 */
    border: 1px solid #e9ecef;
    border-radius: 12px;
    background-color: #f8f9fa;
    transition: all 0.3s ease;
    text-align: center;
    font-family: 'Courier New', monospace;
	}
	
	.tracking-input:focus {
	    border-color: #007bff;
	    background-color: white;
	    box-shadow: 0 0 15px rgba(0, 123, 255, 0.2);
	    outline: none;
	    transform: scale(1.02);
	}
	
	.tracking-input:hover {
	    border-color: #007bff;
	    background-color: white;
	 
	}
	
	.tracking-input::placeholder {
	    color: #adb5bd;
	    font-style: italic;
	}
	
	/* 송장번호가 입력됐을 때 */
	.tracking-input.filled {
	    background: linear-gradient(135deg, #e3f2fd, #bbdefb);
	    border-color: #1976d2;
	    color: #1565c0;
	    font-weight: 600;
	}
	
	
	.delivery-select {
	    width: 95px;
	    padding: 8px 10px;
	    font-size: 12px;
	    border: 2px solid #e9ecef;
	    border-radius: 15px;  
	    background-color: #f8f9fa;
	    transition: all 0.3s ease;
	    text-align: center;
	    cursor: pointer;
	}
	
	.delivery-select:focus {
	    border-color: #007bff;
	    background-color: white;
	    box-shadow: 0 0 15px rgba(0, 123, 255, 0.2);
	    outline: none;
	    transform: scale(1.02);
	}
	
	.delivery-select:hover {
	    border-color: #007bff;
	    background-color: white;
	    transform: translateY(-1px);
	}
	
	/* 배송상태별 */
	.delivery-select.status-준비중 { 
	    background: linear-gradient(135deg, #fff8e1, #ffecb3);
	    border-color: #ff8f00;
	    color: #e65100;
	    font-weight: bold;
	    box-shadow: 0 2px 8px rgba(255, 143, 0, 0.2);
	}
	
	.delivery-select.status-배송중 { 
	    background: linear-gradient(135deg, #e3f2fd, #90caf9);
	    border-color: #1976d2;
	    color: #0d47a1;
	    font-weight: bold;
	    box-shadow: 0 2px 8px rgba(25, 118, 210, 0.2);
	}
	
	.delivery-select.status-배송완료 { 
	    background: linear-gradient(135deg, #e8f5e8, #a5d6a7);
	    border-color: #388e3c;
	    color: #1b5e20;
	    font-weight: bold;
	    box-shadow: 0 2px 8px rgba(56, 142, 60, 0.2);
	}
	
	.delivery-select.status-반품 { 
	    background: linear-gradient(135deg, #ffebee, #ef9a9a);
	    border-color: #d32f2f;
	    color: #b71c1c;
	    font-weight: bold;
	    box-shadow: 0 2px 8px rgba(211, 47, 47, 0.2);
	}
	
	.delivery-select.status-품절 { 
	    background: linear-gradient(135deg, #f5f5f5, #e0e0e0);
	    border-color: #757575;
	    color: #424242;
	    font-weight: bold;
	    box-shadow: 0 2px 8px rgba(117, 117, 117, 0.2);
	}
	
	/* 전체 테이블 셀 여백 조정 */
	.product-table td {
	    vertical-align: middle;
	    padding: 12px 8px;
	}
	
	/* 옵션에도 스타일 적용 */
	.delivery-select option {
	    padding: 8px;
	    border-radius: 8px;
	    margin: 2px 0;
	}
					        
		        
        
    </style>
</head>
<body>
  <!-- 헤더 -->
    <%@ include file="../admin_header.jsp" %>
    

    <!-- 메인 컨테이너 -->
    <div class="container">
        <div class="admin-layout">
            
              <!-- 사이드바 -->
        <%@ include file="../admin_side.jsp"%>

            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <div class="section-card">
                    <div class="section-header">
                        <h2 class="section-title">📦 상품 관리</h2>
                        <div style="display: flex; gap: 10px;">
                            <button class="btn btn-primary" id="openModal">상품 등록</button>
                            <button class="btn btn-danger" id="deleteSelectedBtn">선택 삭제</button>
                        </div>
                    </div>

                    <!-- 검색 컨트롤 -->
                    <div class="search-controls">
                        <form action="${pageContext.request.contextPath}/adminpage/product" method="get" style="display: flex; gap: 10px; width: 100%;">
                            <input type="text" class="search-input" name="keyword" 
                                   placeholder="상품명으로 검색하세요" value="${param.keyword}">
                            <button type="submit" class="btn btn-primary">통합검색</button>
                        </form>
                    </div>

                    <!-- 상품 테이블 -->
                    <div class="table-container">
                        <form id="deleteForm" action="${pageContext.request.contextPath}/adminpage/product/delete_batch" method="post">
                            <table class="product-table">
                                <thead>
                                    <tr>
                                        <th width="5%"><input type="checkbox" id="checkAll"></th>
                                               <th width="8%">상품번호</th>
										        <th width="8%">카테고리</th>
										        <th width="8%">이미지</th>
										        <th width="18%">상품명</th>
										        <th width="10%">브랜드</th>
										        <th width="10%">가격</th>
										        <th width="6%">재고</th>
										        <th width="8%">송장번호</th>
										        <th width="8%">배송상태</th>
										        <th width="10%">관리</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty list}">
                                        
                                            <c:forEach var="product" items="${list}">
                                                <tr>
                                                    <td><input type="checkbox" name="product_idx_list" value="${product.product_idx}"></td>
                                                    <td>P${String.format("%03d", product.product_idx)}</td>
                                                    <td>C${product.category_idx}</td>
                                                    <td>
                                                        <img src="${pageContext.request.contextPath}/images/products_list/${product.product_image_url}" 
                                                             class="product-image" alt="상품이미지">
                                                    </td>
                                                    <td class="text-left">${product.product_name}</td>
                                                    <td>${product.product_brand}</td>
                                                    <td><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</td>
                                                    <td id="remain_${product.product_idx}">${product.product_cnt}개</td>
                                                    
                                                         <!-- 가상 송장번호 (상품번호 기반) -->
        											
													<td>
													    <input type="text" 
													           id="tracking_${product.product_idx}" 
													           class="tracking-input"
													           placeholder="OT${String.format('%08d', product.product_idx * 1000 + 240000)}"
													           onchange="updateTracking(${product.product_idx})"
													           oninput="checkTrackingFilled(${product.product_idx})">
													</td>
        											
        											 <!-- 배송상태: 첫 번째 옵션을 흐리게 표시 -->
										        	<td>
										            <select id="delivery_${product.product_idx}" 
										                    style="width: 80px; padding: 2px; font-size: 11px; color: #999;"
										                    onchange="updateDeliveryStatus(${product.product_idx})"
										                    onfocus="this.style.color='#333'">
										                <c:choose>
										                    <c:when test="${product.product_cnt >= 20}">
										                        <option value="" disabled selected style="color: #999;">상태선택</option>
													                        <option value="준비중">📦 준비중</option>
																	        <option value="배송중">🚚 배송중</option>
																	        <option value="배송완료">✅ 배송완료</option>
																	        <option value="반품">↩️ 반품</option>
																	        <option value="품절">❌ 품절</option>
										                    </c:when>
										                    <c:when test="${product.product_cnt >= 10}">
										                        <option value="" disabled selected style="color: #999;">상태선택</option>
										                        <option value="준비중">📦 준비중</option>
										                        <option value="배송중">🚚 배송중</option>
										                        <option value="배송완료">✅ 배송완료</option>
										                        <option value="반품">↩️ 반품</option>
										                    </c:when>
										                    <c:when test="${product.product_cnt > 0}">
										                        <option value="" disabled selected style="color: #999;">상태선택</option>
										                        <option value="준비중">📦 준비중</option>
										                        <option value="배송중">🚚 배송중</option>
										                        <option value="배송완료">✅ 배송완료</option>
										                        <option value="반품">↩️ 반품</option>
										                    </c:when>
										                    <c:otherwise>
										                        <option value="" disabled selected style="color: #999;">상태선택</option>
										                        <option value="품절">❌ 품절</option>
										                        <option value="준비중">📦 준비중</option>
										                        <option value="배송중">🚚 배송중</option>
										                        <option value="배송완료">✅ 배송완료</option>
										                        <option value="반품">↩️ 반품</option>
										                    </c:otherwise>
										                </c:choose>
										            </select>
										        </td>
											        											
                                                    
                                                    <td>
													    <div class="manage-buttons">
													        <button type="button" class="btn btn-primary btn-sm" 
													                onclick="editProduct(${product.product_idx})">수정</button>
													        <button type="button" class="btn btn-success btn-sm" 
													                onclick="openRemainModal(${product.product_idx}, '${product.product_name}')">재고</button>
													        <button type="button" class="btn btn-danger btn-sm" 
													                onclick="deleteSingleProduct(${product.product_idx})">삭제</button>
													    </div>
													</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="9" style="padding: 40px; color: #666; font-style: italic;">
                                                    검색 결과가 없거나 등록된 상품이 없습니다.
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </form>
                    </div>

                    <!-- 페이징 -->
                    <div class="pagination-wrapper">
                        <ul class="pagination">
                            <!-- 처음으로 -->
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=1<c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">
                                        &laquo;&laquo;
                                    </a>
                                </li>
                            </c:if>
                            
                            <!-- 이전 페이지 -->
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage-1}<c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">
                                        &laquo;
                                    </a>
                                </li>
                            </c:if>
                            
                            <!-- 페이지 번호 -->
                            <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
                                <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="?page=${pageNum}<c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">${pageNum}</a>
                                </li>
                            </c:forEach>
                            
                            <!-- 다음 페이지 -->
                            <c:if test="${currentPage < totalPage}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage+1}<c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">
                                        &raquo;
                                    </a>
                                </li>
                            </c:if>
                            
                            <!-- 마지막으로 -->
                            <c:if test="${currentPage < totalPage}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${totalPage}<c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">
                                        &raquo;&raquo;
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- 상품등록/수정 모달 -->
    <div id="productModal" class="modal">
        <div class="modal-content">
            <form name="f" method="post" enctype="multipart/form-data" id="productForm">
                <input type="hidden" id="product_idx" name="product_idx" value="0">
                <input type="hidden" id="mode" name="mode" value="insert">
                
                <div class="modal-header">
                    <h3 class="modal-title" id="modalTitle">상품 등록</h3>
                    <button class="modal-close" id="closeModal">×</button>
                </div>
                
                <div class="modal-body">
                    <!-- 현재 이미지 표시 (수정 모드일 때만) -->
                    <div class="current-image-container" id="currentImageDiv" style="display:none;">
                        <label class="form-label">현재 이미지</label>
                        <img id="currentImage" src="" class="current-image">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="category_idx">카테고리</label>
                        <select id="category_idx" name="category_idx" class="form-select">
                            <option value="">카테고리 선택</option>
                            <c:forEach var="category" items="${category_list}">
                                <option value="${category.category_idx}">${category.category_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="product_name">상품명</label>
                        <input type="text" id="product_name" name="product_name" class="form-input" placeholder="상품명을 입력하세요">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="product_brand">브랜드</label>
                        <input type="text" id="product_brand" name="product_brand" class="form-input" placeholder="브랜드명을 입력하세요">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="product_price">가격</label>
                        <input type="number" id="product_price" name="product_price" class="form-input" placeholder="가격을 입력하세요">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="product_comment">상품설명</label>
                        <textarea id="product_comment" name="product_comment" class="form-textarea" placeholder="상품설명을 입력하세요"></textarea>
                    </div>
                    
                    <!-- 해시태그 (직접 입력 + 선택) -->
                    <div class="form-group">
                        <label class="form-label">해시태그</label>
                        
                        <!-- 1. 직접 입력 섹션 -->
                        <div style="margin-bottom: 15px;">
                            <div style="display: flex; gap: 8px; margin-bottom: 10px;">
                                <input type="text" 
                                       id="newHashtagInput" 
                                       placeholder="새 해시태그 입력 (예: 여름, 신상)"
                                       style="flex: 1; padding: 8px 12px; border: 1px solid #e0e0e0; border-radius: 6px; font-size: 13px;"
                                       onkeypress="if(event.key==='Enter'){event.preventDefault();addCustomHashtag();}">
                                <button type="button" 
                                        onclick="addCustomHashtag()"
                                        style="padding: 8px 16px; background: #1a237e; color: white; border: none; border-radius: 6px; cursor: pointer; font-size: 13px; font-weight: 600; transition: background 0.2s;"
                                        onmouseover="this.style.background='#0d47a1'" 
                                        onmouseout="this.style.background='#1a237e'">
                                    추가
                                </button>
                            </div>
                            
                            <!-- 직접 입력한 태그들 표시 영역 -->
                            <div id="customHashtagsContainer" style="display: flex; flex-wrap: wrap; gap: 8px; min-height: 40px; padding: 10px; background: #f5f7fa; border-radius: 6px; border: 1px dashed #d0d0d0;">
                                <span style="color: #999; font-size: 12px; align-self: center;">직접 입력한 태그가 여기에 표시됩니다</span>
                            </div>
                        </div>
                        
                        <!-- 2. 기존 해시태그 선택 섹션 -->
                        <div style="margin-top: 15px;">
                            <div style="font-size: 13px; color: #666; margin-bottom: 8px; font-weight: 600;">
                                기존 해시태그 선택
                            </div>
                            <div id="hashtagListContainer" style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px; padding: 10px; border: 1px solid #e0e0e0; border-radius: 8px; min-height: 200px; background: white;">
                                <!-- 페이징된 해시태그 체크박스들이 여기에 표시됨 -->
                            </div>
                            
                            <!-- 페이징 네비게이션 -->
                            <div id="hashtagPagination" style="display: flex; justify-content: center; align-items: center; gap: 5px; margin-top: 12px;">
                                <!-- 페이징 버튼들이 여기에 표시됨 -->
                            </div>
                            
                            <!-- Hidden inputs for selected hashtag_idx_list (페이징 대응) -->
                            <div id="selectedHashtagsHidden" style="display: none;">
                                <!-- 선택된 해시태그 idx들이 hidden input으로 렌더링됨 -->
                            </div>
                        </div>
                        
                        <p style="margin-top: 8px; font-size: 12px; color: #666;">
                            💡 새 해시태그를 직접 입력하거나, 기존 해시태그를 선택하세요
                        </p>
                    </div>

<style>
/* 커스텀 해시태그 칩 스타일 */
.custom-hashtag-chip {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 6px 12px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 600;
    box-shadow: 0 2px 4px rgba(102, 126, 234, 0.3);
    animation: chipIn 0.3s ease;
}

@keyframes chipIn {
    from {
        opacity: 0;
        transform: scale(0.8);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}

.custom-hashtag-chip .remove-btn {
    cursor: pointer;
    font-size: 16px;
    line-height: 1;
    opacity: 0.8;
    transition: opacity 0.2s;
}

.custom-hashtag-chip .remove-btn:hover {
    opacity: 1;
}

/* 페이징 버튼 스타일 */
.page-btn {
    padding: 6px 12px;
    border: 1px solid #e0e0e0;
    background: white;
    border-radius: 6px;
    cursor: pointer;
    font-size: 13px;
    transition: all 0.2s;
    color: #333;
    min-width: 36px;
    text-align: center;
}

.page-btn:hover {
    background: #f5f7fa;
    border-color: #1a237e;
}

.page-btn.active {
    background: #1a237e;
    color: white;
    border-color: #1a237e;
    font-weight: 600;
}

.page-btn:disabled {
    opacity: 0.4;
    cursor: not-allowed;
}

.page-btn:disabled:hover {
    background: white;
    border-color: #e0e0e0;
}
</style>

<script>
// 전역 변수
let customHashtags = []; // 직접 입력한 해시태그 이름들
let allHashtags = []; // 전체 해시태그 리스트 (서버에서 받아옴)
let selectedHashtagIds = []; // 선택된 해시태그 idx들 (페이징 대응용)
let currentPage = 1;
const itemsPerPage = 9; // 페이지당 9개 (3x3 그리드)

// 페이지 로드 시 해시태그 리스트 초기화
document.addEventListener('DOMContentLoaded', function() {
    // 서버에서 받은 해시태그 리스트를 allHashtags에 저장
    allHashtags = [
        <c:forEach var="hashtag" items="${hashtag_list}" varStatus="status">
        {
            idx: ${hashtag.hashtag_idx},
            name: '${hashtag.hashtag_name}'
        }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];
    
    renderHashtagList();
});

// 커스텀 해시태그 추가
function addCustomHashtag() {
    const input = document.getElementById('newHashtagInput');
    let tagName = input.value.trim();
    
    // #이 맨 앞에 있으면 제거
    if (tagName.startsWith('#')) {
        tagName = tagName.substring(1);
    }
    
    if (tagName === '') {
        alert('해시태그를 입력해주세요');
        return;
    }
    
    // 특수문자 체크 (한글, 영문, 숫자만 허용)
    if (!/^[가-힣a-zA-Z0-9]+$/.test(tagName)) {
        alert('해시태그는 한글, 영문, 숫자만 사용할 수 있습니다');
        return;
    }
    
    // 중복 체크 (직접 입력한 것 중에서)
    if (customHashtags.includes(tagName)) {
        alert('이미 추가된 해시태그입니다');
        return;
    }
    
    // 기존 해시태그와 중복 체크
    const existingHashtag = allHashtags.find(h => h.name === tagName);
    if (existingHashtag) {
        alert('이미 존재하는 해시태그입니다. 아래 목록에서 선택해주세요.');
        return;
    }
    
    // 추가
    customHashtags.push(tagName);
    renderCustomHashtags();
    input.value = '';
}

// 커스텀 해시태그 렌더링
// 커스텀 해시태그 렌더링
function renderCustomHashtags() {
    const container = document.getElementById('customHashtagsContainer');
    
    if (customHashtags.length === 0) {
        container.innerHTML = '<span style="color: #999; font-size: 12px; align-self: center;">직접 입력한 태그가 여기에 표시됩니다</span>';
        return;
    }
    
    let html = '';
    for (let i = 0; i < customHashtags.length; i++) {
        const tag = customHashtags[i];
        html += '<div class="custom-hashtag-chip">';
        html += '<span>#' + tag + '</span>';
        html += '<span class="remove-btn" onclick="removeCustomHashtag(' + i + ')">×</span>';
        html += '<input type="hidden" name="hashtag_names" value="' + tag + '">';
        html += '</div>';
    }
    container.innerHTML = html;
}

// 커스텀 해시태그 삭제
function removeCustomHashtag(index) {
    customHashtags.splice(index, 1);
    renderCustomHashtags();
}

// 해시태그 리스트 렌더링 (페이징 적용)
function renderHashtagList() {
    const totalPages = Math.ceil(allHashtags.length / itemsPerPage);
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const currentHashtags = allHashtags.slice(startIndex, endIndex);
    
    const container = document.getElementById('hashtagListContainer');
    
    if (currentHashtags.length === 0) {
        container.innerHTML = '<div style="grid-column: 1 / -1; text-align: center; padding: 40px; color: #999;">등록된 해시태그가 없습니다</div>';
    } else {
        let html = '';
        for (let i = 0; i < currentHashtags.length; i++) {
            const hashtag = currentHashtags[i];
            const isChecked = selectedHashtagIds.includes(hashtag.idx);
            
            html += '<label style="display: flex; align-items: center; gap: 6px; padding: 8px 12px; cursor: pointer; border-radius: 6px; transition: background 0.2s; font-size: 13px; border: 1px solid #e8e8e8;" ';
            html += 'onmouseover="this.style.background=\'#f5f7fa\'; this.style.borderColor=\'#1a237e\'" ';
            html += 'onmouseout="this.style.background=\'white\'; this.style.borderColor=\'#e8e8e8\'">';
            html += '<input type="checkbox" value="' + hashtag.idx + '" class="hashtag-checkbox" ';
            html += 'onchange="handleHashtagChange(' + hashtag.idx + ', this.checked)" ';
            html += 'style="cursor: pointer; width: 16px; height: 16px; accent-color: #1a237e;"';
            if (isChecked) {
                html += ' checked';
            }
            html += '>';
            html += '<span style="color: #1a237e; font-weight: 500;">#' + hashtag.name + '</span>';
            html += '</label>';
        }
        container.innerHTML = html;
    }
    
    renderPagination(totalPages);
}

// 해시태그 체크박스 변경 처리
function handleHashtagChange(idx, checked) {
    if (checked) {
        // 체크됨 → 배열에 추가
        if (!selectedHashtagIds.includes(idx)) {
            selectedHashtagIds.push(idx);
        }
    } else {
        // 체크 해제 → 배열에서 제거
        const index = selectedHashtagIds.indexOf(idx);
        if (index > -1) {
            selectedHashtagIds.splice(index, 1);
        }
    }
    
    // hidden input 렌더링
    renderSelectedHashtags();
    
    console.log('선택된 해시태그 IDX:', selectedHashtagIds);
}

// 선택된 해시태그를 hidden input으로 렌더링
function renderSelectedHashtags() {
    const container = document.getElementById('selectedHashtagsHidden');
    
    let html = '';
    for (let i = 0; i < selectedHashtagIds.length; i++) {
        html += '<input type="hidden" name="hashtag_idx_list" value="' + selectedHashtagIds[i] + '">';
    }
    container.innerHTML = html;
}

// 페이징 네비게이션 렌더링
// 페이징 네비게이션 렌더링
function renderPagination(totalPages) {
    const container = document.getElementById('hashtagPagination');
    
    if (totalPages <= 1) {
        container.innerHTML = '';
        return;
    }
    
    let html = '';
    
    // 이전 버튼
    html += '<button class="page-btn" onclick="changePage(' + (currentPage - 1) + ')"';
    if (currentPage === 1) {
        html += ' disabled';
    }
    html += '>◀</button>';
    
    // 페이지 번호들
    const maxVisiblePages = 5;
    let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
    let endPage = Math.min(totalPages, startPage + maxVisiblePages - 1);
    
    if (endPage - startPage < maxVisiblePages - 1) {
        startPage = Math.max(1, endPage - maxVisiblePages + 1);
    }
    
    if (startPage > 1) {
        html += '<button class="page-btn" onclick="changePage(1)">1</button>';
        if (startPage > 2) {
            html += '<span style="padding: 0 8px; color: #999;">...</span>';
        }
    }
    
    for (let i = startPage; i <= endPage; i++) {
        html += '<button class="page-btn';
        if (i === currentPage) {
            html += ' active';
        }
        html += '" onclick="changePage(' + i + ')">' + i + '</button>';
    }
    
    if (endPage < totalPages) {
        if (endPage < totalPages - 1) {
            html += '<span style="padding: 0 8px; color: #999;">...</span>';
        }
        html += '<button class="page-btn" onclick="changePage(' + totalPages + ')">' + totalPages + '</button>';
    }
    
    // 다음 버튼
    html += '<button class="page-btn" onclick="changePage(' + (currentPage + 1) + ')"';
    if (currentPage === totalPages) {
        html += ' disabled';
    }
    html += '>▶</button>';
    
    container.innerHTML = html;
}

// 페이지 변경
function changePage(page) {
    const totalPages = Math.ceil(allHashtags.length / itemsPerPage);
    if (page < 1 || page > totalPages) return;
    
    currentPage = page;
    renderHashtagList();
}
</script>

                    <div class="form-group">
                        <label class="form-label" for="product_cnt">재고수량</label>
                        <input type="number" id="product_cnt" name="product_cnt" class="form-input" placeholder="재고수량을 입력하세요" value="0">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="photo">상품 메인이미지</label>
                        <input type="file" id="photo" name="photo" class="form-input" accept="image/*">
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="photo">상품 서브이미지</label>
                        <input type="file" id="photo_sub" name="photo_sub" class="form-input" accept="image/*" multiple>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="photo">상품 내용이미지</label>
                        <input type="file" id="photo_content" name="photo_content" class="form-input" accept="image/*" multiple>
                    </div>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
                    <button type="button" class="btn btn-primary" id="submitBtn" onclick="send(this.form);return false;">등록하기</button>
                </div>
            </form>
        </div>
    </div>
    <!-- 재고 등록 모달 -->
		<div id="remainModal" class="modal">
		    <div class="modal-content">
		        <div class="modal-header">
		            <h3 class="modal-title">재고 등록</h3>
		            <button class="modal-close" onclick="closeRemainModal()">×</button>
		        </div>
		        
		        <div class="modal-body">
		            <div class="form-group">
		                <label class="form-label">상품명</label>
		                <input type="text" id="remain_product_name" class="form-input" readonly>
		            </div>
		            
		            <div class="form-group">
		                <label class="form-label" for="remain_name">재고명</label>
		                <input type="text" id="remain_name" class="form-input" placeholder="재고 등록 내역을 입력하세요 (예: 신규입고, 추가주문 등)">
		            </div>
		            
		            <div class="form-group">
		                <label class="form-label" for="remain_cnt">재고수량</label>
		                <input type="number" id="remain_cnt" class="form-input" placeholder="추가할 재고수량을 입력하세요" min="1">
		            </div>
		            
		            <!-- 재고 이력 테이블 -->
		            <div id="remainHistoryDiv">
		                <h4 style="margin: 20px 0 10px 0; color: #1a237e;">재고 등록 이력</h4>
		                <table class="remain-history-table" id="remainHistoryTable">
		                    <thead>
		                        <tr>
		                            <th>등록일시</th>
		                            <th>재고명</th>      
		                            <th>수량</th>
		                        </tr>
		                    </thead>
		                    <tbody id="remainHistoryBody">
		                        <!-- 동적으로 생성됨 -->
		                    </tbody>
		                </table>
		            </div>
		        </div>
		        
		        <div class="modal-footer">
		            <button type="button" class="btn btn-secondary" onclick="closeRemainModal()">나가기</button>
		            <button type="button" class="btn btn-success" onclick="insertRemain()">재고등록</button>
		        </div>
		    </div>
		</div>
		    
		    

    <script>
        // 모달 관련 변수
        var modal = document.getElementById("productModal");
        var openBtn = document.getElementById("openModal");
        var closeBtn = document.getElementById("closeModal");
        var cancelBtn = document.getElementById("cancelBtn");

        // 모달 열기 - 등록 모드
        openBtn.onclick = function() {
            document.getElementById("mode").value = "insert";
            document.getElementById("product_idx").value = "0";
            document.getElementById("modalTitle").textContent = "상품 등록";
            document.getElementById("submitBtn").textContent = "등록하기";
            document.getElementById("currentImageDiv").style.display = "none";
            
            // 폼 초기화
            document.getElementById("productForm").reset();
			
           	// 해시태그 초기화
            $("input[name='hashtag_idx_list']").prop('checked', false);
            customHashtags = [];
            selectedHashtagIds = [];
            renderCustomHashtags();
            renderSelectedHashtags();
            currentPage = 1;
            renderHashtagList();

            modal.classList.add("active");
        }

        // 수정 버튼 클릭 시
        function editProduct(product_idx) {
            $.ajax({
                url: "${pageContext.request.contextPath}/adminpage/product/get",
                type: "GET",
                data: { product_idx: product_idx },
                success: function(vo) {
                    // 모드 설정
                    document.getElementById("mode").value = "update";
                    document.getElementById("product_idx").value = vo.product_idx;
                    document.getElementById("modalTitle").textContent = "상품 수정";
                    document.getElementById("submitBtn").textContent = "수정하기";
                    
                    // 폼 필드에 값 설정
                    document.getElementById("category_idx").value = vo.category_idx;
                    document.getElementById("product_name").value = vo.product_name;
                    document.getElementById("product_brand").value = vo.product_brand || '';
                    document.getElementById("product_price").value = vo.product_price;
                    document.getElementById("product_comment").value = vo.product_comment ? vo.product_comment.replace(/<br>/g, '\n') : '';
                    document.getElementById("product_cnt").value = vo.product_cnt;
                    
                    // 현재 이미지 표시
                    if (vo.product_image_url) {
                        document.getElementById("currentImageDiv").style.display = "block";
                        document.getElementById("currentImage").src = 
                            "${pageContext.request.contextPath}/images/products_list/" + vo.product_image_url;
                    }
                    
                    // 해시태그 초기화 및 설정
                    customHashtags = [];
                    selectedHashtagIds = [];
                    renderCustomHashtags();
                    
                    if (vo.hashtag_list && vo.hashtag_list.length > 0) {
                        vo.hashtag_list.forEach(function(hashtag) {
                            selectedHashtagIds.push(hashtag.hashtag_idx);
                        });
                    }
                    
                    renderSelectedHashtags();
                    currentPage = 1;
                    renderHashtagList();
                    
                    // 모달 열기
                    modal.classList.add("active");
                },
                error: function() {
                    alert("상품 정보를 불러오는데 실패했습니다.");
                }
            });
        }

        // 모달 닫기
        function closeModal() {
            modal.classList.remove("active");
        }

        closeBtn.onclick = closeModal;
        cancelBtn.onclick = closeModal;

        // 모달 외부 클릭시 닫기
        window.onclick = function(event) {
            if (event.target == modal) {
                //closeModal();
            }
        }

        // 폼 제출
        function send(f) {
            let mode = f.mode.value;
            
            // 입력 검증
            if (f.category_idx.value == "") {
                alert("카테고리를 선택하세요!");
                return;
            }
            if (f.product_name.value == "") {
                alert("상품명을 입력하세요!");
                return;
            }
            if (f.product_price.value == "") {
                alert("가격을 입력하세요!");
                return;
            }
            if (f.product_comment.value == "") {
                alert("상품설명을 입력하세요!");
                return;
            }
            if (f.product_cnt.value == "") {
                alert("재고수량을 입력하세요!");
                return;
            }
            if (mode == "insert" && f.photo.value == "") {
                alert("상품 메인이미지를 선택하세요!");
                return;
            }
            if (mode == "insert" && f.photo_sub.value == "") {
                alert("상품 서브이미지를 선택하세요!");
                return;
            }if (mode == "insert" && f.photo_content.value == "") {
                alert("상품 내용이미지를 선택하세요!");
                return;
            }    

            // 폼 제출
            if (mode == "insert") {
                f.action = "${pageContext.request.contextPath}/adminpage/product/insert";
            } else {
                f.action = "${pageContext.request.contextPath}/adminpage/product/update";
            }
            f.method="post";
            f.enctype = "multipart/form-data";
            f.submit();
        }

        // 단일 삭제
        function deleteSingleProduct(product_idx) {
            if (confirm('상품을 삭제하시겠습니까?')) {
                window.location.href = '${pageContext.request.contextPath}/adminpage/product/delete?product_idx=' + product_idx;
            }
        }

        // 로그아웃
        function handleLogout() {
            if (confirm('로그아웃 하시겠습니까?')) {
                alert('로그아웃되었습니다.');
                window.location.href = '/';
            }
        }

        // 페이지 로드 시 초기화
        $(document).ready(function() {
            // 전체 선택 체크박스
            $("#checkAll").change(function() {
                $("input[name='product_idx_list']").prop('checked', $(this).prop('checked'));
            });
            
            // 선택 삭제 버튼
            $("#deleteSelectedBtn").click(function() {
                const checkedItems = $("input[name='product_idx_list']:checked");
                
                if (checkedItems.length === 0) {
                    alert('삭제할 상품을 하나 이상 선택하세요.');
                    return;
                }
                
                if (confirm(checkedItems.length + '개의 상품을 정말로 삭제하시겠습니까?')) {
                    $("#deleteForm").submit();
                }
            });
        });
        
     // ====== 재고 관리 기능 추가 ======

     // 현재 선택된 상품 idx 저장
     var selectedProductIdx = 0;

     // 재고 등록 모달 열기
     function openRemainModal(product_idx, product_name) {
         selectedProductIdx = product_idx;
         
         // 상품명 설정
         document.getElementById("remain_product_name").value = product_name;
         
         // 입력 필드 초기화
         document.getElementById("remain_name").value = "";
         document.getElementById("remain_cnt").value = "";
         
         // 재고 이력 불러오기
         loadRemainHistory(product_idx);
         
         // 모달 열기
         document.getElementById("remainModal").classList.add("active");
     }

     // 재고 등록 모달 닫기
     function closeRemainModal() {
         document.getElementById("remainModal").classList.remove("active");
     }

     // 재고 이력 불러오기
     function loadRemainHistory(product_idx) {
         $.ajax({
             url: "${pageContext.request.contextPath}/adminpage/product/remain/list",
             type: "GET",
             data: { product_idx: product_idx },
             success: function(data) {
                 console.log("재고이력 데이터:", data);
                 
                 var tbody = $("#remainHistoryBody");
                 tbody.empty();
                 
                 if (data.length > 0) {
                     $.each(data, function(index, item) {
                         var regdate = new Date(item.remain_regdate).toLocaleDateString('ko-KR', {
                             year: 'numeric',
                             month: '2-digit',
                             day: '2-digit',
                             hour: '2-digit',
                             minute: '2-digit'
                         });
                         
                         var row = "<tr>" +
                                     "<td>" + regdate + "</td>" +
                                     "<td>" + item.remain_name + "</td>" +
                                     "<td>" + item.remain_cnt + "개</td>" +
                                   "</tr>";
                         tbody.append(row);
                     });
                 } else {
                     tbody.append("<tr><td colspan='3' style='color:#666; font-style:italic;'>재고 등록 이력이 없습니다.</td></tr>");
                 }
             },
             error: function() {
                 console.error("재고 이력을 불러오는데 실패했습니다.");
                 $("#remainHistoryBody").html("<tr><td colspan='3' style='color:#d32f2f;'>재고 이력을 불러오는데 실패했습니다.</td></tr>");
             }
         });
     }

     // 재고 등록 처리
     function insertRemain() {
    	 console.log("=== insertRemain 함수 호출됨 ==="); 
     
         var remain_name = document.getElementById("remain_name").value.trim();
         var remain_cnt = document.getElementById("remain_cnt").value;
         
         // 입력 검증
         if (remain_name === "") {
             alert("재고명을 입력하세요!");
             document.getElementById("remain_name").focus();
             return;
         }
         
         if (remain_cnt === "" || remain_cnt <= 0) {
             alert("재고수량을 올바르게 입력하세요!");
             document.getElementById("remain_cnt").focus();
             return;
         }
         
         // AJAX 요청
         $.ajax({
             url: "${pageContext.request.contextPath}/adminpage/product/remain/insert",
             type: "POST",
             data: {
                 product_idx: selectedProductIdx,
                 remain_name: remain_name,
                 remain_cnt: remain_cnt
             },
             success: function(result) {
                 console.log("재고등록 결과:", result);
                 
                 if (result.success) {
                     alert(result.message);
                     
                     // 테이블의 재고수량 업데이트
                     $("#remain_" + selectedProductIdx).text(result.newCnt + "개");
                     
                     // 재고 이력 다시 불러오기
                     loadRemainHistory(selectedProductIdx);
                     
                     // 입력 필드 초기화
                     document.getElementById("remain_name").value = "";
                     document.getElementById("remain_cnt").value = "";
                 } else {
                     alert(result.message);
                 }
             },
             error: function() {
                 alert("재고 등록 중 오류가 발생했습니다.");
             }
         });
     }
      
  // 송장번호 변경
     function updateTracking(productIdx) {
         const trackingInput = document.getElementById('tracking_' + productIdx);
         const trackingNumber = trackingInput.value;
         
         if(trackingNumber.trim() !== '') {
             trackingInput.style.color = '#333';
             trackingInput.style.fontWeight = 'normal';
             
             console.log('상품 ' + productIdx + ' 송장번호 변경: ' + trackingNumber);
             
             Swal.fire({
                 title: '송장번호 입력',
                 text: '송장번호가 ' + trackingNumber + '로 입력되었습니다.',
                 icon: 'success',
                 timer: 1500,
                 showConfirmButton: false
             });
         }
     }

     // 배송상태 변경
     function updateDeliveryStatus(productIdx) {
         const selectElement = document.getElementById('delivery_' + productIdx);
         const deliveryStatus = selectElement.value;
         
         if(deliveryStatus !== '') {
             // 선택됐을 때 색상과 스타일 변경
             selectElement.style.color = '#333';
             selectElement.style.fontWeight = 'bold';
             selectElement.className = 'status-' + deliveryStatus;
             
             console.log('상품 ' + productIdx + ' 배송상태 변경: ' + deliveryStatus);
             
             Swal.fire({
                 title: '배송상태 변경',
                 text: '배송상태가 "' + deliveryStatus + '"로 변경되었습니다.',
                 icon: 'success',
                 timer: 1500,
                 showConfirmButton: false
             });
         }
     }

     // 페이지 로드시 모든 입력 필드 초기화
     $(document).ready(function() {
         // 모든 송장번호 입력 필드를 비워두기
         $('input[id^="tracking_"]').val('');
         
         // 모든 배송상태 셀렉트를 첫 번째 옵션으로 설정
         $('select[id^="delivery_"]').prop('selectedIndex', 0);
     });
     
        
        
    </script>
</body>
</html>