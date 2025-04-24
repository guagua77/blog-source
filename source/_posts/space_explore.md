---
title: 太空探索之旅
layout: page
tags:
  - html
---


# 🚀 太空探索之旅

## 🌌 欢迎来到星际空间站

这是一个充满交互的太空探索指南！让我们开始这段奇妙的旅程。

### 🪐 行星信息卡片

<details>
<summary>点击查看火星信息</summary>
<div class="planet-info">
    <h3>火星 (Mars)</h3>
    <ul>
        <li>直径: 6,779 公里</li>
        <li>自转周期: 24.6 小时</li>
        <li>公转周期: 687 地球日</li>
    </ul>
</div>
</details>

### 🌠 太空天气实时显示

<div class="weather-widget">
    <div class="weather-info">
        <span class="temperature">-63°C</span>
        <span class="condition">晴朗</span>
    </div>
</div>

<style>
.planet-info {
    background: #1a1a2e;
    color: #fff;
    padding: 20px;
    border-radius: 10px;
    margin: 10px 0;
}

.weather-widget {
    background: linear-gradient(45deg, #000428, #004e92);
    color: white;
    padding: 20px;
    border-radius: 15px;
    text-align: center;
    margin: 20px 0;
}

.temperature {
    font-size: 2em;
    font-weight: bold;
}

.condition {
    display: block;
    margin-top: 10px;
}
</style>

### 🛸 太空飞船控制面板

<div class="control-panel">
    <button onclick="alert('引擎启动！')">启动引擎</button>
    <button onclick="alert('防护罩已激活！')">激活防护罩</button>
    <button onclick="alert('超光速引擎准备就绪！')">准备跃迁</button>
</div>

<style>
.control-panel {
    display: flex;
    gap: 10px;
    justify-content: center;
    margin: 20px 0;
}

.control-panel button {
    background: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: transform 0.2s;
}

.control-panel button:hover {
    transform: scale(1.1);
    background: #45a049;
}
</style>

### �� 星座连线游戏

<div class="constellation-game">
    <canvas id="starCanvas" width="400" height="300"></canvas>
</div>

<script>
const canvas = document.getElementById('starCanvas');
const ctx = canvas.getContext('2d');

// 绘制星星
function drawStars() {
    ctx.fillStyle = 'white';
    for(let i = 0; i < 20; i++) {
        const x = Math.random() * canvas.width;
        const y = Math.random() * canvas.height;
        ctx.beginPath();
        ctx.arc(x, y, 2, 0, Math.PI * 2);
        ctx.fill();
    }
}

drawStars();
</script>

<style>
.constellation-game {
    background: #000;
    padding: 20px;
    border-radius: 10px;
    margin: 20px 0;
    text-align: center;
}

#starCanvas {
    border: 1px solid #333;
    background: #000;
}
</style>

## 📡 太空通讯站

<marquee behavior="scroll" direction="left" scrollamount="5">
    🛰️ 最新消息：发现新的类地行星！距离地球 42 光年！
</marquee>
