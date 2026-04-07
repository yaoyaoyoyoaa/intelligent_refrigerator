"""
智能冰箱食材识别与管理系统 - FastAPI主应用
"""
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import uvicorn

# 创建FastAPI应用
app = FastAPI(
    title="智能冰箱食材识别系统",
    description="一个能够识别冰箱内食材并进行库存管理的系统",
    version="1.0.0"
)

# 配置CORS中间件
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 在生产环境中应该配置具体的域名
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    """根路由"""
    return {
        "message": "智能冰箱食材识别系统 API",
        "version": "1.0.0"
    }

@app.get("/api/health")
async def health_check():
    """健康检查端点"""
    return {"status": "ok"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
