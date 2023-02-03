<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">新增设备</div>
    <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form" label-width="100px">
      <el-form-item label="名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入名称"></el-input>
      </el-form-item>
      <el-form-item label="描述" prop="description">
        <el-input style="width: 400px" type="textarea" v-model="form.description" placeholder="请输入描述"></el-input>
      </el-form-item>
      <el-form-item label="出厂日期" prop="publishDate">
        <el-date-picker
            v-model="form.publishDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择出厂日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="负责老师" prop="author">
        <el-input v-model="form.author" placeholder="请输入负责老师"></el-input>
      </el-form-item>
      <el-form-item label="厂商" prop="publisher">
        <el-input v-model="form.publisher" placeholder="请输入厂商"></el-input>
      </el-form-item>
      <el-form-item label="分类" prop="category">
        <el-cascader
            style="width: 220px"
            :props="{ value: 'name', label: 'name'}"
            v-model="form.categories"
            :options="categories"></el-cascader>
      </el-form-item>
      <el-form-item label="设备标准码" prop="bookNo">
        <el-input v-model="form.bookNo" placeholder="请输入设备标准码"></el-input>
      </el-form-item>
      <el-form-item label="可用数量" prop="cover">
        <el-input-number v-model="form.score" :min="1" :max="50" label="可用数量"></el-input-number>
      </el-form-item>
      <el-form-item label="数量" prop="nums">
        <el-input v-model="form.nums" placeholder="请输入数量"></el-input>
      </el-form-item>
      <br>
      <el-form-item label="设备图片" prop="cover">
<!--        <el-upload-->
<!--            class="avatar-uploader"-->
<!--            :action="'http://localhost:9090/book/file/upload'"-->
<!--            :show-file-list="false"-->
<!--            :on-success="handleCoverSuccess"-->
<!--        >-->
<!--          <img v-if="form.cover" :src="form.cover" class="avatar" alt="">-->
<!--          <i v-else class="el-icon-plus avatar-uploader-icon"></i>-->
<!--        </el-upload>-->
        <el-upload
            class="upload-demo"
            action="http://47.103.201.137:9090/file/upload"
            :on-success="handleCoverSuccess"
            list-type="picture">
          <el-button size="small" type="primary">点击上传</el-button>
        </el-upload>

      </el-form-item>
    </el-form>

    <div style="text-align: center; margin-top: 30px">
      <el-button type="primary" @click="save" size="medium">提交</el-button>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";
import Cookies from "js-cookie";
import {serverIp} from "../../public/config";
export default {
  name: 'AddBook',
  data() {
    const checkNums = (rule, value, callback) => {
      value = parseInt(value)
      if (value < 0 || value >= 1000) {
        callback(new Error('请输入大于等于0小于1000的整数'));
      }
      callback()
    };
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      form: {  score: 1, cover: '' },
      categories: [],
      rules: {
        name: [
          { required: true, message: '请输入图书名称', trigger: 'blur'}
        ],
        bookNo: [
          { required: true, message: '请输入图书标准码', trigger: 'blur'}
        ],
        score: [
          { validator: checkNums, trigger: 'blur' }
        ],
        nums: [
          { required: true, message: '请输入数量', trigger: 'blur'},
          { validator: checkNums, trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    request.get('/category/tree').then(res => {
      this.categories = res.data
    })
  },
  methods: {
    handleCoverSuccess(res) {
      this.form.cover = res
    },
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          request.post('/book/save', this.form).then(res => {
            if (res.code === '200') {
              this.$notify.success('新增成功')
              this.$refs['ruleForm'].resetFields()
            } else {
              this.$notify.error(res.msg)
            }
          })
        }
      })
    }
  }
}

</script>

<style >
.avatar-uploader . el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader . el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>
