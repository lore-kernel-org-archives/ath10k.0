Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34042C0755A
	for <ath10k@archiver.kernel.org>; Mon, 27 Nov 2023 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5y5srsVGaUgc4pzFTEz4TlyC6QDsEswB1cUASknC2U=; b=fzXm/FpbnkhRG9
	rr1FcZWMvPzkaPKvxVIUiJh5jBAznHI1Wdi5Y6jEy5kbUuiDI/+kVIMDGjhzUM+kgKzt2E0Fs501K
	NE0jiK/jFHICjC+D0nbUp1GB9ab7enJbCUpqU+xJ/m4A5tknKOOho8+SC+aoQJQNpeXejVe6bMo1Y
	uwughGlAJR4XKb/hEOxB+Ix1c0PgtTKo69ksBSQ6i2kqZCiEMzelM+z5inUURzVLs0uT5QEctivGs
	4LdiiYGJhl3AsS4NMZ9EXWBn5qknkqLBl7bgP2/4RpdmaQ4EtRRmHNaTU+rEl1SpyeEiqu6QzrSaA
	tFcnkjzMtEUZGTIlJROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eGJ-002vss-2s;
	Mon, 27 Nov 2023 16:15:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eGG-002vq0-0P;
	Mon, 27 Nov 2023 16:15:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARDYXi4027431;
	Mon, 27 Nov 2023 16:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=kwToAWSsG2Wjvvvrx5hqYxwihGFRZTC8Kd2uja4WkAw=;
 b=M27fwTqHpg6Fn8J0CnVY+j1pN7Wxnb69mJsBd6BikxSukmBYTTyO0Jf0RjCGYf7ur9Gz
 rwGH0v/Wob59NhbA//xSITaAHHNYUZYwmxoapdYcjMixzk6zwYn8ieDI2jQUOjkgq/X/
 EOmSlwmq28A8jLYuq83Ev3i0d2iKzFUyBq8mlE8g15qfmxSr/7jWALY7yxj5+gLlG49I
 85IeF0R8wXQYl75Vb0kj4MZo2X0+0/cbfxwo1b4wCQA0T+Te9v7eG9oXcihqxPC5LfEs
 Kxp53aA31cTt9Sps1rOkxGc5FnhIDBS6bkvGpMZ3hpYMXnS8/SZjiEmvHhhH+WF5GgA+ zA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umsvagtwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 16:14:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ARGEoQS010142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 16:14:50 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 08:14:49 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 27 Nov 2023 08:14:50 -0800
Subject: [PATCH 4/4] wifi: ath11k: Use DECLARE_FLEX_ARRAY() for
 ath11k_htc_record
MIME-Version: 1.0
Message-ID: <20231127-flexarray-htc_record-v1-4-6be1f36126fd@quicinc.com>
References: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
In-Reply-To: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook
	<keescook@chromium.org>, <ath10k@lists.infradead.org>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3YsRphUjGQyFMrivjZixZ2k4DeZXtLBf
X-Proofpoint-GUID: 3YsRphUjGQyFMrivjZixZ2k4DeZXtLBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_14,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=402 phishscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311270112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_081504_219780_B84D086E 
X-CRM114-Status: GOOD (  14.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Transform the zero-length array in ath11k_htc_record into a proper
flexible array via the DECLARE_FLEX_ARRAY() macro. This helps with
ongoing efforts to globally enable -Warray-bounds.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/htc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
index 84971cc9251c..e0434b29df70 100644
--- a/drivers/net/wireless/ath/ath11k/htc.h
+++ b/drivers/net/wireless/ath/ath11k/htc.h
@@ -151,7 +151,7 @@ struct ath11k_htc_credit_report {
 struct ath11k_htc_record {
 	struct ath11k_htc_record_hdr hdr;
 	union {
-		struct ath11k_htc_credit_report credit_report[0];
+		DECLARE_FLEX_ARRAY(struct ath11k_htc_credit_report, credit_report);
 	};
 } __packed __aligned(4);
 

-- 
2.42.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
