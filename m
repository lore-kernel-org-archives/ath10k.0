Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76C0FA373D
	for <ath10k@archiver.kernel.org>; Tue,  1 Nov 2022 09:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QenWusouQzMCJ2P5HyQSg5cYrJxYtZGqMEKQk3/aPE=; b=gembsDn6EltJof
	5c8068K2ISQdz0s5W9AsjhBxDZlFa2EqoV9qGrWRIRTtnR8HkGVNizl/ZZx5/2xcMD/2P5TBro35I
	FoEwu9GNV02a3by+4+MNo/3X7SQbj4v2B8+wtN9eE1+5la9SKHTG13kS1YcLDqWDOqE8I1j742WYS
	jVtx7gJ72tt9kDsMcXh3t8cWPxKwXtkbuMZFxlmrD/4eT9rBaVLcD+ATn1GQiLMxUIlkzG8bWNMpO
	PggzDdsAUwxklUIY1Y7W2AYVyJy25ontVjnJGneVFJiQYkkO+Cz+OXmZdo7JX2MB/28ONTKuh9GNV
	EUqOwRf9wCi/pndhMZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opnGD-003Tid-0g; Tue, 01 Nov 2022 09:08:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opnG9-003Tft-Ra
	for ath10k@lists.infradead.org; Tue, 01 Nov 2022 09:08:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A18mEYp013330;
	Tue, 1 Nov 2022 09:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ilX9N7XuGwQznLnjFjp8fK0eTBudblM02vlzIqJN95A=;
 b=hMj+1R7cAjVKhn0NMhP1yCBZ5iOcRFDEauigzkzBKh86eSsyZcqCfxW1ENX68zX9ZVfw
 XGEqJqpIdUywy90B5jExcPlevZr6UgriedzswHtjDquEhoLURO1KQpJ1JI/ASVogByNg
 64+DgWD0Vu4xC1t2CTCplfEKfzl8OH9SDtP+BWQJnKl3vMET2bMlo3Kw8hA3l+hNOjSt
 D+wKzP76Kulj6Y82NM22IEYChbZHtGOlR299gystlzkHslq9lebcCjH3fCVly44JLbqy
 pLD8Yb/RLZ6IxBb6mK/La/+ZJrNqw1SqIRaN53P9iF9AjOwhJCNuEp97fpWStOlWk0qm 3g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kk093820p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Nov 2022 09:08:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A198RVZ029968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Nov 2022 09:08:27 GMT
Received: from [10.216.27.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 1 Nov 2022
 02:08:25 -0700
Message-ID: <722d3571-b399-dbf0-26da-04b73331df49@quicinc.com>
Date: Tue, 1 Nov 2022 14:38:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH] wifi: ath10k: Add WLAN firmware image version info into
 smem
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20221026102257.19919-1-quic_youghand@quicinc.com>
 <b55ef95f-f400-9ef6-a427-525ae529d673@quicinc.com>
 <fd45187c-739c-cd5d-4d4b-ae6abad03a94@quicinc.com>
 <877d0fgiaa.fsf@kernel.org>
From: "Youghandhar Chintala (Temp)" <quic_youghand@quicinc.com>
In-Reply-To: <877d0fgiaa.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zYRwwMhjNqmSmIewrws5MHNOaUx2h2wY
X-Proofpoint-ORIG-GUID: zYRwwMhjNqmSmIewrws5MHNOaUx2h2wY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_05,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_020837_917074_4555C9BD 
X-CRM114-Status: GOOD (  14.46  )
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

Ck9uIDExLzEvMjAyMiAyOjMxIFBNLCBLYWxsZSBWYWxvIHdyb3RlOgo+IChmaXhpbmcgcXVvdGF0
aW9uKQo+Cj4gIllvdWdoYW5kaGFyIENoaW50YWxhIChUZW1wKSIgPHF1aWNfeW91Z2hhbmRAcXVp
Y2luYy5jb20+IHdyaXRlczoKPgo+PiBPbiAxMC8yOC8yMDIyIDEyOjE5IEFNLCBKZWZmIEpvaG5z
b24gd3JvdGU6Cj4+Cj4+PiBPbiAxMC8yNi8yMDIyIDM6MjIgQU0sIFlvdWdoYW5kaGFyIENoaW50
YWxhIHdyb3RlOgo+Pj4+ICDCoCArc3RhdGljIHZvaWQgYXRoMTBrX3FtaV9hZGRfd2xhbl92ZXJf
c21lbShzdHJ1Y3QgYXRoMTBrICphciwgY2hhcgo+Pj4+ICpmd19idWlsZF9pZCkKPj4+IGNvbnN0
IGNoYXIgKmZ3X2J1aWxkX2lkPwo+Pj4KPj4+PiArewo+Pj4+ICvCoMKgwqAgdTggKnNtZW1fdGFi
bGVfcHRyOwo+Pj4+ICvCoMKgwqAgc2l6ZV90IHNtZW1fYmxvY2tfc2l6ZTsKPj4+PiArwqDCoMKg
IGNvbnN0IHUzMiB2ZXJzaW9uX3N0cmluZ19zaXplID0gMTI4Owo+Pj4gc2hvdWxkIHlvdSBzLzEy
OC9NQVhfQlVJTERfSURfTEVOLyBzaW5jZSB0aGF0IGlzIHdoYXQgaXMgdXNlZCB0bwo+Pj4gc2l6
ZSBxbWktPmZ3X2J1aWxkX2lkPwo+Pj4KPj4+IG9yIGFsdGVybmF0ZWx5IGhhdmUgdGhlIGNhbGxl
ciBwYXNzIGZ3X2J1aWxkX2lkIGxlbmd0aCBhcyBhIHNlcGFyYXRlCj4+PiBwYXJhbT8KPj4gU3Vy
ZSBKZWZmLiBXaWxsIGFkZHJlc3MgaXQgaW4gbmV4dCB2ZXJzaW9uIG9mIHBhdGNoLgo+IEJUVyBZ
b3VnaGFuZGhhciwgeW91ciBxdW90ZXMgd2VyZSBicm9rZW4gaW4gdGhpcyBtYWlsIHNvIHlvdXIg
cmVwbHkgd2FzCj4gZGlmZmljdWx0IHRvIGZpbmQuIFNlZSBoZXJlOgo+Cj4gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzIwMjIxMDI2MTAy
MjU3LjE5OTE5LTEtcXVpY195b3VnaGFuZEBxdWljaW5jLmNvbS8KPgo+IElmIHlvdSBhcmUgdXNp
bmcgT3V0bG9vaywgSSByZWNvbW1lbmQgc3dpdGNoaW5nIHRvIGFuIGFwcGxpY2F0aW9uIHdoaWNo
Cj4gcmVzcGVjdHMgc3RhbmRhcmRzIG1vcmUgOikgRm9yIGV4YW1wbGUsIHNvbWUgcGVvcGxlIHNl
ZW0gdG8gYmUgaGFwcHkKPiB3aXRoIFRodW5kZXJiaXJkLgoKClRoYW5rIHlvdSBzbyBtdWNoIGZv
ciB5b3VyIHN1Z2dlc3Rpb24uIEkgd2lsbCBhZGRyZXNzIGl0LgoKQ3VycmVudGx5IEkgYW0gdXNp
bmfCoCBUaHVuZGVyYmlyZC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
