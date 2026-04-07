<template>
  <div class="recognition-view">
    <h2>食材识别</h2>
    <div class="recognition-container">
      <div class="camera-section">
        <div class="camera-placeholder">
          <p>📷 摄像头实时画面</p>
          <p class="placeholder-text">实时识别窗口</p>
        </div>
        <div class="control-buttons">
          <button class="btn-primary">启动识别</button>
          <button class="btn-secondary">拍照</button>
          <button class="btn-secondary">停止</button>
        </div>
      </div>

      <div class="result-section">
        <h3>识别结果</h3>
        <div class="result-list">
          <div class="result-item">
            <span class="result-name">苹果</span>
            <span class="result-confidence">置信度: 94%</span>
            <span class="result-category">蔬果类</span>
          </div>
          <div class="result-item">
            <span class="result-name">牛奶</span>
            <span class="result-confidence">置信度: 87%</span>
            <span class="result-category">饮料乳品类</span>
          </div>
        </div>
        <button class="btn-primary btn-block">确认并添加到库存</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Recognition'
}
</script>

<style scoped>
.recognition-view {
  max-width: 1200px;
  margin: 0 auto;
}

.recognition-view h2 {
  color: #2c3e50;
}

.recognition-container {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 2rem;
}

.camera-section {
  background: white;
  border-radius: 8px;
  padding: 1.5rem;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.camera-placeholder {
  background: #f0f0f0;
  border: 2px dashed #ccc;
  border-radius: 8px;
  padding: 3rem;
  text-align: center;
  margin-bottom: 1.5rem;
}

.camera-placeholder p {
  margin: 0.5rem 0;
  color: #666;
}

.placeholder-text {
  color: #999;
  font-size: 0.9rem;
}

.control-buttons {
  display: flex;
  gap: 1rem;
}

.btn-primary,
.btn-secondary {
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
  flex: 1;
}

.btn-primary {
  background-color: #42b983;
  color: white;
}

.btn-primary:hover {
  background-color: #369970;
}

.btn-secondary {
  background-color: #e8e8e8;
  color: #333;
}

.btn-secondary:hover {
  background-color: #d0d0d0;
}

.result-section {
  background: white;
  border-radius: 8px;
  padding: 1.5rem;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.result-section h3 {
  margin-top: 0;
  color: #2c3e50;
}

.result-list {
  margin-bottom: 1.5rem;
}

.result-item {
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
  padding: 1rem;
  background: #f8f9fa;
  border-radius: 4px;
  margin-bottom: 0.75rem;
  border-left: 4px solid #42b983;
}

.result-name {
  font-weight: bold;
  color: #2c3e50;
}

.result-confidence {
  color: #666;
  font-size: 0.9rem;
}

.result-category {
  display: inline-block;
  background-color: #e8f5e9;
  color: #2e7d32;
  padding: 0.25rem 0.5rem;
  border-radius: 3px;
  font-size: 0.85rem;
  width: fit-content;
  margin-top: 0.25rem;
}

.btn-block {
  width: 100%;
}

@media (max-width: 768px) {
  .recognition-container {
    grid-template-columns: 1fr;
  }
}
</style>
