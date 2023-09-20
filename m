Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B348C04FF1
	for <ath10k@archiver.kernel.org>; Wed, 20 Sep 2023 19:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMtAjl9y+DXCm5nOjWOjqVE7oq1pooC5Q7Q0UmJSStc=; b=oM8gfCy9orngje
	o/GVtGCgPkmItjtbXU6WD5MGFubApWnHVAK/uDAHcVfZa6L53LcKlKsuKGOvD1s11HnKvukvwCTCh
	TLUfU5r5QYgZajDVvq1zIQPOxFvPKb3hDFDzbj2M/6hZeuo/zMBtZMhDpcxQpHhoLnRUqyU1rVIfP
	mjDUP6ONyNiujLZLvRMRIgZtOqppT2IQeE1ezkAMHlY0vSRvTs7krxJKUZsnVoGeNetpN9FdGXUfA
	4U08UYQXyqXo1bPEfrCXlqSdmzMMg7usZvgLLm9nCEnJ8I0WXPuDnFzFiNjFUESFTACEu9q9wYJae
	WdfEscvD6nWEO1jTgB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj2nH-003zTr-1w;
	Wed, 20 Sep 2023 19:23:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj2nE-003zTE-0P
	for ath10k@lists.infradead.org;
	Wed, 20 Sep 2023 19:23:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38KIEjWv018573;
	Wed, 20 Sep 2023 19:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Pk+KEQFjHV4BqQ2URnmag5iYzc9V2KEPgoqBl6y0JGg=;
 b=d/B1OCv+W1sbf7PydqkTjYx98kL5/eiOyIYRwjnZQM2d0cjb7iLSQ6qoY4u5OWbxQBEI
 J2taCGp2ZVeQDkRUZ5X6vHplB5DGYd8gf0sctET05hPr3kB6KCYMK0D3Cr9H9gHGWQ8L
 Kgg/xWQux9rQlGZZKVNuuYPqT+b5JYw3UZK8w8hIWbZuGgDMWHBN50oveu2VPOhew5lo
 OmX/9BKgzvheZCGFzy3CcXC4A4E+OwCCHIG24YLTpEmL2PEnU5schYXhoeFkZeiDqekL
 Nv2DMX5ySAS4hhIdvqfTy0YogkAKLNRpBk08wuGH5bSEgJjqbf7uxLYsFvaEbshw07nI pg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t7qj9293c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 19:23:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38KJNIrN018118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 19:23:18 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 20 Sep
 2023 12:23:17 -0700
Message-ID: <859fac21-9b1a-452e-91bb-c6d097d451b6@quicinc.com>
Date: Wed, 20 Sep 2023 12:23:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ath10k: reduce invalid ht params rate message noise
Content-Language: en-US
To: James Prestwood <jprestwood@locusrobotics.com>,
        <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <skhan@linuxfoundation.org>,
        Wen Gong
	<quic_wgong@quicinc.com>
References: <cover.1612915444.git.skhan@linuxfoundation.org>
 <76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org>
 <5c31f6dadbcc3dcb19239ad2b6106773@codeaurora.org>
 <87h7mktjgi.fsf@codeaurora.org>
 <db4cd172-6121-a0b7-6c3f-f95baae1c1ed@linuxfoundation.org>
 <87wnvesv8t.fsf@codeaurora.org>
 <82e3e0a2-d95b-cffb-4fa7-2eaa4513dd48@linuxfoundation.org>
 <4a02dd43-c629-4c7c-83fe-256e6d444d60@locusrobotics.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <4a02dd43-c629-4c7c-83fe-256e6d444d60@locusrobotics.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gkuQb1ZVBFQVQYzmSzzsQuBlXzIuc-45
X-Proofpoint-ORIG-GUID: gkuQb1ZVBFQVQYzmSzzsQuBlXzIuc-45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_09,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_122324_171280_1D460DB9 
X-CRM114-Status: GOOD (  28.08  )
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

KGp1c3QgYSByZXNlbmQgd2l0aCBXZW4ncyBjdXJyZW50IGUtbWFpbCBhZGRyZXNzLCBubyBmdXJ0
aGVyIGNvbW1lbnRzKQpPbiA5LzIwLzIwMjMgMTE6MjcgQU0sIEphbWVzIFByZXN0d29vZCB3cm90
ZToKPiBPbiAyLzI2LzIxIDEwOjAxIEFNLCBTaHVhaCBLaGFuIHdyb3RlOgo+PiBPbiAyLzExLzIx
IDQ6MjQgQU0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+PiBTaHVhaCBLaGFuIDxza2hhbkBsaW51eGZv
dW5kYXRpb24ub3JnPiB3cml0ZXM6Cj4+Pgo+Pj4+IE9uIDIvMTAvMjEgMToyOCBBTSwgS2FsbGUg
VmFsbyB3cm90ZToKPj4+Pj4gV2VuIEdvbmcgPHdnb25nQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6
Cj4+Pj4+Cj4+Pj4+PiBPbiAyMDIxLTAyLTEwIDA4OjQyLCBTaHVhaCBLaGFuIHdyb3RlOgo+Pj4+
Pj4+IGF0aDEwa19tYWNfZ2V0X3JhdGVfZmxhZ3NfaHQoKSBmbG9vZHMgZG1lc2cgd2l0aCB0aGUg
Zm9sbG93aW5nCj4+Pj4+Pj4gbWVzc2FnZXMsCj4+Pj4+Pj4gd2hlbiBpdCBmYWlscyB0byBmaW5k
IGEgbWF0Y2ggZm9yIG1jcz03IGFuZCByYXRlPTE0NDAuCj4+Pj4+Pj4KPj4+Pj4+PiBzdXBwb3J0
ZWRfaHRfbWNzX3JhdGVfbnNzMjoKPj4+Pj4+PiB7NyzCoCB7MTMwMCwgMjcwMCwgMTQ0NCwgMzAw
MH0gfQo+Pj4+Pj4+Cj4+Pj4+Pj4gYXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6IGludmFsaWQgaHQg
cGFyYW1zIHJhdGUgMTQ0MCAxMDBrYnBzIG5zcyAyCj4+Pj4+Pj4gbWNzIDcKPj4+Pj4+Pgo+Pj4+
Pj4+IGRldl93YXJuX3JhdGVsaW1pdGVkKCkgaXNuJ3QgaGVscGluZyB0aGUgbm9pc2UuIFVzZSBk
ZXZfd2Fybl9vbmNlKCkKPj4+Pj4+PiBpbnN0ZWFkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogU2h1YWggS2hhbiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz4KPj4+Pj4+PiAtLS0K
Pj4+Pj4+PiDCoMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvbWFjLmMgfCA1ICsr
Ky0tCj4+Pj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L2F0aC9hdGgxMGsvbWFjLmMKPj4+Pj4+PiBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MGsvbWFjLmMKPj4+Pj4+PiBpbmRleCAzNTQ1Y2U3ZGNlMGEuLjI3NjMyMWYwY2ZkZCAxMDA2NDQK
Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jCj4+Pj4+
Pj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9tYWMuYwo+Pj4+Pj4+IEBA
IC04OTcwLDggKzg5NzAsOSBAQCBzdGF0aWMgdm9pZCAKPj4+Pj4+PiBhdGgxMGtfbWFjX2dldF9y
YXRlX2ZsYWdzX2h0KHN0cnVjdAo+Pj4+Pj4+IGF0aDEwayAqYXIsIHUzMiByYXRlLCB1OCBuc3Ms
IHU4Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKmJ3IHw9IFJBVEVfSU5GT19CV180MDsK
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqZmxhZ3MgfD0gUkFURV9JTkZPX0ZMQUdTX1NI
T1JUX0dJOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+Pj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoCBhdGgxMGtfd2FybihhciwgImludmFsaWQgaHQgcGFyYW1zIHJhdGUgJWQgMTAwa2JwcyBu
c3MgCj4+Pj4+Pj4gJWQgbWNzICVkIiwKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJhdGUsIG5zcywgbWNzKTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X3dhcm5f
b25jZShhci0+ZGV2LAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICJpbnZhbGlkIGh0IHBhcmFtcyByYXRlICVkIDEwMGticHMgbnNzICVkIG1jcyAKPj4+Pj4+PiAl
ZCIsCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmF0ZSwgbnNz
LCBtY3MpOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4gwqDCoCB9Cj4+Pj4+Pgo+Pj4+
Pj4gVGhlIHs3LMKgIHsxMzAwLCAyNzAwLCAxNDQ0LCAzMDAwfSB9IGlzIGEgY29ycmVjdCB2YWx1
ZS4KPj4+Pj4+IFRoZSAxNDQwIGlzIHJlcG9ydCBmcm9tIGZpcm13YXJlLCBpdHMgYSB3cm9uZyB2
YWx1ZSwgaXQgaGFzIGZpeGVkIGluCj4+Pj4+PiBmaXJtd2FyZS4KPj4+Pj4KPj4+Pj4gSW4gd2hh
dCB2ZXJzaW9uPwo+Pj4+Pgo+Pj4+Cj4+Pj4gSGVyZSBpcyB0aGUgaW5mbzoKPj4+Pgo+Pj4+IGF0
aDEwa19wY2kgMDAwMDowMjowMC4wOiBxY2E2MTc0IGh3My4yIHRhcmdldCAweDA1MDMwMDAwIGNo
aXBfaWQKPj4+PiAweDAwMzQwYWZmIHN1YiAxN2FhOjA4MjcKPj4+Pgo+Pj4+IGF0aDEwa19wY2kg
MDAwMDowMjowMC4wOiBmaXJtd2FyZSB2ZXIgV0xBTi5STS40LjQuMS0wMDE0MC1RQ0FSTVNXUFot
MQo+Pj4+IGFwaSA2IGZlYXR1cmVzIHdvd2xhbixpZ25vcmUtb3RwLG1mcCBjcmMzMiAyOWViOGNh
MQo+Pj4+Cj4+Pj4gYXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6IGJvYXJkX2ZpbGUgYXBpIDIgYm1p
X2lkIE4vQSBjcmMzMiA0YWMwODg5Ygo+Pj4+Cj4+Pj4gYXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6
IGh0dC12ZXIgMy42MCB3bWktb3AgNCBodHQtb3AgMyBjYWwgb3RwCj4+Pj4gbWF4LXN0YSAzMiBy
YXcgMCBod2NyeXB0byAxCj4+Pj4KPj4+Pj4+IElmIGNoYW5nZSBpdCB0byBkZXZfd2Fybl9vbmNl
LCB0aGVuIGl0IHdpbGwgaGF2ZSBubyBjaGFuY2UgdG8gZmluZCAKPj4+Pj4+IHRoZQo+Pj4+Pj4g
b3RoZXIgd3JvbmcgdmFsdWVzIHdoaWNoIHJlcG9ydCBieSBmaXJtd2FyZSwgYW5kIGl0IGluZGlj
YXRlCj4+Pj4+PiBhIHdyb25nIHZhbHVlIHRvIG1hYzgwMjExL2NmZzgwMjExIGFuZCBsZWFkICJp
dyB3bGFuMCBzdGF0aW9uIGR1bXAiCj4+Pj4+PiBnZXQgYSB3cm9uZyBiaXRyYXRlLgo+Pj4+Pgo+
Pj4+Cj4+Pj4gQWdyZWVkLgo+Pj4+Cj4+Pj4+IEkgYWdyZWUsIHdlIHNob3VsZCBrZWVwIHRoaXMg
d2FybmluZy4gSWYgdGhlIGZpcm13YXJlIHN0aWxsIGtlZXBzCj4+Pj4+IHNlbmRpbmcgaW52YWxp
ZCByYXRlcyB3ZSBzaG91bGQgYWRkIGEgc3BlY2lmaWMgY2hlY2sgdG8gaWdub3JlIHRoZSAKPj4+
Pj4ga25vd24KPj4+Pj4gaW52YWxpZCB2YWx1ZXMsIGJ1dCBub3QgYWxsIG9mIHRoZW0uCj4+Pj4+
Cj4+Pj4KPj4+PiBXb3VsZCBpdCBiZSBoZWxwZnVsIHRvIGFkanVzdCB0aGUgZGVmYXVsdCByYXRl
IGxpbWl0cyBhbmQgc2V0IHRoZSB0bwo+Pj4+IGEgaGlnaGVyIHZhbHVlIGluc3RlYWQuIEl0IG1p
Z2h0IGJlIGRpZmZpY3VsdCB0byBhY2NvdW50IGFsbCBwb3NzaWJsZQo+Pj4+IGludmFsaWQgdmFs
dWVzPwo+Pj4+Cj4+Pj4gU29tZXRoaW5nIGxpa2UsIGF0aDEwa193YXJuX3JhdGVsaW1pdGVkKCkg
dG8gYWRqdXN0IHRoZQo+Pj4+Cj4+Pj4gREVGQVVMVF9SQVRFTElNSVRfSU5URVJWQUwgYW5kIERF
RkFVTFRfUkFURUxJTUlUX0JVUlNUIHVzaW5nCj4+Pj4gREVGSU5FX1JBVEVMSU1JVF9TVEFURQo+
Pj4+Cj4+Pj4gTGV0IG1lIGtub3cgaWYgeW91IGxpa2UgdGhpcyBpZGVhLiBJIGNhbiBzZW5kIGEg
cGF0Y2ggaW4gdG8gZG8gdGhpcy4KPj4+PiBJIHdpbGwgaGFuZyBvbiB0byB0aGlzIGZpcm13YXJl
IHZlcnNpb24gZm9yIGEgbGl0dGxlIGJ1dCBsb25nZXIsIHNvCj4+Pj4gd2UgaGF2ZSBhIHRlc3Qg
Y2FzZS4gOikKPj4+Cj4+PiBJIHdvdWxkIHJhdGhlciBmaXJzdCB0cnkgdG8gZml4IHRoZSByb290
IGNhdXNlLCB3aGljaCBpcyB0aGUgZmlybXdhcmUKPj4+IHNlbmRpbmcgaW52YWxpZCByYXRlcy4g
V2VuLCB5b3UgbWVudGlvbmVkIHRoZXJlJ3MgYSBmaXggaW4gZmlybXdhcmUuIERvCj4+PiB5b3Ug
a25vdyB3aGljaCBmaXJtd2FyZSB2ZXJzaW9uIChhbmQgYnJhbmNoKSBoYXMgdGhlIGZpeD8KPj4+
Cj4+Cj4+IFBpY2tpbmcgdGhpcyBiYWNrIHVwLiBXZW4sIHdoaWNoIGZpcm13YXJlIHZlcnNpb24g
aGFzIHRoaXMgZml4PyBJIGNhbgo+PiB0ZXN0IHRoaXMgb24gbXkgc3lzdGVtIGFuZCBnZXQgcmlk
IG9mIHRoZSBub2lzeSBtZXNzYWdlcy4gOikKPj4KPj4gdGhhbmtzLAo+PiAtLSBTaHVhaAo+IAo+
IEkga25vdyBpdHMgYmVlbiB5ZWFycywgYnV0IHJlYWRpbmcgdGhyb3VnaCB0aGlzIFdlbiBtZW50
aW9uZWQgdGhlcmUgaXMgYSAKPiBmaXggaW4gdGhlIGZpcm13YXJlPyBJIGhhdmVuJ3QgdHJpZWQg
YWxsIG9mIHRoZSBmaXJtd2FyZSBiaW5hcmllcyBpbiAKPiBLYWxsZSdzIHRyZWUgYnV0IHRoZSBt
b3N0IHJlY2VudCBkZWZpbml0ZWx5IHN0aWxsIHNwYW0gdGhlIGxvZ3Mgd2l0aCAKPiB0aGlzIG1l
c3NhZ2UuIElzIHRoZXJlIGEgc3BlY2lmaWMgdmVyc2lvbiBJIGNhbiB1c2UgdG8gZ2V0IHJpZCBv
ZiB0aGVzZT8KPiAKPiBPbmUgdGhpbmcgdG8gbm90ZSBpcyB0aGUgb2xkZXIgImZpcm13YXJlLTQu
YmluIiBkaWQgbm90IGhhdmUgdGhpcyAKPiBwcm9ibGVtLCBidXQgd2FzIG1ldCB3aXRoIHdvcnNl
IHByb2JsZW1zIGxpa2UgZHJpdmVyL2Zpcm13YXJlIGNyYXNoZXMuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEwawo=
