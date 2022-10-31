Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BACC38A02
	for <ath10k@archiver.kernel.org>; Mon, 31 Oct 2022 06:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYU7IIp/K8iTjtVOla9QLtg8py1bDodJ9iDszOr9aSo=; b=jzdTIVaVyNR7LE
	RuZS4u3qglDlu7YqOcEdqbhh++68k4ii58Pz4U31fMoeXMOLsmiOvpzxywzY0z81emavuz4YkcYNQ
	vTm4qTB+FmK0nsqgA77o3uEjvHJzLDYtEIdu1Fp8BLIj2F+2uzElOOhxJ8yE6ysA83ZCwuGCmnhF4
	4lTLNRnMgddUFTlzyQsAXEua52ek2dWndyUqemQ/JVc24/Z3ilabc0YPwgKMBqV2SUIVncQifFTHl
	bP4Riv8V87WcYNjRe99uCILr1YOCjN67Y7+BrjWFVdCNlHY5Q0gmLjK/zMIL7KF4zab3jRPTNNQ5+
	cK1G1oZh5TvUhDGD145g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opOhG-008rev-AW; Mon, 31 Oct 2022 06:54:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opOhC-008rLZ-HK
	for ath10k@lists.infradead.org; Mon, 31 Oct 2022 06:54:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29V6e8fK029267;
	Mon, 31 Oct 2022 06:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=V9vtBF0wqsWdYUGh4OC9OmgGuNK/g5I8xYtriPKT8D8=;
 b=o0IpVOeOlWrTb9eNIFcJlWO9NEUluTmwhHffxy3KTtfabP2PcdtWzyrlbn+8zL8NnL1B
 7XngQNESV2s72h8uezdZnz4Z0x5NyKudAzDKq89JsssZlch6pjNb5nWPLuMVY1OYKF9C
 +bc7p/z9rIL4U1gGYBjsJbhI2PUFa+jW7OrqKn9dktzq+IoErb/+nfwf6hlbeH7+UUKG
 N7kUPwkb84wQOcNisLIkHObOfhD6VWb0Zg4AHaF+GWQL6aq5cf0j3KMAwlRplO/MKpcN
 aG7XYtAxps+RixD4rYSpj7aBos6z2FHAAyjxvj4GWuUhK71WH8WuWFznoVdVzfMcK0+V CQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kj7mq0829-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Oct 2022 06:54:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29V6smwT009541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Oct 2022 06:54:48 GMT
Received: from [10.216.27.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 30 Oct
 2022 23:54:46 -0700
Message-ID: <fd45187c-739c-cd5d-4d4b-ae6abad03a94@quicinc.com>
Date: Mon, 31 Oct 2022 12:24:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH] wifi: ath10k: Add WLAN firmware image version info into
 smem
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20221026102257.19919-1-quic_youghand@quicinc.com>
 <b55ef95f-f400-9ef6-a427-525ae529d673@quicinc.com>
Content-Language: en-US
From: "Youghandhar Chintala (Temp)" <quic_youghand@quicinc.com>
In-Reply-To: <b55ef95f-f400-9ef6-a427-525ae529d673@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KYnC1KpULCVRYyADCl-59_to4NKo7Ux8
X-Proofpoint-GUID: KYnC1KpULCVRYyADCl-59_to4NKo7Ux8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_04,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_235454_604037_B6F17AA1 
X-CRM114-Status: GOOD (  20.93  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Ck9uIDEwLzI4LzIwMjIgMTI6MTkgQU0sIEplZmYgSm9obnNvbiB3cm90ZToKPiBPbiAxMC8yNi8y
MDIyIDM6MjIgQU0sIFlvdWdoYW5kaGFyIENoaW50YWxhIHdyb3RlOgo+PiBJbiBhIFNvQyBiYXNl
ZCBzb2x1dGlvbiwgaXQgd291bGQgYmUgdXNlZnVsIHRvIGtub3cgdGhlIHZlcnNpb25zIG9mIHRo
ZQo+PiB2YXJpb3VzIGJpbmFyeSBmaXJtd2FyZSBibG9icyB0aGUgc3lzdGVtIGlzIHJ1bm5pbmcg
b24uIE9uIGEgUUNPTSBiYXNlZAo+PiBTb0MsIHRoaXMgaW5mbyBjYW4gYmUgb2J0YWluZWQgZnJv
bSBzb2NpbmZvIGRlYnVnZnMgaW5mcmFzdHJ1Y3R1cmUuIEZvcgo+PiB0aGlzIHRvIHdvcmssIHJl
c3BlY3RpdmUgc3Vic3lzdGVtIGRyaXZlcnMgaGF2ZSB0byBleHBvcnQgdGhlIGZpcm13YXJlCj4+
IHZlcnNpb24gaW5mb3JtYXRpb24gdG8gYW4gU01FTSBiYXNlZCB2ZXJzaW9uIGluZm9ybWF0aW9u
IHRhYmxlLgo+Pgo+PiBIYXZpbmcgZmlybXdhcmUgdmVyc2lvbiBpbmZvcm1hdGlvbiBhdCBvbmUg
cGxhY2Ugd2lsbCBoZWxwIHF1aWNrbHkKPj4gZmlndXJlIG91dCB0aGUgZmlybXdhcmUgdmVyc2lv
bnMgb2YgdmFyaW91cyBzdWJzeXN0ZW1zIG9uIHRoZSBkZXZpY2UKPj4gaW5zdGVhZCBvZiBnb2lu
ZyB0aHJvdWdoIGJ1aWxkcy9sb2dzIGluIGFuIGV2ZW50IG9mIGEgc3lzdGVtIGNyYXNoLgo+Pgo+
PiBGaWxsIFdMQU4gZmlybXdhcmUgdmVyc2lvbiBpbmZvcm1hdGlvbiBpbiBTTUVNIHZlcnNpb24g
dGFibGUgdG8gYmUKPj4gcHJpbnRlZCBhcyBwYXJ0IG9mIHNvY2luZm8gZGVidWdmcyBpbmZyYXN0
cnVjdHVyZSBvbiBhIFF1YWxjb21tIGJhc2VkCj4+IFNvQy4KPj4KPj4gVGhpcyBjaGFuZ2UgaXMg
YXBwbGljYWJsZSBvbmx5IGZvciBXQ04zOTlYIHRhcmdldHMuCj4+Cj4+IFRlc3RlZC1vbjogV0NO
Mzk5MCBodzEuMCBTTk9DIFdMQU4uSEwuMy4yLjIuYzEwLTAwNzU0LVFDQUhMU1dNVFBMLTEKPj4K
Pj4gU2lnbmVkLW9mZi1ieTogWW91Z2hhbmRoYXIgQ2hpbnRhbGEgPHF1aWNfeW91Z2hhbmRAcXVp
Y2luYy5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3Ft
aS5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAyOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTBrL3FtaS5jIAo+PiBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsv
cW1pLmMKPj4gaW5kZXggNjZjYjdhMWU2MjhhLi5lODhiY2ZkOTY4NTkgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcW1pLmMKPj4gKysrIGIvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEway9xbWkuYwo+PiBAQCAtMTQsNiArMTQsNyBAQAo+PiDCoCAj
aW5jbHVkZSA8bGludXgvbmV0Lmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L3Fjb21fc2NtLmg+Cj4+ICsjaW5jbHVkZSA8bGlu
dXgvc29jL3Fjb20vc21lbS5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgvc3RyaW5nLmg+Cj4+IMKg
ICNpbmNsdWRlIDxuZXQvc29jay5oPgo+PiDCoCBAQCAtMjIsNiArMjMsOCBAQAo+PiDCoCDCoCAj
ZGVmaW5lIEFUSDEwS19RTUlfQ0xJRU5UX0lEwqDCoMKgwqDCoMKgwqAgMHg0YjRlNDU0Ywo+PiDC
oCAjZGVmaW5lIEFUSDEwS19RTUlfVElNRU9VVMKgwqDCoMKgwqDCoMKgIDMwCj4+ICsjZGVmaW5l
IEFUSDEwS19TTUVNX0lNQUdFX1ZFUlNJT05fVEFCTEXCoMKgwqDCoMKgwqAgNDY5Cj4+ICsjZGVm
aW5lIEFUSDEwS19TTUVNX0lNQUdFX1RBQkxFX0NOU1NfSU5ERVjCoMKgwqDCoCAxMwo+PiDCoCDC
oCBzdGF0aWMgaW50IGF0aDEwa19xbWlfbWFwX21zYV9wZXJtaXNzaW9uKHN0cnVjdCBhdGgxMGtf
cW1pICpxbWksCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBhdGgxMGtfbXNhX21lbV9pbmZvICptZW1faW5mbykKPj4gQEAgLTUzNiw2ICs1Mzks
MjkgQEAgaW50IGF0aDEwa19xbWlfd2xhbl9kaXNhYmxlKHN0cnVjdCBhdGgxMGsgKmFyKQo+PiDC
oMKgwqDCoMKgIHJldHVybiBhdGgxMGtfcW1pX21vZGVfc2VuZF9zeW5jX21zZyhhciwgUU1JX1dM
RldfT0ZGX1YwMSk7Cj4+IMKgIH0KPj4gwqAgK3N0YXRpYyB2b2lkIGF0aDEwa19xbWlfYWRkX3ds
YW5fdmVyX3NtZW0oc3RydWN0IGF0aDEwayAqYXIsIGNoYXIgCj4+ICpmd19idWlsZF9pZCkKPgo+
IGNvbnN0IGNoYXIgKmZ3X2J1aWxkX2lkPwo+Cj4+ICt7Cj4+ICvCoMKgwqAgdTggKnNtZW1fdGFi
bGVfcHRyOwo+PiArwqDCoMKgIHNpemVfdCBzbWVtX2Jsb2NrX3NpemU7Cj4+ICvCoMKgwqAgY29u
c3QgdTMyIHZlcnNpb25fc3RyaW5nX3NpemUgPSAxMjg7Cj4KPiBzaG91bGQgeW91IHMvMTI4L01B
WF9CVUlMRF9JRF9MRU4vIHNpbmNlIHRoYXQgaXMgd2hhdCBpcyB1c2VkIHRvIHNpemUgCj4gcW1p
LT5md19idWlsZF9pZD8KPgo+IG9yIGFsdGVybmF0ZWx5IGhhdmUgdGhlIGNhbGxlciBwYXNzIGZ3
X2J1aWxkX2lkIGxlbmd0aCBhcyBhIHNlcGFyYXRlIAo+IHBhcmFtPwo+IMKgIFN1cmUgSmVmZi4g
V2lsbCBhZGRyZXNzIGl0IGluIG5leHQgdmVyc2lvbiBvZiBwYXRjaC4KPgo+PiArwqDCoMKgIGNv
bnN0IHUzMiBzbWVtX2ltZ19pZHhfd2xhbiA9IEFUSDEwS19TTUVNX0lNQUdFX1RBQkxFX0NOU1Nf
SU5ERVggCj4+ICogMTI4Owo+PiArCj4+ICvCoMKgwqAgc21lbV90YWJsZV9wdHIgPSBxY29tX3Nt
ZW1fZ2V0KFFDT01fU01FTV9IT1NUX0FOWSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEFUSDEwS19TTUVNX0lNQUdFX1ZFUlNJT05fVEFCTEUsCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmc21lbV9ibG9ja19z
aXplKTsKPj4gK8KgwqDCoCBpZiAoSVNfRVJSKHNtZW1fdGFibGVfcHRyKSkgewo+PiArwqDCoMKg
wqDCoMKgwqAgYXRoMTBrX2RiZyhhciwgQVRIMTBLX0RCR19RTUksICJzbWVtIGltYWdlIHZlcnNp
b24gdGFibGUgbm90IAo+PiBmb3VuZCIpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiAr
wqDCoMKgIH0KPj4gK8KgwqDCoCBpZiAoc21lbV9pbWdfaWR4X3dsYW4gKyB2ZXJzaW9uX3N0cmlu
Z19zaXplID4gc21lbV9ibG9ja19zaXplKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBhdGgxMGtfZGJn
KGFyLCBBVEgxMEtfREJHX1FNSSwgInNtZW0gYmxvY2sgc2l6ZSB0b28gc21hbGw6ICVpIiwKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc21lbV9ibG9ja19zaXplKTsKPj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybjsKPj4gK8KgwqDCoCB9Cj4+ICvCoMKgwqAgbWVtY3B5KHNtZW1fdGFi
bGVfcHRyICsgc21lbV9pbWdfaWR4X3dsYW4sIGZ3X2J1aWxkX2lkLAo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdmVyc2lvbl9zdHJpbmdfc2l6ZSk7Cj4+ICt9Cj4+ICsKPj4gwqAgc3RhdGljIGlu
dCBhdGgxMGtfcW1pX2NhcF9zZW5kX3N5bmNfbXNnKHN0cnVjdCBhdGgxMGtfcW1pICpxbWkpCj4+
IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qgd2xmd19jYXBfcmVzcF9tc2dfdjAxICpyZXNwOwo+
PiBAQCAtNjA2LDYgKzYzMiw4IEBAIHN0YXRpYyBpbnQgYXRoMTBrX3FtaV9jYXBfc2VuZF9zeW5j
X21zZyhzdHJ1Y3QgCj4+IGF0aDEwa19xbWkgKnFtaSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBxbWktPmZ3X3ZlcnNpb24sIHFtaS0+ZndfYnVpbGRfdGltZXN0YW1wLCAK
Pj4gcW1pLT5md19idWlsZF9pZCk7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoCArwqDCoMKgIGF0aDEw
a19xbWlfYWRkX3dsYW5fdmVyX3NtZW0oYXIsIHFtaS0+ZndfYnVpbGRfaWQpOwo+PiArCj4+IMKg
wqDCoMKgwqAga2ZyZWUocmVzcCk7Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxp
c3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
