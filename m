Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62818C47DB3
	for <ath10k@archiver.kernel.org>; Thu, 18 Jan 2024 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY1NWNgvjQ2I1WarSI9xQY5Dw4XgduBVsLCIgrtYBfc=; b=DNQvLkWU/HhwF9BvjGdNPeFeH4
	i7HMR2sSbCLaym5jDdmawMlzJ3TE7nb6ECM9CG46Ih2Wa78/I80N/IvF7A5gyEZTmN7DyXHaSO842
	br25VMX4hYBQNchEZLDQ3U0SNDqzYHujD/EepMSOZ/HsE6UJZvEL2SUwEzZnspF019l+PC9PDHpIO
	nJI2IdHFUT1RU+HWeXeWHmxCWEG2cXhaXqblO1ZccMN4VSmZEENM3Or3UQp3DpDKE/FnSWFabZYuX
	GtQGwCGzaMCmKy5NziRzJVlJbaRcoOXz0srrHG9KAS5hPkV1pAI/m7CYLOphsEZWTl133eG4nWQAq
	QaYf2zWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQV0n-003Czd-32;
	Thu, 18 Jan 2024 16:13:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQV0l-003Cxs-09
	for ath10k@lists.infradead.org;
	Thu, 18 Jan 2024 16:13:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40IEPj1H003045;
	Thu, 18 Jan 2024 16:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=UY1NWNgvjQ2I1WarSI9xQY5Dw4XgduBVsLCIgrtYBfc
	=; b=T0SjTVNJkivhgNGhNs0TYJ8ohVdzBFWSSLobG7EcAQ4qJWPLQMryoDvUs9f
	QmaU63MypewUc7SaGels6NhRl2ap5zMAgJsBkusKGwyXK3PGw3WXwcsqOFk4udnL
	FspawG1fcVPg0ymGGX/d2MJdwbT7c6jx+0pOfUZibrNZrbmyp2AO2HE+4bPgbK/b
	qoM1lOXb+U91yCGR/T9lNVEJVw1dLDKZRSbaVhjgKezSrkMtQbinKj2gMvtjf8j6
	s8iYnNNn2nKO4/39VFctnO3J65AYCyI2LssvVLIi6P/tajQqPkWUMz0OwRWBErAN
	rjRHUqna7SMS5SgZDXu+kCyQ/1A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vq5qrg8qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:12:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40IGCuM7017656
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:12:56 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 18 Jan
 2024 08:12:55 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 18 Jan 2024 08:12:56 -0800
Subject: [PATCH 4/5] wifi: ath10k: Fix htt_data_tx_completion kernel-doc
 warning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240118-ath10k-kerneldoc-v1-4-99c7e8d95aad@quicinc.com>
References: <20240118-ath10k-kerneldoc-v1-0-99c7e8d95aad@quicinc.com>
In-Reply-To: <20240118-ath10k-kerneldoc-v1-0-99c7e8d95aad@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VSJcKERQF4lnwuYTrpjmjqC3LJiXLwCj
X-Proofpoint-ORIG-GUID: VSJcKERQF4lnwuYTrpjmjqC3LJiXLwCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 mlxlogscore=965 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401180118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_081259_087963_257C8ACC 
X-CRM114-Status: GOOD (  12.85  )
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

Currently kernel-doc reports:
drivers/net/wireless/ath/ath10k/htt.h:911: warning: Cannot understand  * @brief target -> host TX completion indication message definition
 on line 911 - I thought it was a doc line

This is because even though struct htt_data_tx_completion uses the
kernel-doc marker "/**", it doesn't actual use kernel-doc syntax for
the documentation. Rather than try to update this legacy driver
documentation to use kernel-doc style, just replace the comment
marker.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/htt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index eb0ce2f49315..603f6de62b0a 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -906,7 +906,7 @@ struct htt_data_tx_completion_ext {
 	__le16 msdus_rssi[];
 } __packed;
 
-/**
+/*
  * @brief target -> host TX completion indication message definition
  *
  * @details

-- 
2.42.0


