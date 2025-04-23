---
title: 开发工具集
date: 2025-04-23
layout: page
tags:
  - 工具
---

{% raw %}
// ... existing code ...
<div class="dev-tools">
    <div class="container">
        <h1>开发工具集</h1>
        
        <!-- 工具选择标签页 -->
        <div class="tabs">
            <button class="tab-btn active" onclick="switchTab('json')">JSON工具</button>
            <button class="tab-btn" onclick="switchTab('timestamp')">时间戳工具</button>
        </div>

        <!-- JSON工具部分 -->
        <div id="json-tool" class="tool-section active">
            <div class="resizable-container">
                <div class="resizable-panel input-section">
                    <div class="panel-header">
                        <span>输入</span>
                        <div class="panel-controls">
                            <button class="expand-btn" onclick="toggleFullscreen(this)">⤢</button>
                        </div>
                    </div>
                    <textarea id="inputJson" placeholder="请输入JSON数据..."></textarea>
                    <div class="buttons">
                        <button onclick="formatJson()">格式化</button>
                        <button onclick="minifyJson()">压缩</button>
                        <button onclick="validateJson()">验证</button>
                        <button onclick="copyToClipboard('outputJson')">复制结果</button>
                        <button onclick="clearJson()">清空</button>
                    </div>
                </div>
                <div class="resize-handle horizontal"></div>
                <div class="resizable-panel output-section">
                    <div class="panel-header">
                        <span>输出</span>
                        <div class="panel-controls">
                            <button class="expand-btn" onclick="toggleFullscreen(this)">⤢</button>
                        </div>
                    </div>
                    <pre id="outputJson" class="json-output"></pre>
                    <div id="jsonError" class="error-message"></div>
                </div>
            </div>
        </div>

        <!-- 时间戳工具部分 -->
        <div id="timestamp-tool" class="tool-section">
            <div class="resizable-container">
                <div class="resizable-panel input-section">
                    <div class="panel-header">
                        <span>输入</span>
                        <div class="panel-controls">
                            <button class="expand-btn" onclick="toggleFullscreen(this)">⤢</button>
                        </div>
                    </div>
                    <div class="timestamp-input">
                        <input type="text" id="timestampInput" placeholder="输入时间戳或日期">
                        <select id="timestampUnit">
                            <option value="seconds">秒</option>
                            <option value="milliseconds">毫秒</option>
                        </select>
                    </div>
                    <div class="buttons">
                        <button onclick="convertTimestamp()">转换</button>
                        <button onclick="getCurrentTimestamp()">当前时间戳</button>
                        <button onclick="copyToClipboard('timestampOutput')">复制结果</button>
                        <button onclick="clearTimestamp()">清空</button>
                    </div>
                </div>
                <div class="resize-handle horizontal"></div>
                <div class="resizable-panel output-section">
                    <div class="panel-header">
                        <span>输出</span>
                        <div class="panel-controls">
                            <button class="expand-btn" onclick="toggleFullscreen(this)">⤢</button>
                        </div>
                    </div>
                    <div id="timestampOutput" class="timestamp-output"></div>
                    <div id="timestampError" class="error-message"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .dev-tools {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        max-width: 1200px;
        margin: 0 auto;
        padding: 30px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    .container {
        display: flex;
        flex-direction: column;
        gap: 25px;
    }
    h1 {
        color: #333;
        text-align: center;
        margin-bottom: 20px;
        font-size: 2.2rem;
    }
    .tabs {
        display: flex;
        gap: 15px;
        margin-bottom: 25px;
        justify-content: center;
    }
    .tab-btn {
        padding: 12px 25px;
        background-color: #f0f0f0;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: all 0.3s ease;
        font-size: 1rem;
        font-weight: 500;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    }
    .tab-btn:hover {
        background-color: #e0e0e0;
        transform: translateY(-2px);
    }
    .tab-btn.active {
        background-color: #4CAF50;
        color: white;
        box-shadow: 0 4px 8px rgba(76, 175, 80, 0.3);
    }
    .tool-section {
        display: none;
        animation: fadeIn 0.5s;
    }
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
    .tool-section.active {
        display: block;
    }
    
    /* 可调整大小的面板样式 */
    .resizable-container {
        display: flex;
        flex-direction: column;
        height: 600px;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        background-color: white;
    }
    
    .resizable-panel {
        display: flex;
        flex-direction: column;
        flex: 1;
        min-height: 200px;
        position: relative;
        overflow: hidden;
        background-color: white;
    }
    
    .panel-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 15px;
        background-color: #f5f5f5;
        border-bottom: 1px solid #ddd;
        font-weight: 500;
    }
    
    .panel-controls {
        display: flex;
        gap: 5px;
    }
    
    .expand-btn {
        background: none;
        border: none;
        cursor: pointer;
        font-size: 16px;
        padding: 0 5px;
        color: #555;
        box-shadow: none;
        min-width: auto;
    }
    
    .expand-btn:hover {
        background: none;
        color: #333;
        transform: none;
        box-shadow: none;
    }
    
    .resize-handle {
        background-color: #e0e0e0;
        position: relative;
        transition: background-color 0.3s;
    }
    
    .resize-handle.horizontal {
        height: 6px;
        cursor: row-resize;
    }
    
    .resize-handle.vertical {
        width: 6px;
        cursor: col-resize;
    }
    
    .resize-handle:hover, .resize-handle.active {
        background-color: #4CAF50;
    }
    
    .resize-handle::after {
        content: "";
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
    }
    
    .resize-handle.horizontal::after {
        width: 30px;
        height: 2px;
        background-color: #bbb;
    }
    
    .resize-handle.vertical::after {
        width: 2px;
        height: 30px;
        background-color: #bbb;
    }
    
    .fullscreen {
        position: fixed !important;
        top: 0 !important;
        left: 0 !important;
        right: 0 !important;
        bottom: 0 !important;
        width: 100% !important;
        height: 100% !important;
        z-index: 9999 !important;
        border-radius: 0 !important;
    }
    
    /* 原有样式调整 */
    .input-section, .output-section {
        padding: 0;
        box-shadow: none;
        border-radius: 0;
        gap: 0;
        flex: 1;
        display: flex;
        flex-direction: column;
    }
    
    textarea {
        flex: 1;
        width: 100%;
        height: auto;
        padding: 15px;
        border: none;
        border-radius: 0;
        resize: none;
        font-family: 'Consolas', 'Courier New', monospace;
        font-size: 1rem;
        line-height: 1.5;
    }
    
    .timestamp-input {
        padding: 15px;
        display: flex;
        gap: 15px;
    }
    
    .buttons {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        padding: 15px;
        background-color: #f9f9f9;
        border-top: 1px solid #eee;
    }
    
    .json-output {
        flex: 1;
        background-color: #f9f9f9;
        padding: 15px;
        border-radius: 0;
        white-space: pre-wrap;
        font-family: 'Consolas', 'Courier New', monospace;
        overflow-y: auto;
        border: none;
        font-size: 1rem;
        line-height: 1.5;
        margin: 0;
    }
    
    .timestamp-output {
        flex: 1;
        padding: 15px;
        background-color: #f9f9f9;
        border-radius: 0;
        font-family: 'Consolas', 'Courier New', monospace;
        overflow-y: auto;
        border: none;
    }
    
    .error-message {
        margin: 0;
        padding: 10px 15px;
        border-radius: 0;
        border-left: none;
        background-color: #ffebee;
        color: #e53935;
    }
</style>

<script>
    // 标签页切换
    function switchTab(tool) {
        document.querySelectorAll('.tool-section').forEach(section => {
            section.classList.remove('active');
        });
        document.querySelectorAll('.tab-btn').forEach(btn => {
            btn.classList.remove('active');
        });
        document.getElementById(tool + '-tool').classList.add('active');
        document.querySelector(`.tab-btn[onclick="switchTab('${tool}')"]`).classList.add('active');
    }

    // JSON工具函数
    function formatJson() {
        try {
            const input = document.getElementById('inputJson').value;
            if (!input.trim()) {
                showError('jsonError', '请输入JSON数据');
                return;
            }
            const parsed = JSON.parse(input);
            const formatted = JSON.stringify(parsed, null, 2);
            const output = document.getElementById('outputJson');
            output.textContent = formatted;
            hljs.highlightElement(output);
            hideError('jsonError');
        } catch (e) {
            showError('jsonError', '无效的JSON格式: ' + e.message);
        }
    }

    function minifyJson() {
        try {
            const input = document.getElementById('inputJson').value;
            if (!input.trim()) {
                showError('jsonError', '请输入JSON数据');
                return;
            }
            const parsed = JSON.parse(input);
            const minified = JSON.stringify(parsed);
            const output = document.getElementById('outputJson');
            output.textContent = minified;
            hljs.highlightElement(output);
            hideError('jsonError');
        } catch (e) {
            showError('jsonError', '无效的JSON格式: ' + e.message);
        }
    }

    function validateJson() {
        try {
            const input = document.getElementById('inputJson').value;
            if (!input.trim()) {
                showError('jsonError', '请输入JSON数据');
                return;
            }
            JSON.parse(input);
            const output = document.getElementById('outputJson');
            output.textContent = 'JSON格式有效！';
            hideError('jsonError');
        } catch (e) {
            showError('jsonError', '无效的JSON格式: ' + e.message);
        }
    }

    function clearJson() {
        document.getElementById('inputJson').value = '';
        document.getElementById('outputJson').textContent = '';
        hideError('jsonError');
    }

    // 时间戳工具函数
    function convertTimestamp() {
        try {
            const input = document.getElementById('timestampInput').value;
            const unit = document.getElementById('timestampUnit').value;
            if (!input.trim()) {
                showError('timestampError', '请输入时间戳或日期');
                return;
            }

            let date;
            if (/^\d+$/.test(input)) {
                // 输入是时间戳
                const timestamp = unit === 'seconds' ? parseInt(input) * 1000 : parseInt(input);
                date = new Date(timestamp);
            } else {
                // 尝试多种日期格式
                const formats = [
                    input, // 原始输入
                    input.replace(/\//g, '-'), // 将斜杠替换为横杠
                    input.replace(/(\d{4})\/(\d{1,2})\/(\d{1,2})/, '$1-$2-$3'), // 处理 2025/4/23 格式
                    input.replace(/(\d{4})\/(\d{1,2})\/(\d{1,2})\s+(\d{1,2}):(\d{1,2}):(\d{1,2})/, '$1-$2-$3 $4:$5:$6') // 处理完整时间格式
                ];

                let validDate = null;
                for (const format of formats) {
                    date = new Date(format);
                    if (!isNaN(date.getTime())) {
                        validDate = date;
                        break;
                    }
                }

                if (!validDate) {
                    throw new Error('无法识别的日期格式');
                }
                date = validDate;
            }

            if (isNaN(date.getTime())) {
                throw new Error('无效的日期格式');
            }

            const output = document.getElementById('timestampOutput');
            output.innerHTML = `
                <div>本地时间: ${date.toLocaleString()}</div>
                <div>UTC时间: ${date.toUTCString()}</div>
                <div>时间戳(秒): ${Math.floor(date.getTime() / 1000)}</div>
                <div>时间戳(毫秒): ${date.getTime()}</div>
                <div>ISO格式: ${date.toISOString()}</div>
            `;
            hideError('timestampError');
        } catch (e) {
            showError('timestampError', '转换失败: ' + e.message);
        }
    }

    function getCurrentTimestamp() {
        const now = new Date();
        document.getElementById('timestampInput').value = Math.floor(now.getTime() / 1000);
        convertTimestamp();
    }

    function clearTimestamp() {
        document.getElementById('timestampInput').value = '';
        document.getElementById('timestampOutput').innerHTML = '';
        hideError('timestampError');
    }

    // 通用函数
    function copyToClipboard(elementId) {
        const element = document.getElementById(elementId);
        const text = element.textContent || element.innerText;
        navigator.clipboard.writeText(text).then(() => {
            alert('已复制到剪贴板！');
        }).catch(() => {
            // 兼容旧浏览器
            const textarea = document.createElement('textarea');
            textarea.value = text;
            document.body.appendChild(textarea);
            textarea.select();
            document.execCommand('copy');
            document.body.removeChild(textarea);
            alert('已复制到剪贴板！');
        });
    }

    function showError(elementId, message) {
        const errorDiv = document.getElementById(elementId);
        errorDiv.textContent = message;
        errorDiv.style.display = 'block';
    }

    function hideError(elementId) {
        document.getElementById(elementId).style.display = 'none';
    }
    
    // 拖拽调整大小功能
    document.addEventListener('DOMContentLoaded', function() {
        initResizableHandles();
    });
    
    function initResizableHandles() {
        const resizeHandles = document.querySelectorAll('.resize-handle');
        
        resizeHandles.forEach(handle => {
            handle.addEventListener('mousedown', function(e) {
                e.preventDefault();
                handle.classList.add('active');
                
                const isHorizontal = handle.classList.contains('horizontal');
                const container = handle.parentElement;
                const panels = Array.from(container.querySelectorAll('.resizable-panel'));
                const index = Array.from(container.children).indexOf(handle);
                const prevPanel = panels[Math.floor(index / 2)];
                const nextPanel = panels[Math.ceil(index / 2)];
                
                const startPos = isHorizontal ? e.clientY : e.clientX;
                const prevPanelSize = isHorizontal ? prevPanel.offsetHeight : prevPanel.offsetWidth;
                const nextPanelSize = isHorizontal ? nextPanel.offsetHeight : nextPanel.offsetWidth;
                
                function onMouseMove(e) {
                    const currentPos = isHorizontal ? e.clientY : e.clientX;
                    const diff = currentPos - startPos;
                    
                    if (isHorizontal) {
                        prevPanel.style.height = `${prevPanelSize + diff}px`;
                        nextPanel.style.height = `${nextPanelSize - diff}px`;
                    } else {
                        prevPanel.style.width = `${prevPanelSize + diff}px`;
                        nextPanel.style.width = `${nextPanelSize - diff}px`;
                    }
                }
                
                function onMouseUp() {
                    handle.classList.remove('active');
                    document.removeEventListener('mousemove', onMouseMove);
                    document.removeEventListener('mouseup', onMouseUp);
                }
                
                document.addEventListener('mousemove', onMouseMove);
                document.addEventListener('mouseup', onMouseUp);
            });
        });
    }
    
    // 全屏切换功能
    function toggleFullscreen(btn) {
        const panel = btn.closest('.resizable-panel');
        panel.classList.toggle('fullscreen');
        
        if (panel.classList.contains('fullscreen')) {
            btn.textContent = '⤓';
            document.body.style.overflow = 'hidden';
        } else {
            btn.textContent = '⤢';
            document.body.style.overflow = '';
        }
    }
</script>
// ... existing code ...


<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/highlight.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/styles/default.min.css">
{% endraw %}
