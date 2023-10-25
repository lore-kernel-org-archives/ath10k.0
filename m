Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA80C0032E
	for <ath10k@archiver.kernel.org>; Wed, 25 Oct 2023 15:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKXcjJ8Uldwo6GCiJG2e10onyHDk49VnzXtCaO3CKAg=; b=LRVHG1QhiQeYtf
	orGTGNG5+yEZwpT+mvKetcwkM+qAVUGT8v7zbCQ9EtY4gNg6oud2sHTzRm2v2A7wd3vu00oBq4QLX
	soxu+CEd1c3Gn9oYO9fT2m4BLzejqc5RlnYeyc19AHSwN+iiLFEhHcPDkk+8l0ObbweC8qbRAXie8
	mxNj/8i6ATEnrwYlXMAyP3bo/hG9Qy8OcPLzKkbldJncSUQR1mafLatZqcwRJJ5jPctFn9lKDWPZP
	lhjKtyJRbNHzE6VikUTT2KhZo2XEeCuqLTfg107oCHxb4ZJvKgaFaoGe6yfvSEip2G+LmNQfjbo1H
	V1UsyTnP5CsMf2lZSpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvgBZ-00Cews-16;
	Wed, 25 Oct 2023 15:52:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvgBW-00CewI-31
	for ath10k@lists.infradead.org;
	Wed, 25 Oct 2023 15:52:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39PFQvXl025155;
	Wed, 25 Oct 2023 15:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=z/UZBVFqtVeuBuLw7/A7xA0JccB9bFqTaZBT7iungDo=;
 b=bl91IHG72VOhhTSqUdVbddkmuzn9t1NwOlyppu6meRTGw+mQu0J69lWow92cvhCmeVkL
 N0383bI5QEk7JnKdaB29spcF7Dzqjhf2lZm3eS0jaHQngk3Q+EDIrgPO/uZHzp09sP7M
 hroGdw15WXogdWbv/Uwo0XIuFOQ4cXSWaep1lTlUIhuCHLxfje8igCUROOCSwfjU2jYw
 g2eo2bcsy+1IJwWwEUk8irsB/VB389m9GQ1XgzAWecnglsN5frVTDMRj/XjJFLVXhBUI
 kqK2g+1ArPCFeela5O1HDKt+ZIbzskpUGGVrhp7WOdY8kv9gmA346vsIqVEh2/G0aLzy TQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3txwjph418-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 15:52:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39PFqOQR028589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 15:52:24 GMT
Received: from [10.48.243.236] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 25 Oct
 2023 08:52:24 -0700
Message-ID: <afaadf5e-556c-4fd6-bfd3-9c486a35a08f@quicinc.com>
Date: Wed, 25 Oct 2023 08:52:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC - is this a bug?] wifi: ath10k: Asking for some light on
 this, please :)
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        Kalle Valo <kvalo@kernel.org>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva"
	<gustavoars@kernel.org>,
        <linux-hardening@vger.kernel.org>
References: <626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com>
 <26b15f4702cef17fe70b496a62f03735874bd16a.camel@sipsolutions.net>
 <07e9bb04-f9fc-46d5-bfb9-a00a63a707c0@embeddedor.com>
 <f8daa53ee8a8019e4fd2b823c1fcb85a6cc4d806.camel@sipsolutions.net>
 <8219c79e-0359-4136-afa4-fba76fde191a@embeddedor.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <8219c79e-0359-4136-afa4-fba76fde191a@embeddedor.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IqjSZNYTPG2TAHXLzYHqWLrLgXOuEM1_
X-Proofpoint-GUID: IqjSZNYTPG2TAHXLzYHqWLrLgXOuEM1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_04,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=673 priorityscore=1501 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1011 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310250137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_085243_092317_5A50DB79 
X-CRM114-Status: GOOD (  17.95  )
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

T24gMTAvMjQvMjAyMyA3OjM3IFBNLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+IAo+IAo+
IE9uIDEwLzI0LzIzIDE0OjQ5LCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+PiBPbiBUdWUsIDIwMjMt
MTAtMjQgYXQgMTQ6NDEgLTA2MDAsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4+Pgo+Pj4g
SXQgc2VlbXMgd2UgcnVuIGludG8gdGhlIHNhbWUgaXNzdWUgaW4gdGhlIGZ1bmN0aW9uIGJlbG93
LCBldmVuIGluIHRoZQo+Pj4gY2FzZSB0aGlzIGBtZW1zZXQoKWAgaXMgdW5uZWNlc3NhcnkgKHdo
aWNoIGl0IHNlZW1zIGl0J3Mgbm90KToKPj4+Cj4+PiDCoMKgwqDCoDg5MjDCoMKgwqDCoMKgwqDC
oMKgIG1lbXNldChza2ItPmRhdGEsIDAsIHNpemVvZigqY21kKSk7Cj4+Pgo+Pj4gTm90aWNlIHRo
YXQgaWYgYGNhcC0+cGVlcl9jaGFuX2xlbiA9PSAwYCBvciBgY2FwLT5wZWVyX2NoYW5fbGVuID09
IDFgLAo+Pj4gaW4gdGhlIG9yaWdpbmFsIGNvZGUsIHdlIGhhdmUgYGxlbiA9PSBzaXplb2YoKmNt
ZCkgPT0gMTI4YDoKPj4KPj4gUmlnaHQuCj4+Cj4+PiAtwqDCoMKgwqDCoMKgIC8qIHRkbHMgcGVl
ciB1cGRhdGUgY21kIGhhcyBwbGFjZSBob2xkZXIgZm9yIG9uZSBjaGFubmVsKi8KPj4+IC3CoMKg
wqDCoMKgwqAgY2hhbl9sZW4gPSBjYXAtPnBlZXJfY2hhbl9sZW4gPyAoY2FwLT5wZWVyX2NoYW5f
bGVuIC0gMSkgOiAwOwo+Pj4gLQo+Pj4gLcKgwqDCoMKgwqDCoCBsZW4gPSBzaXplb2YoKmNtZCkg
KyBjaGFuX2xlbiAqIHNpemVvZigqY2hhbik7Cj4+PiArwqDCoMKgwqDCoMKgIGxlbiA9IHN0cnVj
dF9zaXplKGNtZCwgcGVlcl9jYXBhYi5wZWVyX2NoYW5fbGlzdCwgCj4+PiBjYXAtPnBlZXJfY2hh
bl9sZW4pOwo+Pj4KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBza2IgPSBhdGgxMGtfd21pX2FsbG9j
X3NrYihhciwgbGVuKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXNrYikKPj4+Cj4+PiB3
aGljaCBtYWtlcyBgcm91bmRfbGVuID09IHJvdW5kdXAobGVuLCA0KSA9PSBzdHJ1Y3Rfc2l6ZShj
bWQsLi4uLC4uLikgCj4+PiA9PSAxMDRgCj4+PiB3aGVuIGBjYXAtPnBlZXJfY2hhbl9sZW4gPT0g
MGAKPj4KPj4gQW5kIHllYWgsIHRoYXQncyByZWFsbHkgdGhlIGlzc3VlLCBpdCBvbmx5IG1hdHRl
cnMgZm9yID09MC4gRm9yIGEgbW9tZW50Cj4+IHRoZXJlIEkgdGhvdWdodCB0aGF0IGRvZXNuJ3Qg
ZXZlbiBtYWtlIHNlbnNlLCBidXQgaXQgbG9va3MgbGlrZSBpdCBuZXZlcgo+PiBldmVuIGJlY29t
ZXMgbm9uLXplcm8uCj4+Cj4+IE5vIGlkZWEgdGhlbiwgc29ycnkuIFlvdSdkIGhvcGUgZmlybXdh
cmUgZG9lc24ndCBjYXJlIGFib3V0IHRoZSBhY3R1YWwKPj4gbWVzc2FnZSBzaXplIGlmIHRoZSBp
bm5lciBkYXRhIHNheXMgIjAgZW50cmllcyIsIGJ1dCB3aG8ga25vd3M/IEFuZCBob3cKPj4gbWFu
eSBmaXJtd2FyZSB2ZXJzaW9ucyBhcmUgdGhlcmU/IDopCj4+Cj4+IFNvIEkgZ3Vlc3MgeW91J2Qg
d2FudCB0byBzdGF5IGNvbXBhdGlibGUsIGV2ZW4gaWYgaXQgbWVhbnMgaGF2aW5nIGEKPj4KPj4g
wqDCoMKgwqBjaGFuX2xlbiA9IG1pbihjYXAtPnBlZXJfY2hhbl9sZW4sIDEpOwo+Pgo+PiBmb3Ig
dGhlIHN0cnVjdF9zaXplKCk/Cj4gCj4gWWVhaCwgdGhhdCdzIGFuIGFsdGVybmF0aXZlLgo+IAo+
IEknbGwgd2FpdCBmb3IgdGhlIG1haW50YWluZXJzIHRvIGNoaW1lIGluIGFuZCBzZWUgaWYgdGhl
eSBoYXZlIGEgZGlmZmVyZW50Cj4gb3Bpbmlvbi4KCkknbSBzZWVpbmcgY2xhcmlmaWNhdGlvbiBm
cm9tIHRoZSBkZXZlbG9wbWVudCB0ZWFtLgoKL2plZmYKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTBrCg==
