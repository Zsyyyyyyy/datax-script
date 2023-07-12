import re



s = '{"_id":{"$oid":"6261666c75672200013d3a42"},"oldFeedId":"1","user":{"userId":"1472489022105518080","userName":"Colin","avatar":"http://image.henhenchina.com/userIcon/20200826/398b8f1d-5884-4876-8bb9-19cb41d1c7e2.jpg","phone":"189392659","userType":"NOT_AUTH"},"source":"USER","title":"来喵喵互助的第一天15","content":"来喵喵互助的第一天！欧耶！","mediaType":"PIC","pics":[{"size":93662,"format":"jpeg2","width":1242,"height":698,"image":"http://image.henhenchina.com/trends20200825/36f7bd61-a120-422c-a4e7-7363e321709f.jpeg"},{"size":74539,"format":"jpeg","width":1523,"height":856,"image":"http://image.henhenchina.com/trends20200825/679e2f29-aa95-4ade-8ebc-823fa432b4d5.jpeg"}],"feedType":"DYNAMIC","topStatus":"UNTOP","sn":0,"feedStatus":"UP","auditStatus":"PASS","auditType":"MACHINE","geography":{"location":{"x":121.315769,"y":31.201327},"address":"泰虹路与申虹路交叉口1","provinceCode":"310000","provinceName":"上海市","cityCode":"310100","cityName":"上海市","areaCode":"310112","areaName":"闵行区","poiName":"鱼跃大楼"},"createTime":{"$date":1598344154000},"updateTime":{"$date":1666775199246},"delFlag":false,"showGeo":true,"_class":"com.meow.platform.model.entity.feed.Feed","collectCount":1,"commentCount":0,"fakeLikeCount":0,"fakeViewCount":0,"likeCount":9,"replyCount":0,"viewCount":25,"aiTagInfos":[{"tagId":{"$oid":"6268d4d8f7274000015736b1"},"tagName":"日常","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"},"tagScore":0.6376}],"aiTagTime":{"$date":1667199233725},"isSuccess":true,"updateUserId":222.0,"updateUserName":"test","isArtificial":true,"tags":[{"tagId":{"$oid":"627485abf727400001d7b7f1"},"tagName":"趣味1","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"}},{"tagId":{"$oid":"627485b0a6ca9c0001801295"},"tagName":"技能","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"}},{"tagId":{"$oid":"627485b8a6ca9c0001801296"},"tagName":"写真","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"}},{"tagId":{"$oid":"627485c6f727400001d7b800"},"tagName":"Vlog","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"}},{"tagId":{"$oid":"627485d1f727400001d7b805"},"tagName":"穿搭","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"}},{"tagId":{"$oid":"627485dca6ca9c00018012a6"},"tagName":"纪念","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"}},{"tagId":{"$oid":"62748654f727400001d7b814"},"tagName":"表情包","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"}},{"tagId":{"$oid":"62b3cdd85826e2000104f8d4"},"tagName":"互助","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"}},{"tagId":{"$oid":"62ce8b04e64dc3000130d790"},"tagName":"吃播","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"}},{"tagId":{"$oid":"62cfbae3e64dc30001323b13"},"tagName":"记录","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"}},{"tagId":{"$oid":"62cfbb03e64dc30001323b39"},"tagName":"流浪动物","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"}},{"tagId":{"$oid":"634f5a135b6cf600012193c3"},"tagName":"日常","categoryId":{"$oid":"6268d4b8a6ca9c000160fa6a"}}]}'
result = {}
# aa = re.match(r'\{\"\$oid\"\:\".*\"\}\,', s)
# (?<=\$oid":").*?(?=("\}|$))
aa = re.findall(r'(?:\{"\$oid":"([0-9a-z]+)"})', s)
bb = re.findall(r'(?:\{"\$oid":"[0-9a-z]+"})', s)
# print(aa)
# print(bb)
# print(len(aa))
# print(len(bb))



cc = re.sub(r'(?:\{"\$oid":"([0-9a-z]+)"})','\t',s)
# print(cc)
dds = cc.split('\t')
sss= ''
for i in range(len(dds)):
    if(i+2 < len(dds)):
        sss = sss+dds[i] + aa[i]
    else:
        sss = sss + dds[i]
    
    

print(sss)
