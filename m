Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B513C38142
	for <ath10k@archiver.kernel.org>; Thu, 19 Jan 2023 05:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wG+Tl21yEAfjtZAiNL0fwgmIm583sxbSM490b8abhAw=; b=xrzxPfvRRufkhQ
	rh+Y2dVNsQXmZqSLMj/nmT0X+auTgpmDiv2q+voDMK9zie8HmrQVrobddFOOMvdEShRkfE+Qsnu+y
	91g67QEb+taMV6RWTA+MxWIJIayOXCe7yQ5MntXQkyOqAYY/T0v2LF+GhY+6y/iBLF0wqnJ3xIaoj
	UdGq/k6rzagTL1KD9jZQ4F8PvHaMWkBoKh+Gy4JSxU0KquS7PClQYFA2MOTJwH+c3k6v620h4h5xD
	+hmVhf5OCm3dAg3+CCcrfm2nmRFlmuOUolTagpi5zS6qVQ7bcyVnH7QGgYaPJSBLUc9SJksS1G1qj
	HY/AAtteFZijtCTYHbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINnw-003hRt-7K; Thu, 19 Jan 2023 05:49:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINnt-003hRH-I1
	for ath10k@lists.infradead.org; Thu, 19 Jan 2023 05:49:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30J4EeVe015389;
	Thu, 19 Jan 2023 05:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TvLSxJKDlVSsYYhn2BY8VF0yC5B8to9hVsiCxE4epnk=;
 b=KwT8kheedk5k0XzYrO5mTUXzH7YXa1RCWfXdGhRMuO2QXS5Sdf6bSlZJoykSRLuti9zd
 PN5hMRR3bI0nxgnTSdjpWR9kikBClK+gGCXQIH4ZUSPrlKxeWdHcwbz4pY8qzmCwCr43
 KijkPAzjhz95jwjBmM+SWJFyXiGQhgCFJzKnDNvDMHHfPMVbGIgyhrEz1tB0cD59GCYc
 gLuDxOOcKXS7okX9bMOVxxoIKQg/SVvFtixeMUay4I1TxDGXkid02oeFmubBkPTETD3q
 9YnGw9m4HVfABmlTTkz1ghG8cbOBY2P1gOhvmZgYU2qpU/6lWKzsuRVE6nXhe9p17301 ow== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6debt8a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 05:49:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30J5nUjm027196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 05:49:30 GMT
Received: from [10.50.23.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 18 Jan
 2023 21:49:28 -0800
Message-ID: <a4f47e6e-637d-8eb8-6bc1-a2dfc8e3632a@quicinc.com>
Date: Thu, 19 Jan 2023 11:17:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] wifi: ath10k: update the channel list if change in
 channel flags.
To: Wen Gong <quic_wgong@quicinc.com>, <ath10k@lists.infradead.org>,
        <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>
References: <20221222124221.30894-1-quic_youghand@quicinc.com>
 <20221222124221.30894-3-quic_youghand@quicinc.com>
 <17047ffb-9c68-8339-a339-c51a2e721083@quicinc.com>
Content-Language: en-US
From: "Youghandhar Chintala (Temp)" <quic_youghand@quicinc.com>
In-Reply-To: <17047ffb-9c68-8339-a339-c51a2e721083@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XshOoqtEjauMBIV8xfz67Qos_iC8ft_x
X-Proofpoint-ORIG-GUID: XshOoqtEjauMBIV8xfz67Qos_iC8ft_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=906 adultscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_214937_752420_976887EB 
X-CRM114-Status: GOOD (  12.95  )
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

Ck9uIDEvMTkvMjAyMyA3OjU2IEFNLCBXZW4gR29uZyB3cm90ZToKPiBPbiAxMi8yMi8yMDIyIDg6
NDIgUE0sIFlvdWdoYW5kaGFyIENoaW50YWxhIHdyb3RlOgo+IC4uLgo+PiDCoCArc3RhdGljIHZv
aWQgYXRoMTBrX21hY19iZWFjb25fbm90aWZpZXIoc3RydWN0IHdpcGh5ICp3aXBoeSkKPj4gK3sK
Pj4gK8KgwqDCoCBzdHJ1Y3QgaWVlZTgwMjExX2h3ICpodyA9IHdpcGh5X3RvX2llZWU4MDIxMV9o
dyh3aXBoeSk7Cj4+ICvCoMKgwqAgc3RydWN0IGF0aDEwayAqYXIgPSBody0+cHJpdjsKPj4gKwo+
PiArwqDCoMKgIGlmIChhdGgxMGtfdXBkYXRlX2NoYW5uZWxfbGlzdChhcikpCj4+ICvCoMKgwqDC
oMKgwqDCoCBhdGgxMGtfd2FybihhciwgImZhaWxlZCB0byB1cGRhdGUgY2hhbm5lbCBsaXN0XG4i
KTsKPj4gK30KPj4gKwo+Cj4gV2lsbCB0aGlzIGNhbGxlZCB3aGlsZSBzY2FuIGlzIHJ1bm5pbmc/
Cj4gT24gYXRoMTFrLCBpZiBzZW5kIGNoYW5uZWwgbGlzdCB0byBmaXJtd2FyZSwgdGhlbiB0aGUg
cnVubmluZyBzY2FuIAo+IHdpbGwgYmUgY2FuY2VsIGFuZCByZW1vdmVkLgo+IEkgZ3Vlc3MgdGhp
cyBpcyBzYW1lIGZvciBhdGgxMGsuCj4KPj4gLi4uCgpZZXMgV2VuLiBZb3UgYXJlIHJpZ2h0LgoK
UmVnYXJkcywKCllvdWdoYW5kaGFyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
