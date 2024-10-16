Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B28D2A520
	for <ath10k@archiver.kernel.org>; Wed, 16 Oct 2024 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yodT7FICiIW0rCw1Keg6+Pyf7e5GDnbOJwbunkzAy1g=; b=k+kOIn8t3r/cvvsGfAdwLQ9NuP
	ZPPVrp27GDuKe4y5DEv83HabXZzpO+k0YX51oyFu1wr44vE6FA0oZMoOMwU7mXaeF2uQPWvssORdx
	hswxFuEpIcEA7/db5h0X7hn9IXYyy+3hHzzZnaPPiIUA4YVkuhfRYULTVmGCAjQfgJ50pAldfpFYR
	F1V3mGaagE3lQoDPeqieNiGEEp98ETbej0MCTJKbhgR/tpMpV2cmcvB9X25/B6luq9lVRoOHtRuHs
	DksXbWv5H6OJwh5m06b7vt56NgEavesym91D4MxxgaOp4i3b/GUkDhaJWx6DTNH96T72/NAsuCMBA
	EHdJi8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t15oU-0000000CDp3-3SNn;
	Wed, 16 Oct 2024 15:19:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t15mg-0000000CDVx-43ZW
	for ath10k@lists.infradead.org;
	Wed, 16 Oct 2024 15:18:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GAI0PI011211;
	Wed, 16 Oct 2024 15:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yodT7FICiIW0rCw1Keg6+Pyf7e5GDnbOJwbunkzAy1g=; b=SpRgkFopPKTeQLUx
	43lN8Wil1zZ9uPdp2tUpG4ElMzTOHShtcX1lE9sS2xADPf9VDnHKhOVhcA9H+mjk
	43FR0TWTuOFRo59mcd0uJcarq8jy739zT06znIB7STt75Serwm4m94PnYpngrYpn
	/C802WKWXQcqghwDQT6dL+51dECoK/ZCT3O6IEwurr2XKiBNPeYWrJ7f5/a2gRAh
	6o3vdYp93HBSS+HU4f0nDJhaWb6kpzMmQMlK34/QsvffHyey47S0b7+AP33RDgrX
	FiUjcivlNCA0is9gAKyiBRD9UCk+rojU/gwPZtFZ3TdMo3Lx5xCHe8ghSAPh0clu
	rwJYXA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5h0v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:17:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GFHuO9011664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:17:56 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 08:17:56 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath10k@lists.infradead.org>, Kang Yang <quic_kangyang@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241008022246.1010-1-quic_kangyang@quicinc.com>
References: <20241008022246.1010-1-quic_kangyang@quicinc.com>
Subject: Re: [PATCH] wifi: ath10k: avoid NULL pointer error during sdio
 remove
Message-ID: <172909187624.412681.7966986946619521130.b4-ty@quicinc.com>
Date: Wed, 16 Oct 2024 08:17:56 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: O3YDfKPodeSNh70q_x4XpPkvYDa1JjJS
X-Proofpoint-GUID: O3YDfKPodeSNh70q_x4XpPkvYDa1JjJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=493 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_081759_161720_6DB67D0C 
X-CRM114-Status: UNSURE (   6.55  )
X-CRM114-Notice: Please train this message.
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


On Tue, 08 Oct 2024 10:22:46 +0800, Kang Yang wrote:
> When running 'rmmod ath10k', ath10k_sdio_remove() will free sdio
> workqueue by destroy_workqueue(). But if CONFIG_INIT_ON_FREE_DEFAULT_ON
> is set to yes, kernel panic will happen:
> Call trace:
>  destroy_workqueue+0x1c/0x258
>  ath10k_sdio_remove+0x84/0x94
>  sdio_bus_remove+0x50/0x16c
>  device_release_driver_internal+0x188/0x25c
>  device_driver_detach+0x20/0x2c
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: avoid NULL pointer error during sdio remove
      commit: 95c38953cb1ecf40399a676a1f85dfe2b5780a9a

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


