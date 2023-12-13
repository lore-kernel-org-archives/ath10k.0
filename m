Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EDCC4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 17:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVs569z7GQ+S0q9ENe/rbTBDIe3xisffzxkzom1tBbY=; b=Ztyu7H46ZXLmZ9I+h3/IQwW0l/
	uFi5pmX8+7A1EEMQRJvnkvL6iFBYp1ryyA2IPHnYuefKHTPsRcBnOmrxve3vnGV8aJ34msqfqbOlV
	JXjTB0rQcZ7kbhwKD8o+ZDRWm3Ou7yUb+lD6HhmDEJwaxB4zLWpQnEZl/kOZhnH5BR4cvToPm//cJ
	YTK/fuMGXO5Ob16a0+4pxWFVAZ50HUYdnSrop3HhgLtKWGQH+WWvxkz7p7mUzgN8z5Qf07yemYZY5
	6z8wdAw2mA7cHXooXyqZRGhYYL0iDYb+hcE/5RZiHMqHMk/ZLSkuCN8ClH8Nq4u+m2yQJoAvLqPJv
	w87rX3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDShe-00FXMz-34;
	Wed, 13 Dec 2023 17:07:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSha-00FXHI-0r
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 17:07:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDEProJ014122;
	Wed, 13 Dec 2023 17:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=PVs569z7GQ+S0q9ENe/rbTBDIe3xisffzxkzom1tBbY
	=; b=QNHU137FI02cDbUWlPk1y02EeZTgAKdSaZiAsDu9OnljTtfzcyPIRo8u71c
	L/7Qq37bKOgAreuHi7SSAibiUPh+/erVlpIk7aRSbqhlmZjcP9i15jsz+xPfGj91
	FCgNAAz25Pne+owZy0drynCwcDoIbo/QDe0NJohwRAOQ/TSvS/+evvJXbFLAnnWn
	mZBUCI3DKHvB1HAP1KQGLpEPck4SVhXqb+ga8MsIMKuVBDBq3ro+miUiMctWg3Zf
	KgytTzhNBPAmbO0miFvkmVLUtbdfv63TtIduBT+5u2DC+Xo2H+VY1l24jo159UFT
	zLnz6PLkrEhS8+I0GfiyqdEbmbA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uyec5rdh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 17:06:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDH6f7u031584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 17:06:41 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 09:06:40 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 13 Dec 2023 09:06:39 -0800
Subject: [PATCH 1/6] wifi: ath10k: use flexible array in struct
 wmi_host_mem_chunks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231213-wmi_host_mem_chunks_flexarray-v1-1-92922d92fa2c@quicinc.com>
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva"
	<gustavo@embeddedor.com>,
        <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YXQsauI6ShGcqDV2UZSF2RjNJnKJTJlJ
X-Proofpoint-GUID: YXQsauI6ShGcqDV2UZSF2RjNJnKJTJlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=894 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_090718_430952_1EBD22BF 
X-CRM114-Status: GOOD (  13.42  )
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

Currently struct wmi_host_mem_chunks defines:
	struct host_memory_chunk items[1];

Per the guidance in [1] this should be a flexible array. However there
is a documented requirement:
	some fw revisions require at least 1 chunk regardless of count

To satisfy this requirement, follow the guidance from [2] and wrap the
array in a union which contains both the flexible array and a single
instance of the underlying struct. Since the footprint of the struct
is unchanged, no additional driver changes are required.

No functional changes, compile tested only.

[1] https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
[2] https://lore.kernel.org/linux-wireless/202308301529.AC90A9EF98@keescook/

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 9146df98fcee..833ce0251a2c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -3069,7 +3069,10 @@ struct host_memory_chunk {
 struct wmi_host_mem_chunks {
 	__le32 count;
 	/* some fw revisions require at least 1 chunk regardless of count */
-	struct host_memory_chunk items[1];
+	union {
+		struct host_memory_chunk item;
+		DECLARE_FLEX_ARRAY(struct host_memory_chunk, items);
+	};
 } __packed;
 
 struct wmi_init_cmd {

-- 
2.42.0


