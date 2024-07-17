cwlVersion: v1.2
class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: "david4096/llama-cli-cwl:v3"
inputs:
  cwl_file_url:
    type: string
    inputBinding:
      position: 1
  model_file:
    type: File
    default:
      class: File
      location: https://www.modelscope.cn/models/qwen/Qwen2-7B-Instruct-GGUF/resolve/master/qwen2-7b-instruct-q4_0.gguf
outputs:
  output:
    type: stdout
baseCommand: ["/bin/sh", "-c"]
arguments:
  - >
    /app/llama-cli -m $(inputs.model_file.path) -p "Summarize this CWL file $(inputs.cwl_file_url)" -n 128

