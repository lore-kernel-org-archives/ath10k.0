Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A89C3DA70
	for <ath10k@archiver.kernel.org>; Mon, 22 Jul 2024 23:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKI+0YYPf0a/HqpDegYmr6hHmJIDAIHwcwCeskQ9xWI=; b=OlMqkOmibyCTwjxI6G/QMV1zU2
	4Y46+f6irsrVXvBbqeu6BJsk6090eC2L28n1g2OjnEMpkQJoOQqrVSIY8WQ7ls1xKpO3wxQ1JOrWQ
	ZlM3JIZsfw+Kxm/zCYXd9vGa11M0UJ10M8i72OI0dCrp/n5EgMndW7cb8I5NzfVO1iGT9CDyyzDUF
	ut+9KldX6kcr5lwh6ulA9spTKO4VjAGRnZ/CY9XzZK5VGupeKoHDYyxfHdpXx2B1vbkIPa1LwoZvH
	ixqBPGJb+IOUWqtvhKuMyDXYf56UciyICgwZGLEjvtuen81Qjvpl989NFvuNm98QlApypQVh0uWPj
	9sb5hPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW2N8-0000000Aqts-38Ml;
	Mon, 22 Jul 2024 23:23:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW2N5-0000000Aqrn-3L4c
	for ath10k@lists.infradead.org;
	Mon, 22 Jul 2024 23:23:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MLcE11013299;
	Mon, 22 Jul 2024 23:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BKI+0YYPf0a/HqpDegYmr6hHmJIDAIHwcwCeskQ9xWI=; b=Qx81uHzJGplcfgqa
	ygAFaqofLWf2cU1aIMeh+82d4bm70hjrfFIAHEnY6oCoZhUNKlt6COtrDEryiWTt
	yRCro4Bn0x0tlJhPb7cxv5zSSxUa0QZsvCY+WgRw9vrNQokGCAykdiKRtnXiG0Dz
	aUg9eA19KWNd1UBtlvy/aLbXCN14wWOpFHmx21/uZ0EU72Gyi1OX7OdN1r1LniZP
	VE1KAHBMpk+01K1LVT/k9zUhBdZwRs9zTDhk7RBf1DCQk8FjD1k2eAGJIijmg3qS
	RVlm3OZyp52Z2X0njxkDwAFi3LUDOtqQjLm5dVO/hHqo8XJu3RnpPqh/nXRDmev8
	/N1JUA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g5m6w44s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 23:23:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46MNN8B9028289
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 23:23:08 GMT
Received: from [10.111.176.36] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 16:23:08 -0700
Message-ID: <e18c35c4-c57b-444d-8f55-822b17ec8177@quicinc.com>
Date: Mon, 22 Jul 2024 16:23:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath10k: fix invalid VHT parameters in
 supported_vht_mcs_rate_nss1
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240711020344.98040-1-quic_bqiang@quicinc.com>
 <20240711020344.98040-2-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240711020344.98040-2-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lwNpHTsywc87ZrXFUDQdg4WWYnoU5jvY
X-Proofpoint-ORIG-GUID: lwNpHTsywc87ZrXFUDQdg4WWYnoU5jvY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_16,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxlogscore=874 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_162312_093188_39367283 
X-CRM114-Status: GOOD (  10.70  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 7/10/2024 7:03 PM, Baochen Qiang wrote:
> In supported_vht_mcs_rate_nss1, the rate for MCS9 & VHT20 is defined as
> {780,  867}, this does not align with firmware's definition and therefore
> fails the verification in ath10k_mac_get_rate_flags_vht():
> 
> 	invalid vht params rate 960 100kbps nss 1 mcs 9
> 
> Change it to {865,  960} to align with firmware, so this issue could be
> fixed.
> 
> Since ath10k_hw_params::supports_peer_stats_info is enabled only for
> QCA6174, this change does not affect other chips.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-QCARMSWPZ-1
> 
> Fixes: 3344b99d69ab ("ath10k: add bitrate parse for peer stats info")
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/lkml/fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



