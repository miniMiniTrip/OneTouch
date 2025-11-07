<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 해시태그 입력 컴포넌트 -->
<style>
    .hashtag-input-container {
        background-color: #f8f9fa;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 20px;
    }
    
    .hashtag-input-box {
        position: relative;
        margin-bottom: 15px;
    }
    
    .hashtag-input {
        width: 100%;
        padding: 12px 15px;
        border: 2px solid #dee2e6;
        border-radius: 6px;
        font-size: 14px;
        transition: border-color 0.3s;
    }
    
    .hashtag-input:focus {
        outline: none;
        border-color: #0d6efd;
    }
    
    .hashtag-suggestions {
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;
        background: white;
        border: 1px solid #dee2e6;
        border-radius: 6px;
        max-height: 200px;
        overflow-y: auto;
        z-index: 1000;
        display: none;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    
    .hashtag-suggestions.show {
        display: block;
    }
    
    .suggestion-item {
        padding: 10px 15px;
        cursor: pointer;
        transition: background-color 0.2s;
    }
    
    .suggestion-item:hover {
        background-color: #f8f9fa;
    }
    
    .suggestion-item .badge {
        font-size: 11px;
        margin-left: 8px;
    }
    
    .selected-hashtags {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        min-height: 40px;
        padding: 10px;
        background: white;
        border: 2px solid #dee2e6;
        border-radius: 6px;
    }
    
    .hashtag-tag {
        display: inline-flex;
        align-items: center;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 500;
        animation: fadeIn 0.3s;
    }
    
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: scale(0.8);
        }
        to {
            opacity: 1;
            transform: scale(1);
        }
    }
    
    .hashtag-tag .remove-tag {
        margin-left: 8px;
        cursor: pointer;
        opacity: 0.8;
        transition: opacity 0.2s;
        font-weight: bold;
    }
    
    .hashtag-tag .remove-tag:hover {
        opacity: 1;
    }
    
    .hashtag-count {
        font-size: 12px;
        color: #6c757d;
        text-align: right;
        margin-top: 5px;
    }
    
    .hashtag-count.warning {
        color: #dc3545;
        font-weight: bold;
    }
    
    .popular-hashtags {
        margin-top: 15px;
    }
    
    .popular-hashtags-title {
        font-size: 13px;
        color: #6c757d;
        margin-bottom: 10px;
        font-weight: 600;
    }
    
    .popular-tag {
        display: inline-block;
        padding: 5px 12px;
        margin: 4px;
        background: white;
        border: 1px solid #dee2e6;
        border-radius: 15px;
        font-size: 12px;
        cursor: pointer;
        transition: all 0.2s;
    }
    
    .popular-tag:hover {
        background: #e9ecef;
        border-color: #adb5bd;
        transform: translateY(-2px);
    }
    
    .hashtag-helper-text {
        font-size: 12px;
        color: #6c757d;
        margin-top: 8px;
    }
</style>

<div class="hashtag-input-container">
    <label class="form-label">
        <i class="lni lni-tag"></i> 해시태그 
        <span class="text-muted">(최대 10개)</span>
    </label>
    
    <!-- 해시태그 입력 필드 -->
    <div class="hashtag-input-box">
        <input type="text" 
               id="hashtagInput" 
               class="hashtag-input" 
               placeholder="해시태그 입력 후 Enter (# 없이 입력하세요)"
               autocomplete="off">
        
        <!-- 자동완성 제안 -->
        <div id="hashtagSuggestions" class="hashtag-suggestions"></div>
    </div>
    
    <!-- 선택된 해시태그 표시 -->
    <div class="selected-hashtags" id="selectedHashtags">
        <span class="text-muted" id="emptyMessage">해시태그를 추가해보세요</span>
    </div>
    
    <!-- 카운터 -->
    <div class="hashtag-count" id="hashtagCount">0 / 10</div>
    
    <!-- Hidden input for form submission -->
    <input type="hidden" name="hashtags" id="hashtagsValue">
    
    <!-- 인기 해시태그 (선택사항) -->
    <div class="popular-hashtags">
        <div class="popular-hashtags-title">💡 인기 해시태그</div>
        <div id="popularHashtags">
            <!-- AJAX로 로드될 인기 해시태그 -->
        </div>
    </div>
    
    <div class="hashtag-helper-text">
        <i class="lni lni-information"></i> 
        Enter로 추가하거나 인기 해시태그를 클릭하세요
    </div>
</div>

<script>
// 해시태그 관리 스크립트
(function() {
    const selectedHashtags = [];
    const MAX_HASHTAGS = 10;
    
    const input = document.getElementById('hashtagInput');
    const suggestionsBox = document.getElementById('hashtagSuggestions');
    const selectedBox = document.getElementById('selectedHashtags');
    const emptyMessage = document.getElementById('emptyMessage');
    const countDisplay = document.getElementById('hashtagCount');
    const hiddenInput = document.getElementById('hashtagsValue');
    
    let allHashtags = []; // 전체 해시태그 목록 (AJAX로 로드)
    
    // 초기 데이터 로드
    loadHashtags();
    loadPopularHashtags();
    
    // 기존 해시태그 로드 (수정 모드)
    <c:if test="${not empty existingHashtags}">
        const existingTags = '${existingHashtags}'.split(',');
        existingTags.forEach(tag => {
            if (tag.trim()) {
                addHashtag(tag.trim());
            }
        });
    </c:if>
    
    // 전체 해시태그 목록 로드
    function loadHashtags() {
        fetch('${pageContext.request.contextPath}/api/hashtag/list')
            .then(response => response.json())
            .then(data => {
                allHashtags = data;
            })
            .catch(error => {
                console.error('해시태그 로드 실패:', error);
            });
    }
    
    // 입력 이벤트
    input.addEventListener('input', function(e) {
        const value = e.target.value.replace(/^#/, ''); // # 제거
        
        if (value.length > 0) {
            showSuggestions(value);
        } else {
            hideSuggestions();
        }
    });
    
    // Enter 키 처리
    input.addEventListener('keydown', function(e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            const value = input.value.trim().replace(/^#/, '');
            
            if (value) {
                addHashtag(value);
                input.value = '';
                hideSuggestions();
            }
        }
    });
    
    // 자동완성 표시
    function showSuggestions(query) {
        const filtered = allHashtags.filter(tag => 
            tag.hashtag_name.toLowerCase().includes(query.toLowerCase()) &&
            !selectedHashtags.includes(tag.hashtag_name)
        ).slice(0, 5);
        
        if (filtered.length > 0) {
            suggestionsBox.innerHTML = filtered.map(tag => 
                `<div class="suggestion-item" onclick="hashtagComponent.selectSuggestion('${tag.hashtag_name}')">
                    #${tag.hashtag_name}
                    <span class="badge bg-secondary">${tag.useCount || 0}회</span>
                </div>`
            ).join('');
            suggestionsBox.classList.add('show');
        } else {
            hideSuggestions();
        }
    }
    
    // 자동완성 숨기기
    function hideSuggestions() {
        suggestionsBox.classList.remove('show');
    }
    
    // 해시태그 추가
    function addHashtag(tagName) {
        // # 제거 및 공백 제거
        tagName = tagName.replace(/^#/, '').trim();
        
        // 유효성 검사
        if (!tagName) {
            alert('해시태그를 입력해주세요.');
            return false;
        }
        
        if (selectedHashtags.length >= MAX_HASHTAGS) {
            alert(`해시태그는 최대 ${MAX_HASHTAGS}개까지만 추가할 수 있습니다.`);
            return false;
        }
        
        if (selectedHashtags.includes(tagName)) {
            alert('이미 추가된 해시태그입니다.');
            return false;
        }
        
        // 특수문자 검사
        if (!/^[가-힣a-zA-Z0-9]+$/.test(tagName)) {
            alert('해시태그는 한글, 영문, 숫자만 사용할 수 있습니다.');
            return false;
        }
        
        // 추가
        selectedHashtags.push(tagName);
        renderHashtags();
        updateHiddenInput();
        
        return true;
    }
    
    // 해시태그 제거
    function removeHashtag(tagName) {
        const index = selectedHashtags.indexOf(tagName);
        if (index > -1) {
            selectedHashtags.splice(index, 1);
            renderHashtags();
            updateHiddenInput();
        }
    }
    
    // 해시태그 렌더링
    function renderHashtags() {
        if (selectedHashtags.length === 0) {
            selectedBox.innerHTML = '<span class="text-muted" id="emptyMessage">해시태그를 추가해보세요</span>';
        } else {
            selectedBox.innerHTML = selectedHashtags.map(tag => 
                `<span class="hashtag-tag">
                    #${tag}
                    <span class="remove-tag" onclick="hashtagComponent.remove('${tag}')">×</span>
                </span>`
            ).join('');
        }
        
        // 카운터 업데이트
        const count = selectedHashtags.length;
        countDisplay.textContent = `${count} / ${MAX_HASHTAGS}`;
        countDisplay.classList.toggle('warning', count >= MAX_HASHTAGS);
    }
    
    // Hidden input 업데이트
    function updateHiddenInput() {
        hiddenInput.value = selectedHashtags.join(',');
    }
    
    // 제안에서 선택
    function selectSuggestion(tagName) {
        addHashtag(tagName);
        input.value = '';
        hideSuggestions();
    }
    
    // 인기 태그에서 추가
    function addFromPopular(tagName) {
        if (addHashtag(tagName)) {
            input.focus();
        }
    }
    
    // 외부에서 접근 가능하도록
    window.hashtagComponent = {
        add: addHashtag,
        remove: removeHashtag,
        selectSuggestion: selectSuggestion,
        addFromPopular: addFromPopular,
        getSelected: () => selectedHashtags,
        clear: () => {
            selectedHashtags.length = 0;
            renderHashtags();
            updateHiddenInput();
        }
    };
    
    // 클릭 외부 영역 클릭 시 자동완성 닫기
    document.addEventListener('click', function(e) {
        if (!input.contains(e.target) && !suggestionsBox.contains(e.target)) {
            hideSuggestions();
        }
    });
    
})();
</script>
