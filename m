Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4A8C4332F
	for <ath10k@archiver.kernel.org>; Tue, 14 Nov 2023 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFqWqZ26eJ4Tu7A9QPvrSwaQCyu4ST+P60K801VhzWY=; b=T6DxOXJdE/eX4I
	UCattChxZZUhMzZeY9dld5rWTRkK3GKxgtF+2lZ67L0j/rSPCIh2y61gp4IXnPWaU76kOL8kG66r8
	O5FAlcLUNhVb+czQpC6Mx3Mh15ySj6gyJhLFeicUbNkUnadbqdM+Gr4TjqTw4tgLBlGl1TJkfrMbE
	S76SnYXdI66kpuhkjjueV0D3Rk3gktqCJ+GQpjIU8P7utHCHvKqhxvkEm2/VMwCoi7QkEWQ5Fjo6A
	9BuRIMKV2wSWpRBbMEMOg4is3NnFaYj3i8s6y8qDZuajXIVuIS+ndYFCuCRRNoM9f3nBDJwbfbjHM
	d7NN2lDat8kU3/7tSDSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2y1F-00GZf6-1S;
	Tue, 14 Nov 2023 18:20:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2y1C-00GZeh-2D
	for ath10k@lists.infradead.org;
	Tue, 14 Nov 2023 18:20:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE9nLBZ027118;
	Tue, 14 Nov 2023 18:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=X1VJdgR4tz03dcjXQbECSZw/oGJ+qUKedww40+GLQIY=;
 b=i8BEesgr/IlekKM9WdnGC8xCepZKv9CLyhC8tYCvhwnOaHzI8/tEL6P3cpxxiCTjWK0W
 Yr51N2c+RDaHAbQBRNSLFDQ1bqHKt52rTy7LnQEMhq+D3pOlEbeAmYN0o7hG9PwP4nPg
 hu6bWRolcTSkONBIRTC5uTHY3OZb2r2pcXXXDCOfmicpfuc7Vz8TwrniBk4s9aq+3G2x
 D1OdvCv0iXAejqGwmIN4SlXKddgRbYpa9n1utwJMVtp4RGkiGxFvBHzsufOfd/oIzavj
 n1wS8S/xz4PrW6ndB+lPIqRUfI0nHx7KG1/ti0n8NdPJq40dzDZpIjYRefDChu+b7K0X uw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uc4fy1hqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 18:19:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AEIJqMU014141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 18:19:52 GMT
Received: from [10.110.49.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 14 Nov
 2023 10:19:51 -0800
Message-ID: <2e4be606-68a9-455b-a43d-20b8375efc49@quicinc.com>
Date: Tue, 14 Nov 2023 10:19:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k_pci logs errors about missing pre-cal and cal firmware on
 a laptop
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        <ath10k@lists.infradead.org>
References: <7158e5e9-8bdc-4660-ac5d-5e3f81cf6158@molgen.mpg.de>
 <b70d8041-901c-48f6-8790-35e354c30865@quicinc.com>
In-Reply-To: <b70d8041-901c-48f6-8790-35e354c30865@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UJ2b_q-aVrCi3ID0Crd25oJh5yHl8dJh
X-Proofpoint-ORIG-GUID: UJ2b_q-aVrCi3ID0Crd25oJh5yHl8dJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_18,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_102010_866907_8802AA74 
X-CRM114-Status: GOOD (  17.79  )
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

T24gMTEvMTQvMjAyMyA5OjMyIEFNLCBKZWZmIEpvaG5zb24gd3JvdGU6Cj4gT24gMTEvMTIvMjAy
MyA0OjEzIEFNLCBQYXVsIE1lbnplbCB3cm90ZToKPj4gRGVhciBMaW51eCBmb2xrcywKPj4KPj4K
Pj4gT25uIHRoZSBEZWxsIFhQUyAxMyA5MzYwIHdpdGggRGViaWFuIHNpZC91bnN0YWJsZSwgTGlu
dXggNi41LjEwIGxvZ3MgdGhlIAo+PiBlcnJvciBiZWxvdzoKPj4KPj4gICAgICAkIHN1ZG8gZG1l
c2cgfCBncmVwIC1lICJETUk6IiAtZSAiTGludXggdmVyc2lvbiIgLWUgbWljcm9jb2RlCj4+ICAg
ICAgWyAgICAwLjAwMDAwMF0gbWljcm9jb2RlOiB1cGRhdGVkIGVhcmx5OiAweGYwIC0+IDB4ZjQs
IGRhdGUgPSAKPj4gMjAyMy0wMi0yMgo+PiAgICAgIFsgICAgMC4wMDAwMDBdIExpbnV4IHZlcnNp
b24gNi41LjAtNC1hbWQ2NCAKPj4gKGRlYmlhbi1rZXJuZWxAbGlzdHMuZGViaWFuLm9yZykgKGdj
Yy0xMyAoRGViaWFuIDEzLjIuMC02KSAxMy4yLjAsIEdOVSAKPj4gbGQgKEdOVSBCaW51dGlscyBm
b3IgRGViaWFuKSAyLjQxKSAjMSBTTVAgUFJFRU1QVF9EWU5BTUlDIERlYmlhbiAKPj4gNi41LjEw
LTEgKDIwMjMtMTEtMDMpCj4+ICAgICAgWyAgICAwLjAwMDAwMF0gRE1JOiBEZWxsIEluYy4gWFBT
IDEzIDkzNjAvMDU5NktGLCBCSU9TIDIuMjEuMCAKPj4gMDYvMDIvMjAyMgo+PiAgICAgIFsgICAg
MC41ODA2ODldIG1pY3JvY29kZTogTWljcm9jb2RlIFVwZGF0ZSBEcml2ZXI6IHYyLjIuCj4+Cj4+
ICAgICAgJCBzdWRvIGRtZXNnIC0tbGV2ZWwgYWxlcnQsY3JpdCxlcnIKPj4gICAgICBbICAgIDAu
MDUzNTY2XSB4ODYvY3B1OiBTR1ggZGlzYWJsZWQgYnkgQklPUy4KPj4gICAgICBbICAgIDEuOTQy
MTgzXSBwc21vdXNlIHNlcmlvMTogc3luYXB0aWNzOiBVbmFibGUgdG8gcXVlcnkgZGV2aWNlOiAt
NQo+PiAgICAgIFsgICAxNC40MDExMTJdIGF0aDEwa19wY2kgMDAwMDozYTowMC4wOiBmaXJtd2Fy
ZTogZmFpbGVkIHRvIGxvYWQgCj4+IGF0aDEway9wcmUtY2FsLXBjaS0wMDAwOjNhOjAwLjAuYmlu
ICgtMikKPj4gICAgICBbICAgMTQuNDAxMTQzXSBmaXJtd2FyZV9jbGFzczogU2VlIGh0dHBzOi8v
d2lraS5kZWJpYW4ub3JnL0Zpcm13YXJlIAo+PiBmb3IgaW5mb3JtYXRpb24gYWJvdXQgbWlzc2lu
ZyBmaXJtd2FyZQo+PiAgICAgIFsgICAxNC40MDExODVdIGF0aDEwa19wY2kgMDAwMDozYTowMC4w
OiBmaXJtd2FyZTogZmFpbGVkIHRvIGxvYWQgCj4+IGF0aDEway9wcmUtY2FsLXBjaS0wMDAwOjNh
OjAwLjAuYmluICgtMikKPj4gICAgICBbICAgMTQuNDAxMjMzXSBhdGgxMGtfcGNpIDAwMDA6M2E6
MDAuMDogZmlybXdhcmU6IGZhaWxlZCB0byBsb2FkIAo+PiBhdGgxMGsvY2FsLXBjaS0wMDAwOjNh
OjAwLjAuYmluICgtMikKPj4gICAgICBbICAgMTQuNDAxMjczXSBhdGgxMGtfcGNpIDAwMDA6M2E6
MDAuMDogZmlybXdhcmU6IGZhaWxlZCB0byBsb2FkIAo+PiBhdGgxMGsvY2FsLXBjaS0wMDAwOjNh
OjAwLjAuYmluICgtMikKPj4KPj4gQXMgaXTigJlzIGxvZ2dlZCB3aXRoIGVycm9yIGxldmVsLCBJ
4oCZZCBsaWtlIHRvIGFkZHJlc3MgdGhlIGF0aDEwa19wY2kgCj4+IGVycm9ycywgYnV0IEkgYW0g
dW5hYmxlIHRvIGZpbmQgdGhlIGZpcm13YXJlIGluIHRoZSBMaW51eCBmaXJtd2FyZSAKPj4gYXJj
aGl2ZSBbMV0uCj4+Cj4+IFdoYXQgY2FuIEkgZG8gYWJvdXQgdGhpcz8KPj4KPj4KPj4gS2luZCBy
ZWdhcmRzLAo+Pgo+PiBQYXVsCj4+Cj4+Cj4+IFsxXTogCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC8K
PiAKPiBBZGRpbmcgdGhlIGF0aDEwayBsaXN0IHNvIHRoaXMgaXNuJ3QgbG9zdCBpbiB0aGUgbm9p
c2UKClRoZSBjYWxpYnJhdGlvbiBmaWxlcyBhcmUgb3B0aW9uYWwgYW5kIHlvdSBzaG91bGQgbm90
IHNlZSBhbnkgd2FybmluZ3MKaWYgdGhleSBhcmUgbm90IHByZXNlbnQuCgpOb3RlIGF0aDEwayBl
eHBsaWNpdGx5IGNhbGxzIGZpcm13YXJlX3JlcXVlc3Rfbm93YXJuKCkgd2hlbiBpdCBsb2FkcyB0
aGUKZmlsZXMgc2luY2UgaXQgZG9lc24ndCB3YW50IGFueSB3YXJuaW5ncyBmcm9tIHRoZSBmaXJt
d2FyZSBsb2FkZXIgaWYgdGhlCmZpbGVzIGFyZW4ndCBwcmVzZW50Lgo8aHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjYuNS4xMC9zb3VyY2UvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDEway9jb3JlLmMjTDkyOT4KCkFuZCBhdGgxMGsgaXRzZWxmIGV4cGxpY2l0bHkgZG9lc24n
dCB3YXJuOgo8aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNS4xMC9zb3VyY2Uv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9jb3JlLmMjTDEyNTk+CgpTbyBJJ20gY29u
ZnVzZWQgd2hlcmUgdGhlc2Ugd2FybmluZ3Mgb3JpZ2luYXRlLgoKQmFzZWQgdXBvbiB0aGUgbWVz
c2FnZToKWyAgIDE0LjQwMTE0M10gZmlybXdhcmVfY2xhc3M6IFNlZSBodHRwczovL3dpa2kuZGVi
aWFuLm9yZy9GaXJtd2FyZQpmb3IgaW5mb3JtYXRpb24gYWJvdXQgbWlzc2luZyBmaXJtd2FyZQoK
aXQgc2VlbXMgeW91IGFyZSBub3QgcnVubmluZyBhIHN0b2NrIGtlcm5lbC4gU28gcGVyaGFwcyBE
ZWJpYW4gaGFzCm1vZGlmaWVkIHRoZSBmaXJtd2FyZSBsb2FkaW5nIHN1Y2ggdGhhdCBpdCBpZ25v
cmVzIHRoZSBGV19PUFRfTk9fV0FSTgpmbGFnIGFuZCB3YXJucyBldmVuIHdoZW4gdG9sZCBub3Qg
dG8gZG8gc28/IFRoaXMgZG9lcyBub3QgYXBwZWFyIHRvIGJlCmFuIHVwc3RyZWFtIGtlcm5lbCBp
c3N1ZS4KCi9qZWZmCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
