Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE48C4167D
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 17:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBkJg4RH7YDK3ha87v5K+pqVsnazTKHG8ainsAEr/kU=; b=gpVF3Hw+uCn/DVv8j+UTAd9HPm
	7ns2dbufRhSETzGpnxSGddLH6VTp/d93hqEw6AKIiaMvuh3zO41qxdFy/gi6Sr2ho6XUeIDHTJheV
	q8etP6Xf28DBl/dLptPbHVZA9HVAGjhem8CfmI8aS9FJP+drznaYaMwJkTlnOV42cHdNWBOKzjLFW
	Ht4DDcHCFBvyt93EYbve5JkZtAW3iOL3et+FoWPhk+StyXF9IeS5X9Jl6QwZ28NJ8X1G3qYg7DNlC
	3VJsFeR+uYwSz6Eho4wjdVKPIXA6DomG2sfeLMQrHr4zEuY0Prnby+QQ67l/lJN6rdYk/UEWlAFYK
	OhPZJkSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSha-00FXKy-34;
	Wed, 13 Dec 2023 17:07:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDShY-00FXHR-0N
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 17:07:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDGeQdj030900;
	Wed, 13 Dec 2023 17:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=HBkJg4RH7YDK3ha87v5K+pqVsnazTKHG8ainsAEr/kU
	=; b=AolB2rK7cKPRJt6zGVQNTGvgG696ifM6Qf6/yAJq3DaUXMmpU8pOre3nvGs
	WPNzQRgDqhZy4jNA+i/gL17hTcqBqLcI5lM69SKK9I49+/hG4nCX5XERz+9sQZv0
	13305rDqkghovhH5U2jva30tPFbKahlu4TOHfnDQBMe41Fwskq7WfWG3useoWJkj
	sIWJHrmoeHogu1RNO+H2BcuxlLhXHMi7T9NOczvRq82GAEq/lBOhnQSOjuaNhnRX
	fLEXCmkKfluCKY74U3zXvWJKlgHdyrx1Hnu76GQ57NTrIwKvgVocfAyD5+48VQpM
	ctxj7ghaTO0567z16rMS4l8mFMA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy3rpt008-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 17:06:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDH6ggn024422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 17:06:42 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 09:06:41 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 13 Dec 2023 09:06:43 -0800
Subject: [PATCH 5/6] wifi: ath10k: use flexible array in struct
 wmi_tdls_peer_capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231213-wmi_host_mem_chunks_flexarray-v1-5-92922d92fa2c@quicinc.com>
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
X-Proofpoint-ORIG-GUID: lFjd1BGrthF5pN5KiuQOD21E2VVZ7ela
X-Proofpoint-GUID: lFjd1BGrthF5pN5KiuQOD21E2VVZ7ela
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 mlxlogscore=817 bulkscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_090716_161408_DD64388A 
X-CRM114-Status: GOOD (  15.11  )
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

Currently struct wmi_tdls_peer_capabilities defines:
	struct wmi_channel peer_chan_list[1];

Per the guidance in [1] this should be a flexible array, and at one
point Gustavo was trying to fix this [2], but had questions about the
correct behavior when the associated peer_chan_len is 0.

I have been unable to determine if firmware requires that at least one
record be present even if peer_chan_len is 0. But since that is the
current behavior, follow the example from [3] and replace the
one-element array with a union that contains both a flexible array and
a single instance of the array element. This results in a struct that
has the same footprint as the original, so no other driver changes are
required.

No functional changes, compile tested only.

[1] https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
[2] https://lore.kernel.org/linux-wireless/626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com/
[3] https://lore.kernel.org/linux-wireless/202308301529.AC90A9EF98@keescook/

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index e16410e348ca..b64b6e214bae 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -7162,7 +7162,13 @@ struct wmi_tdls_peer_capabilities {
 	__le32 is_peer_responder;
 	__le32 pref_offchan_num;
 	__le32 pref_offchan_bw;
-	struct wmi_channel peer_chan_list[1];
+	union {
+		/* to match legacy implementation allocate room for
+		 * at least one record even if peer_chan_len is 0
+		 */
+		struct wmi_channel peer_chan_min_allocation;
+		DECLARE_FLEX_ARRAY(struct wmi_channel, peer_chan_list);
+	};
 } __packed;
 
 struct wmi_10_4_tdls_peer_update_cmd {

-- 
2.42.0


