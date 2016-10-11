# #!/bin/sh
# LANG=en_US.UTF-8
# export LANG
# cd /Users/KingCQ/OpenSource/OSCHINA/
# fab upload_to_fir
# # say Hello

#! bin/bash
#Author:Bruce http://www.heyuan110.com
#Update Date:2015.06.23
#Use:命令行进入目录直接执行sh Build+DeployToFir.sh即可完成打包发布到fir.im

export LC_ALL=zh_CN.GB2312;
export LANG=zh_CN.GB2312
###############设置需编译的项目配置名称
buildConfig="Release" #编译的方式,有Release,Debug，自定义的AdHoc等

round="world"
echo "1234"
export name="消防"
echo $name
echo $round
echo $fir_api_token
echo $pgyer_user_key
echo $pgyer_api_key
#####开始上传，如果只需要打ipa包出来不需要上传，可以删除下面的代码
# export LANG=en_US
# export LC_ALL=en_US;
echo "正在上传到pyger..."
echo "ipa distribute:pgyer -u ${pgyer_user_key} -a ${pgyer_api_key}"
ipa distribute:pgyer -u $pgyer_user_key -a $pgyer_api_key
# ipa distribute:pgyer -u 77052141e0dd09784a065d3df33b792f -a 1d20194f501175be5ff08473b986295a
echo "\n打包上传更新成功！"
# say 打包上传更新成功 !
rm -rf $buildAppToDir
rm -rf $projectDir/tmp
