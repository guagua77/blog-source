---
title: 开发工具集
date: 2025-04-23
layout: page
tags:
  - 工具
---

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
        font-family: Arial, sans-serif;
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }
    .container {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    .tabs {
        display: flex;
        gap: 10px;
        margin-bottom: 20px;
    }
    .tab-btn {
        padding: 10px 20px;
        background-color: #f0f0f0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .tab-btn.active {
        background-color: #4CAF50;
        color: white;
    }
    .tool-section {
        display: none;
    }
    .tool-section.active {
        display: block;
    }
    .input-section, .output-section {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }
    textarea {
        width: 100%;
        height: 200px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: vertical;
        font-family: monospace;
    }
    .timestamp-input {
        display: flex;
        gap: 10px;
    }
    .timestamp-input input {
        flex: 1;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .timestamp-input select {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .buttons {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }
    button {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    button:hover {
        background-color: #45a049;
    }
    .error-message {
        color: #ff0000;
        margin-top: 10px;
        display: none;
    }
    .json-output {
        background-color: #f5f5f5;
        padding: 15px;
        border-radius: 4px;
        white-space: pre-wrap;
        font-family: monospace;
        min-height: 200px;
    }
    .timestamp-output {
        background-color: #f5f5f5;
        padding: 15px;
        border-radius: 4px;
        font-family: monospace;
    }
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/highlight.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/styles/default.min.css">

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
