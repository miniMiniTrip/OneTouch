/**
 * 장바구니 추가 기능 - 상품 상세 페이지에서 사용
 * ShopGrids 템플릿과 통합된 장바구니 기능
 */

// 장바구니에 상품 추가
function addToCart(productId, quantity = 1) {
    // 로딩 표시
    showLoading();
    
    fetch('/cart/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            productId: productId,
            quantity: quantity
        })
    })
    .then(response => response.json())
    .then(data => {
        hideLoading();
        
        if (data.success) {
            // 성공 메시지 표시
            showSuccessToast(data.message);
            
            // 헤더의 장바구니 개수 업데이트
            updateCartCount();
            
        } else if (data.needLogin) {
            // 로그인 필요
            if (confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?')) {
                location.href = '/login?redirect=' + encodeURIComponent(location.pathname);
            }
        } else {
            // 에러 메시지 표시
            showErrorToast(data.message);
        }
    })
    .catch(error => {
        hideLoading();
        console.error('Error:', error);
        showErrorToast('오류가 발생했습니다. 다시 시도해주세요.');
    });
}

// 장바구니 개수 업데이트 (헤더용)
function updateCartCount() {
    fetch('/cart/count')
        .then(response => response.json())
        .then(data => {
            const cartBadge = document.querySelector('.cart-badge');
            if (cartBadge) {
                cartBadge.textContent = data.count;
                if (data.count > 0) {
                    cartBadge.classList.add('active');
                } else {
                    cartBadge.classList.remove('active');
                }
            }
        })
        .catch(error => console.error('Error:', error));
}

// 성공 토스트 메시지
function showSuccessToast(message) {
    const toast = document.createElement('div');
    toast.className = 'custom-toast success';
    toast.innerHTML = `
        <i class="lni lni-checkmark-circle"></i>
        <span>${message}</span>
    `;
    document.body.appendChild(toast);
    
    setTimeout(() => {
        toast.classList.add('show');
    }, 100);
    
    setTimeout(() => {
        toast.classList.remove('show');
        setTimeout(() => {
            document.body.removeChild(toast);
        }, 300);
    }, 3000);
}

// 에러 토스트 메시지
function showErrorToast(message) {
    const toast = document.createElement('div');
    toast.className = 'custom-toast error';
    toast.innerHTML = `
        <i class="lni lni-warning"></i>
        <span>${message}</span>
    `;
    document.body.appendChild(toast);
    
    setTimeout(() => {
        toast.classList.add('show');
    }, 100);
    
    setTimeout(() => {
        toast.classList.remove('show');
        setTimeout(() => {
            document.body.removeChild(toast);
        }, 300);
    }, 3000);
}

// 로딩 표시
function showLoading() {
    const loader = document.createElement('div');
    loader.id = 'cart-loader';
    loader.className = 'custom-loader';
    loader.innerHTML = '<div class="spinner"></div>';
    document.body.appendChild(loader);
}

// 로딩 숨김
function hideLoading() {
    const loader = document.getElementById('cart-loader');
    if (loader) {
        document.body.removeChild(loader);
    }
}

// 페이지 로드 시 장바구니 개수 업데이트
document.addEventListener('DOMContentLoaded', function() {
    updateCartCount();
});

/* ============================================
   토스트 및 로더 CSS (main.css에 추가)
   ============================================ */

/*
.custom-toast {
    position: fixed;
    bottom: 30px;
    right: 30px;
    background: #fff;
    padding: 15px 20px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    display: flex;
    align-items: center;
    gap: 10px;
    z-index: 10000;
    opacity: 0;
    transform: translateY(20px);
    transition: all 0.3s ease;
}

.custom-toast.show {
    opacity: 1;
    transform: translateY(0);
}

.custom-toast.success {
    border-left: 4px solid #28a745;
}

.custom-toast.error {
    border-left: 4px solid #dc3545;
}

.custom-toast i {
    font-size: 20px;
}

.custom-toast.success i {
    color: #28a745;
}

.custom-toast.error i {
    color: #dc3545;
}

.custom-loader {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.3);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
}

.custom-loader .spinner {
    width: 50px;
    height: 50px;
    border: 4px solid #f3f3f3;
    border-top: 4px solid #081828;
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
*/
