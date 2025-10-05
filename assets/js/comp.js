// 评估数据存储变量
let assessmentData = null;
let isLoading = false;
let progressSimulationInterval = null;

/**
 * 初始化应用程序，加载评估数据并显示进度
 * @returns {Promise<{success: boolean, message?: string}>} 初始化结果
 */
async function initializeApp() {
    if (isLoading) {
        return { success: false, message: '数据正在加载中，请稍候' };
    }
    
    isLoading = true;
    if (progressSimulationInterval) {
        clearInterval(progressSimulationInterval);
        progressSimulationInterval = null;
    }
    
    // 获取DOM元素
    const loadingIndicator = document.getElementById('loadingIndicator');
    const progressBar = document.getElementById('loadingProgressBar');
    const progressText = document.getElementById('loadingProgressText');
    const errorElement = document.getElementById('loadingError');
    
    // 确保加载指示器可见并重置状态
    if (loadingIndicator) {
        loadingIndicator.classList.remove('hidden', 'opacity-0', 'pointer-events-none');
        progressBar.style.width = '0%';
        progressText.textContent = '0%';
        errorElement.classList.add('hidden');
        errorElement.textContent = '';
    }

    try {
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'js/simhr_data.json');
        xhr.responseType = 'json';
        
        let hasValidProgress = false;
        let simulatedProgress = 0;
        
        // 监听进度事件
        xhr.addEventListener('progress', (e) => {
            if (e.lengthComputable && progressBar && progressText) {
                hasValidProgress = true;
                const percent = Math.round((e.loaded / e.total) * 100);
                const displayPercent = Math.min(percent, 95);
                progressBar.style.width = `${displayPercent}%`;
                progressText.textContent = `${displayPercent}%`;
                
                if (progressSimulationInterval) {
                    clearInterval(progressSimulationInterval);
                    progressSimulationInterval = null;
                }
            }
        });
        
        // 模拟进度机制
        setTimeout(() => {
            if (!hasValidProgress && !progressSimulationInterval) {
                progressSimulationInterval = setInterval(() => {
                    if (simulatedProgress < 90) {
                        simulatedProgress += Math.random() * 2;
                        simulatedProgress = Math.min(simulatedProgress, 90);
                        if (progressBar && progressText) {
                            progressBar.style.width = `${simulatedProgress}%`;
                            progressText.textContent = `${Math.round(simulatedProgress)}%`;
                        }
                    }
                }, 500);
            }
        }, 500);
        
        // 等待请求完成
        await new Promise((resolve, reject) => {
            xhr.onload = () => {
                if (xhr.status >= 200 && xhr.status < 300) {
                    resolve(xhr.response);
                } else {
                    reject(new Error(`加载失败: ${xhr.status} ${xhr.statusText}。请检查文件路径是否正确`));
                }
            };
            
            xhr.onerror = () => reject(new Error('网络错误，无法加载数据'));
            xhr.ontimeout = () => reject(new Error('请求超时，未能加载数据'));
            
            xhr.timeout = 10000;
            xhr.send();
        });
        
        const data = xhr.response;
        
        // 数据验证（适配HR评语字段）
        if (!data) throw new Error('数据文件为空');
        if (!data.assessments) throw new Error('数据文件缺少assessments字段');
        if (!Array.isArray(data.assessments)) throw new Error('assessments不是数组');
        if (data.assessments.length === 0) throw new Error('assessments数组为空');
        
        // 验证是否包含HR评语字段
        const invalidItems = data.assessments.filter(item => 
            !item || typeof item !== 'object' || !item['HR评语'] || typeof item['HR评语'] !== 'string'
        );
        
        if (invalidItems.length > 0) {
            console.warn(`过滤掉${invalidItems.length}个缺少HR评语的无效项`);
            assessmentData = data.assessments.filter(item => 
                item && typeof item === 'object' && item['HR评语'] && typeof item['HR评语'] === 'string'
            );
            
            if (assessmentData.length === 0) {
                throw new Error('所有评估项都缺少必要的HR评语字段');
            }
        } else {
            assessmentData = data.assessments;
        }
        
        // 更新进度为100%
        if (progressBar && progressText) {
            progressBar.style.width = '100%';
            progressText.textContent = '100%';
        }
        
        if (progressSimulationInterval) {
            clearInterval(progressSimulationInterval);
            progressSimulationInterval = null;
        }
        
        // 加载完成后隐藏指示器
        if (loadingIndicator) {
            setTimeout(() => {
                loadingIndicator.classList.add('opacity-0', 'pointer-events-none');
                setTimeout(() => {
                    loadingIndicator.classList.add('hidden');
                }, 300);
            }, 500);
        }
        
        console.log(`成功加载${assessmentData.length}条评估数据`);
        return { success: true };
    } catch (error) {
        console.error('数据加载失败:', error);
        
        if (progressSimulationInterval) {
            clearInterval(progressSimulationInterval);
            progressSimulationInterval = null;
        }
        
        if (errorElement) {
            errorElement.textContent = `加载失败: ${error.message}`;
            errorElement.classList.remove('hidden');
        }
        
        return { success: false, message: `初始化失败: ${error.message}` };
    } finally {
        isLoading = false;
    }
}

/**
 * 匹配HR评论与评估数据（适配HR评语字段）
 * @param {string} hrComment - HR评论文本
 * @returns {Promise<{success: boolean, message?: string, data?: Object}>} 匹配结果
 */
async function matchComment(hrComment) {
    if (!assessmentData || assessmentData.length === 0) {
        return { 
            success: false, 
            message: '数据集加载错误,请稍等直到加载完成',
            details: '请确保static_data.json文件存在且包含有效的assessments数据'
        };
    }
    
    // 计算字符级Jaccard相似度（不做任何预处理）
    const similarities = assessmentData.map(record => {
        const similarity = calculateJaccardSimilarity(hrComment, record['HR评语']);
        return { ...record, similarity };
    });
    
    // 按相似度排序
    similarities.sort((a, b) => b.similarity - a.similarity);
    
    // 获取前3条记录
    const topMatches = similarities.slice(0, 3);
    
    // 仅使用最高相似度记录的数据
    const mostSimilar = topMatches[0] || { similarity: 0 };
    
    const positions = ['COO', 'CFO', 'CMO', 'CTO'];
    const scores = {};
    const percentiles = {};

    positions.forEach(pos => {
        const scoreKey = `${pos}评分`;
        scores[pos] = mostSimilar[scoreKey] || 0;
        const allScores = assessmentData.map(record => record[scoreKey]);
        const count = allScores.filter(score => score <= (scores[pos] || 0)).length;
        percentiles[pos] = (count / allScores.length * 100).toFixed(2);
    });

    return {
        success: true,
        data: {
            scores,
            percentiles,
            similar_comment: mostSimilar['HR评语'],
            similarity: mostSimilar.similarity,
            topSamples: topMatches.map(match => ({
                comment: match['HR评语'],
                similarity: match.similarity,
                scores: {
                    COO: match['COO评分'],
                    CFO: match['CFO评分'],
                    CMO: match['CMO评分'],
                    CTO: match['CTO评分']
                },
                avgSkills: match['Avg. Skills'],
                samples: match['Samples']
            }))
        }
    };
}

// 字符级Jaccard相似度计算（不做任何预处理）
function calculateJaccardSimilarity(text1, text2) {
    if (!text1 || !text2) return 0;
    
    // 创建字符集合
    const set1 = new Set(text1);
    const set2 = new Set(text2);
    
    // 计算交集
    const intersection = new Set(
        [...set1].filter(char => set2.has(char))
    );
    
    // 计算并集
    const union = new Set([...set1, ...set2]);
    
    return union.size > 0 ? intersection.size / union.size : 0;
}

/**
 * 文本清洗函数
 * @param {string} text - 待清洗文本
 * @returns {string} 清洗后的文本
 */
function cleanText(text) {
    // 1. 转换为小写
    let cleaned = text.toLowerCase();
    
    // 2. 移除标点符号
    cleaned = cleaned.replace(/[^\w\s]/g, '');
    
    // 3. 移除多余空格
    cleaned = cleaned.replace(/\s+/g, ' ').trim();
    
    // 4. 移除停用词（可选，但可以提高匹配准确性）
    const stopWords = ['的', '了', '在', '是', '我', '有', '和', '就', '都', '他', '她', '它', '我们', '你们', '他们'];
    stopWords.forEach(word => {
        cleaned = cleaned.replace(new RegExp('\\b' + word + '\\b', 'g'), '');
    });
    
    return cleaned;
}

// 暴露公共接口
window.talentApp = {
    initialize: initializeApp,
    matchComment: matchComment,
    isDataLoaded: () => !!assessmentData,
    getLoadedDataCount: () => assessmentData ? assessmentData.length : 0,
    // 调试方法：可在控制台测试相似度计算
    debugSimilarity: (text1, text2) => {
        const cleaned1 = cleanText(text1);
        const cleaned2 = cleanText(text2);
        return calculateJaccardSimilarity(cleaned1, cleaned2);
    }
};

// 页面加载完成后自动初始化
document.addEventListener('DOMContentLoaded', () => {
    // 启动初始化
    initializeApp();
});