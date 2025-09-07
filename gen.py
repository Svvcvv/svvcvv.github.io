import os
import json
import argparse

def get_directory_structure(root_dir):
    """
    递归获取目录结构
    """
    structure = {
        'name': os.path.basename(root_dir),
        'type': 'directory',
        'children': []
    }
    
    try:
        # 获取目录中的所有条目
        entries = os.listdir(root_dir)
        
        for entry in entries:
            entry_path = os.path.join(root_dir, entry)
            
            # 检查是否为目录
            if os.path.isdir(entry_path):
                # 递归处理子目录
                structure['children'].append(get_directory_structure(entry_path))
            else:
                # 处理文件
                file_size = os.path.getsize(entry_path)
                structure['children'].append({
                    'name': entry,
                    'type': 'file',
                    'size': file_size  # 文件大小（字节）
                })
                
    except PermissionError:
        print(f"无法访问目录: {root_dir} (权限不足)")
    except Exception as e:
        print(f"处理目录 {root_dir} 时出错: {str(e)}")
        
    return structure

def main():
    # 设置命令行参数
    parser = argparse.ArgumentParser(description='将目录结构转换为JSON文件')
    parser.add_argument('--dir', type=str, default='.', help='要处理的目录路径，默认为当前目录')
    parser.add_argument('--output', type=str, default='directory_structure.json', help='输出的JSON文件名')
    
    args = parser.parse_args()
    
    # 获取目录结构
    print(f"正在处理目录: {os.path.abspath(args.dir)}")
    dir_structure = get_directory_structure(args.dir)
    
    # 保存为JSON文件
    with open(args.output, 'w', encoding='utf-8') as f:
        json.dump(dir_structure, f, ensure_ascii=False, indent=2)
        
    print(f"目录结构已保存到: {args.output}")

if __name__ == "__main__":
    main()
