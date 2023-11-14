Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1EAC4332F
	for <ath10k@archiver.kernel.org>; Tue, 14 Nov 2023 17:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0vjtIEa1QxzsY+9V5r4FlljcxWb1WMK76yb90VK9i0=; b=nvmAJCJ821UdWy
	w53crP8wGcgtSgsKjaS1ExvWD0v9cYUDu+Tzv1swzQ503CfkeGdLvhGTDTAQz8BfP4Xd/iP0Se6qQ
	q6dQBWb1+fFZgsmuhJ83KyKjgcGmPm0uYsTBsOptASK9w+dmHvz8dw+YUEQLkY8YekyDsHzDQ6gBa
	QR1ls0Tzg1jszXg6O3lsjPWV7V270kIjM7IKZ+uQyriN8LDqxeCJ9w6Y756SSxMcXA45U5AJLP/UB
	WSZJ62Hj9gqvC73GVa8lGjRWYwauhCusejwKD8pxs6nsTqypW4CsJRdxx2ylM8JJceUiB8se/GaTm
	aU3nCU9tzOucriy8jc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2xGq-00GVrP-2K;
	Tue, 14 Nov 2023 17:32:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2xGm-00GVqo-1b
	for ath10k@lists.infradead.org;
	Tue, 14 Nov 2023 17:32:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AEFXajA002169;
	Tue, 14 Nov 2023 17:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4IFXMhp5iGw8C58z5StYp12aOmOoam/kEzBPeX7wr8U=;
 b=GmUlKENNjzl76JFMkZB9GeN8mEbsJv7UOywky8DwKt7ladh1SfWxTBKfZdB4d1oxNOVD
 kAmyD5qyRI1fvWtLCDBVk1dmkj1OfHw4g1bK739YESENHau7JVZozRiZeM5u+bP4LVce
 J09N8y5Ct5unPE+MxGoZrDZFBFD1wH9Pvg0iaZwt3fEKoZR+tI8/hpmOcMOTDr724/Jj
 MKis7yrp7BvKa5odplsW6rp+3UusB2bLrT+xeCYOsGKUJb2NrDQ9+VylW34PVIchJr55
 hzYXQ73FiR2Z+t3AosrsCIciHAOWodDl2bCUDaj0xiiZ+o2YAJA4gJK/Z/s/eoKZl3oX 7w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucba6rc9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 17:32:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AEHW5sb019176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 17:32:05 GMT
Received: from [10.110.49.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 14 Nov
 2023 09:32:04 -0800
Message-ID: <b70d8041-901c-48f6-8790-35e354c30865@quicinc.com>
Date: Tue, 14 Nov 2023 09:32:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k_pci logs errors about missing pre-cal and cal firmware on
 a laptop
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        <ath10k@lists.infradead.org>
References: <7158e5e9-8bdc-4660-ac5d-5e3f81cf6158@molgen.mpg.de>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <7158e5e9-8bdc-4660-ac5d-5e3f81cf6158@molgen.mpg.de>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GMdICbtdDsdyIELinfoFrQw6o9ivISlJ
X-Proofpoint-ORIG-GUID: GMdICbtdDsdyIELinfoFrQw6o9ivISlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_17,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 clxscore=1011 bulkscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_093212_542841_CD5A321E 
X-CRM114-Status: GOOD (  15.41  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

T24gMTEvMTIvMjAyMyA0OjEzIEFNLCBQYXVsIE1lbnplbCB3cm90ZToKPiBEZWFyIExpbnV4IGZv
bGtzLAo+IAo+IAo+IE9ubiB0aGUgRGVsbCBYUFMgMTMgOTM2MCB3aXRoIERlYmlhbiBzaWQvdW5z
dGFibGUsIExpbnV4IDYuNS4xMCBsb2dzIHRoZSAKPiBlcnJvciBiZWxvdzoKPiAKPiAgICAgICQg
c3VkbyBkbWVzZyB8IGdyZXAgLWUgIkRNSToiIC1lICJMaW51eCB2ZXJzaW9uIiAtZSBtaWNyb2Nv
ZGUKPiAgICAgIFsgICAgMC4wMDAwMDBdIG1pY3JvY29kZTogdXBkYXRlZCBlYXJseTogMHhmMCAt
PiAweGY0LCBkYXRlID0gCj4gMjAyMy0wMi0yMgo+ICAgICAgWyAgICAwLjAwMDAwMF0gTGludXgg
dmVyc2lvbiA2LjUuMC00LWFtZDY0IAo+IChkZWJpYW4ta2VybmVsQGxpc3RzLmRlYmlhbi5vcmcp
IChnY2MtMTMgKERlYmlhbiAxMy4yLjAtNikgMTMuMi4wLCBHTlUgCj4gbGQgKEdOVSBCaW51dGls
cyBmb3IgRGViaWFuKSAyLjQxKSAjMSBTTVAgUFJFRU1QVF9EWU5BTUlDIERlYmlhbiAKPiA2LjUu
MTAtMSAoMjAyMy0xMS0wMykKPiAgICAgIFsgICAgMC4wMDAwMDBdIERNSTogRGVsbCBJbmMuIFhQ
UyAxMyA5MzYwLzA1OTZLRiwgQklPUyAyLjIxLjAgCj4gMDYvMDIvMjAyMgo+ICAgICAgWyAgICAw
LjU4MDY4OV0gbWljcm9jb2RlOiBNaWNyb2NvZGUgVXBkYXRlIERyaXZlcjogdjIuMi4KPiAKPiAg
ICAgICQgc3VkbyBkbWVzZyAtLWxldmVsIGFsZXJ0LGNyaXQsZXJyCj4gICAgICBbICAgIDAuMDUz
NTY2XSB4ODYvY3B1OiBTR1ggZGlzYWJsZWQgYnkgQklPUy4KPiAgICAgIFsgICAgMS45NDIxODNd
IHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6IFVuYWJsZSB0byBxdWVyeSBkZXZpY2U6IC01Cj4g
ICAgICBbICAgMTQuNDAxMTEyXSBhdGgxMGtfcGNpIDAwMDA6M2E6MDAuMDogZmlybXdhcmU6IGZh
aWxlZCB0byBsb2FkIAo+IGF0aDEway9wcmUtY2FsLXBjaS0wMDAwOjNhOjAwLjAuYmluICgtMikK
PiAgICAgIFsgICAxNC40MDExNDNdIGZpcm13YXJlX2NsYXNzOiBTZWUgaHR0cHM6Ly93aWtpLmRl
Ymlhbi5vcmcvRmlybXdhcmUgCj4gZm9yIGluZm9ybWF0aW9uIGFib3V0IG1pc3NpbmcgZmlybXdh
cmUKPiAgICAgIFsgICAxNC40MDExODVdIGF0aDEwa19wY2kgMDAwMDozYTowMC4wOiBmaXJtd2Fy
ZTogZmFpbGVkIHRvIGxvYWQgCj4gYXRoMTBrL3ByZS1jYWwtcGNpLTAwMDA6M2E6MDAuMC5iaW4g
KC0yKQo+ICAgICAgWyAgIDE0LjQwMTIzM10gYXRoMTBrX3BjaSAwMDAwOjNhOjAwLjA6IGZpcm13
YXJlOiBmYWlsZWQgdG8gbG9hZCAKPiBhdGgxMGsvY2FsLXBjaS0wMDAwOjNhOjAwLjAuYmluICgt
MikKPiAgICAgIFsgICAxNC40MDEyNzNdIGF0aDEwa19wY2kgMDAwMDozYTowMC4wOiBmaXJtd2Fy
ZTogZmFpbGVkIHRvIGxvYWQgCj4gYXRoMTBrL2NhbC1wY2ktMDAwMDozYTowMC4wLmJpbiAoLTIp
Cj4gCj4gQXMgaXTigJlzIGxvZ2dlZCB3aXRoIGVycm9yIGxldmVsLCBJ4oCZZCBsaWtlIHRvIGFk
ZHJlc3MgdGhlIGF0aDEwa19wY2kgCj4gZXJyb3JzLCBidXQgSSBhbSB1bmFibGUgdG8gZmluZCB0
aGUgZmlybXdhcmUgaW4gdGhlIExpbnV4IGZpcm13YXJlIAo+IGFyY2hpdmUgWzFdLgo+IAo+IFdo
YXQgY2FuIEkgZG8gYWJvdXQgdGhpcz8KPiAKPiAKPiBLaW5kIHJlZ2FyZHMsCj4gCj4gUGF1bAo+
IAo+IAo+IFsxXTogCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvZmlybXdhcmUvbGludXgtZmlybXdhcmUuZ2l0LwoKQWRkaW5nIHRoZSBhdGgxMGsgbGlz
dCBzbyB0aGlzIGlzbid0IGxvc3QgaW4gdGhlIG5vaXNlCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTBrCg==
