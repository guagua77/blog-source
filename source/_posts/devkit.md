---
title: 开发工具集
date: 2025-04-23
layout: page
tags:
  - 工具
---

{% raw %}
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
            <div class="input-section">
                <textarea id="inputJson" placeholder="请输入JSON数据..."></textarea>
                <div class="buttons">
                    <button onclick="formatJson()">格式化</button>
                    <button onclick="minifyJson()">压缩</button>
                    <button onclick="validateJson()">验证</button>
                    <button onclick="copyToClipboard('outputJson')">复制结果</button>
                    <button onclick="clearJson()">清空</button>
                </div>
            </div>
            <div class="output-section">
                <pre id="outputJson" class="json-output"></pre>
                <div id="jsonError" class="error-message"></div>
            </div>
        </div>

        <!-- 时间戳工具部分 -->
        <div id="timestamp-tool" class="tool-section">
            <div class="input-section">
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
            <div class="output-section">
                <div id="timestampOutput" class="timestamp-output"></div>
                <div id="timestampError" class="error-message"></div>
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
        display: flex;
        flex-direction: column;
        gap: 25px;
    }
    .input-section, .output-section {
        display: flex;
        flex-direction: column;
        gap: 15px;
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }
    textarea {
        width: 100%;
        height: 250px;
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        resize: vertical;
        font-family: 'Consolas', 'Courier New', monospace;
        font-size: 1rem;
        line-height: 1.5;
        transition: border-color 0.3s;
        box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.05);
    }
    textarea:focus {
        outline: none;
        border-color: #4CAF50;
        box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
    }
    .timestamp-input {
        display: flex;
        gap: 15px;
    }
    .timestamp-input input {
        flex: 1;
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 1rem;
        transition: border-color 0.3s;
    }
    .timestamp-input input:focus {
        outline: none;
        border-color: #4CAF50;
        box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
    }
    .timestamp-input select {
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        background-color: white;
        font-size: 1rem;
    }
    .buttons {
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        justify-content: center;
    }
    button {
        padding: 12px 22px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: all 0.3s ease;
        font-size: 1rem;
        font-weight: 500;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        min-width: 120px;
    }
    button:hover {
        background-color: #3d9440;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
    }
    button:active {
        transform: translateY(0);
    }
    .error-message {
        color: #e53935;
        margin-top: 10px;
        display: none;
        font-size: 0.95rem;
        background-color: #ffebee;
        padding: 10px;
        border-radius: 4px;
        border-left: 4px solid #e53935;
    }
    .json-output {
        background-color: #f5f5f5;
        padding: 20px;
        border-radius: 6px;
        white-space: pre-wrap;
        font-family: 'Consolas', 'Courier New', monospace;
        min-height: 250px;
        max-height: 500px;
        overflow-y: auto;
        border: 1px solid #eee;
        font-size: 1rem;
        line-height: 1.5;
    }
    .timestamp-output {
        background-color: #f5f5f5;
        padding: 20px;
        border-radius: 6px;
        font-family: 'Consolas', 'Courier New', monospace;
        border: 1px solid #eee;
        font-size: 1rem;
        line-height: 1.8;
    }
    .timestamp-output div {
        margin-bottom: 8px;
    }
    
    /* 响应式设计 */
    @media (max-width: 768px) {
        .dev-tools {
            padding: 15px;
        }
        .buttons {
            flex-direction: column;
        }
        button {
            width: 100%;
        }
        .timestamp-input {
            flex-direction: column;
        }
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
                // 输入是日期字符串
                date = new Date(input);
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
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/highlight.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/styles/default.min.css">
{% endraw %}
