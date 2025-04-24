---
title: 未来科技博物馆
layout: page
tags:
  - html
---


# 🏛️ 未来科技博物馆

## 🌟 欢迎来到 2150 年

<div class="museum-header">
    <div class="hologram">
        <div class="hologram-content">
            <h2>全息投影导览</h2>
            <div class="hologram-animation"></div>
        </div>
    </div>
</div>

<style>
.museum-header {
    position: relative;
    height: 300px;
    background: linear-gradient(135deg, #1a1a2e, #16213e);
    border-radius: 20px;
    overflow: hidden;
    margin: 20px 0;
}

.hologram {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 200px;
    height: 200px;
}

.hologram-content {
    position: relative;
    width: 100%;
    height: 100%;
    color: #00ff88;
    text-align: center;
}

.hologram-animation {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100px;
    height: 100px;
    border: 2px solid #00ff88;
    animation: rotate 4s linear infinite;
}

@keyframes rotate {
    0% { transform: translate(-50%, -50%) rotate(0deg); }
    100% { transform: translate(-50%, -50%) rotate(360deg); }
}
</style>

## 🎮 交互式展区

### 1. 量子计算机模拟器

<div class="quantum-simulator">
    <div class="qubit-container">
        <div class="qubit" id="qubit1"></div>
        <div class="qubit" id="qubit2"></div>
        <div class="qubit" id="qubit3"></div>
    </div>
    <div class="controls">
        <button onclick="rotateQubit(1)">旋转量子比特 1</button>
        <button onclick="rotateQubit(2)">旋转量子比特 2</button>
        <button onclick="rotateQubit(3)">旋转量子比特 3</button>
    </div>
    <div class="result" id="quantumResult">量子态: |0⟩</div>
</div>

<style>
.quantum-simulator {
    background: #0a192f;
    padding: 20px;
    border-radius: 15px;
    margin: 20px 0;
}

.qubit-container {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin: 20px 0;
}

.qubit {
    width: 50px;
    height: 50px;
    background: #00ff88;
    border-radius: 50%;
    transition: transform 0.5s;
}

.controls {
    display: flex;
    justify-content: center;
    gap: 10px;
}

.controls button {
    background: #1a1a2e;
    color: #00ff88;
    border: 1px solid #00ff88;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s;
}

.controls button:hover {
    background: #00ff88;
    color: #1a1a2e;
}

.result {
    text-align: center;
    color: #00ff88;
    margin-top: 20px;
    font-family: monospace;
}
</style>

<script>
function rotateQubit(id) {
    const qubit = document.getElementById(`qubit${id}`);
    const currentRotation = qubit.style.transform ? 
        parseInt(qubit.style.transform.replace('rotate(', '').replace('deg)', '')) : 0;
    const newRotation = (currentRotation + 90) % 360;
    qubit.style.transform = `rotate(${newRotation}deg)`;
    
    // 更新量子态显示
    const states = ['|0⟩', '|1⟩', '|+⟩', '|-⟩'];
    const result = document.getElementById('quantumResult');
    result.textContent = `量子态: ${states[newRotation / 90]}`;
}
</script>

### 2. 全息投影展示

<div class="hologram-display">
    <canvas id="hologramCanvas"></canvas>
    <div class="hologram-controls">
        <input type="range" min="0" max="360" value="0" id="rotationControl">
        <button onclick="toggleAnimation()">切换动画</button>
    </div>
</div>

<style>
.hologram-display {
    background: #000;
    padding: 20px;
    border-radius: 15px;
    margin: 20px 0;
}

#hologramCanvas {
    width: 100%;
    height: 300px;
    background: #000;
}

.hologram-controls {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-top: 20px;
}

.hologram-controls input[type="range"] {
    width: 200px;
}
</style>

<script>
const canvas = document.getElementById('hologramCanvas');
const ctx = canvas.getContext('2d');
let isAnimating = false;
let rotation = 0;

function drawHologram() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.save();
    ctx.translate(canvas.width/2, canvas.height/2);
    ctx.rotate(rotation * Math.PI / 180);
    
    // 绘制全息图案
    ctx.strokeStyle = '#00ff88';
    ctx.lineWidth = 2;
    
    for(let i = 0; i < 8; i++) {
        ctx.beginPath();
        ctx.arc(0, 0, 50 + i * 20, 0, Math.PI * 2);
        ctx.stroke();
    }
    
    ctx.restore();
}

function animate() {
    if(isAnimating) {
        rotation += 1;
        drawHologram();
        requestAnimationFrame(animate);
    }
}

function toggleAnimation() {
    isAnimating = !isAnimating;
    if(isAnimating) {
        animate();
    }
}

// 初始化
canvas.width = canvas.offsetWidth;
canvas.height = canvas.offsetHeight;
drawHologram();

// 旋转控制
document.getElementById('rotationControl').addEventListener('input', (e) => {
    rotation = parseInt(e.target.value);
    drawHologram();
});
</script>

### 3. 时空隧道

<div class="time-tunnel">
    <div class="tunnel-container">
        <div class="tunnel-ring"></div>
        <div class="tunnel-ring"></div>
        <div class="tunnel-ring"></div>
    </div>
    <div class="tunnel-controls">
        <button onclick="activateTunnel()">激活时空隧道</button>
    </div>
</div>

<style>
.time-tunnel {
    background: #000;
    padding: 20px;
    border-radius: 15px;
    margin: 20px 0;
    overflow: hidden;
}

.tunnel-container {
    position: relative;
    height: 300px;
    perspective: 1000px;
}

.tunnel-ring {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100px;
    height: 100px;
    border: 2px solid #00ff88;
    border-radius: 50%;
    animation: tunnel 2s linear infinite;
}

.tunnel-ring:nth-child(2) {
    animation-delay: 0.5s;
}

.tunnel-ring:nth-child(3) {
    animation-delay: 1s;
}

@keyframes tunnel {
    0% {
        transform: translate(-50%, -50%) scale(1) rotate(0deg);
        opacity: 1;
    }
    100% {
        transform: translate(-50%, -50%) scale(3) rotate(360deg);
        opacity: 0;
    }
}

.tunnel-controls {
    text-align: center;
    margin-top: 20px;
}

.tunnel-controls button {
    background: #00ff88;
    color: #000;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s;
}

.tunnel-controls button:hover {
    background: #00cc6a;
}
</style>

<script>
function activateTunnel() {
    const container = document.querySelector('.tunnel-container');
    container.style.animation = 'none';
    container.offsetHeight; // 触发重绘
    container.style.animation = 'tunnelActivate 2s ease-in-out';
}

// 添加新的动画
const style = document.createElement('style');
style.textContent = `
@keyframes tunnelActivate {
    0% { transform: scale(1); }
    50% { transform: scale(1.2); }
    100% { transform: scale(1); }
}
`;
document.head.appendChild(style);
</script>

## �� 参观数据统计

<div class="stats-container">
    <div class="stat-item">
        <div class="stat-value" id="visitorCount">0</div>
        <div class="stat-label">今日访客</div>
    </div>
    <div class="stat-item">
        <div class="stat-value" id="interactionCount">0</div>
        <div class="stat-label">交互次数</div>
    </div>
    <div class="stat-item">
        <div class="stat-value" id="energyLevel">100%</div>
        <div class="stat-label">能量水平</div>
    </div>
</div>

<style>
.stats-container {
    display: flex;
    justify-content: space-around;
    margin: 20px 0;
    padding: 20px;
    background: #1a1a2e;
    border-radius: 15px;
}

.stat-item {
    text-align: center;
    color: #00ff88;
}

.stat-value {
    font-size: 2em;
    font-weight: bold;
}

.stat-label {
    margin-top: 5px;
    font-size: 0.9em;
    opacity: 0.8;
}
</style>

<script>
// 模拟数据更新
setInterval(() => {
    document.getElementById('visitorCount').textContent = 
        Math.floor(Math.random() * 1000);
    document.getElementById('interactionCount').textContent = 
        Math.floor(Math.random() * 5000);
    document.getElementById('energyLevel').textContent = 
        `${Math.floor(Math.random() * 100)}%`;
}, 2000);
</script>

