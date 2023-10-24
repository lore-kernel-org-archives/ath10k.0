Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668FDC25B47
	for <ath10k@archiver.kernel.org>; Tue, 24 Oct 2023 18:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8ze53jFbhwtHzC9X49Z3oZDfpRYkxq83JZ4ywkmT4c=; b=XyJSsu50VnduWo
	n7nTLPGfuJ8IDlNOPUtIWLJCuJVDBPeZVQ5OQ5pohnxX9orVviZ8FvmNEE1aokjZ05eXAh5uLgHGZ
	4WknTgfi6kU19kX1nKz+Ly4E1aeXvxjZumJ6Ye1OamaN0n5uo6M/L9eByEvMRg8qbA1P/CYII9NKl
	q91z2zXm9uqbDqP+JHfmtWJ+tcTKEKQknjvMxH9nEWL7AgrhdGqMYAEnTS8kzg0LRon8NYrMP2GKF
	bj2fw/ELbsbzkApMg8o8UNN1CfuFdMKAbVGlRR6k6aWOmOAvhqIgbm+rCc4P0qp5oQ8BzpiiY4XBW
	yUTjyGAzAN9y8837TlSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvLvb-00AeaA-19;
	Tue, 24 Oct 2023 18:14:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvLvY-00AeZo-0I
	for ath10k@lists.infradead.org;
	Tue, 24 Oct 2023 18:14:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39OEu7ll009708;
	Tue, 24 Oct 2023 18:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cTHcP7g736rXwQ/nASzpO40/4IpTvv0Zn+p4k+C0POQ=;
 b=Ws4fpA3IktqCIJjALVBuab5OupNt9jrxE1J6ziOzdUBIsKy6xY8D+nV4vJU9NxMWRmuR
 00NM9jv4biqjT3uj3BjX9JVfc7lwsLyc2sgY6ZwkyUExFcIgc3Vfq6FoXO9+DgyuGf5v
 rgn8jzNocBJC6/EpQ0fvqdYvevEAn+qhWvmT85myvz/AAk4k5UBZR5468M4CymNq3Any
 aLlsmhXZna318mkmnHBlEllTk+ns/POCX+vozYcCeX4koqpPu5AFerrCIdg97Q1kuPAe
 BQMLr8Zjl1tztWzAuuHzuN61DZNon7fFp9iN1k1ENvGpl4bzdWnKw83SP12aFZ+zwtJ6 6Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tx5f59udc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 18:14:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39OIEh3K000451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 18:14:44 GMT
Received: from [10.48.243.236] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 24 Oct
 2023 11:14:43 -0700
Message-ID: <68281586-f75e-4995-a30f-130f3aa1e7a8@quicinc.com>
Date: Tue, 24 Oct 2023 11:14:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: replace deprecated strncpy with memcpy
Content-Language: en-US
To: Justin Stitt <justinstitt@google.com>, Kalle Valo <kvalo@kernel.org>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
References: <20231024-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v2-1-4c1f4cd4b4df@google.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231024-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v2-1-4c1f4cd4b4df@google.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AHpv-gD2BPzomyaq-KFnFaBSmVhO_kBX
X-Proofpoint-ORIG-GUID: AHpv-gD2BPzomyaq-KFnFaBSmVhO_kBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_17,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=296 bulkscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310240156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_111452_292713_3F49B05E 
X-CRM114-Status: GOOD (  12.36  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 10/24/2023 10:42 AM, Justin Stitt wrote:
> strncpy() is deprecated [1] and we should prefer less ambiguous
> interfaces.
> 
> In this case, arvif->u.ap.ssid has its length maintained by
> arvif->u.ap.ssid_len which indicates it may not need to be
> NUL-terminated. Make this explicit with __nonstring and use a plain old
> memcpy.
> 
> This is also consistent with future copies into arvif->u.ap.ssid:
> 
> 	if (changed & BSS_CHANGED_SSID &&
> 	    vif->type == NL80211_IFTYPE_AP) {
> 		arvif->u.ap.ssid_len = vif->cfg.ssid_len;
> 		if (vif->cfg.ssid_len)
> 			memcpy(arvif->u.ap.ssid, vif->cfg.ssid,
> 			       vif->cfg.ssid_len);
> 		arvif->u.ap.hidden_ssid = info->hidden_ssid;
> 	}
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
