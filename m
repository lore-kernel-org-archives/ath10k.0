Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BC1C4167B
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 17:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2R8Hf30ansh0q9veiXH67BzJDPzuP0bNK2kUtXNSos=; b=NCSIniIEv8R4MpaUysYOKK1Pg6
	aIYPCTVDIxrtJNgbAo2IfGJoyBJig+NB8zhHGHn9JEmF3RtKupHN2VeOfoRCAW6t5H33YjSVU/X6+
	n5Mb9sCYiFnctnx9RBdzNz1pv8/nwa9fD78hcLalPSyKDkLhNUcNWxeyajij3Rwdcc0WVFHV0nlQQ
	NqXGxiGCpVyR1/FONXgy0oBkQGOfVAKYca5h8rgeSIGMgJqdA2CPy/f/+Ae7FMOrySFsf1mAwUPG3
	+FY888v61jiSUpIKR/LNukqkClx583bnI8f5IWtIR8/NK+EFKdPJRjdGKqZrpdkVMKkPsF36DtiD6
	XRwDY7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDShe-00FXMM-1A;
	Wed, 13 Dec 2023 17:07:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSha-00FXHL-0r
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 17:07:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDDnRpt014846;
	Wed, 13 Dec 2023 17:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=g2R8Hf30ansh0q9veiXH67BzJDPzuP0bNK2kUtXNSos
	=; b=mo1n7OBDa1yH+r8RdZTX5mnOsLptTudDDTFL9OmXBheyRZWnifbfbv8dB4c
	7s+0xT3fgWs+AyJ6V7mLVWYofOxwmmik8FWMYm56phFHAcRl8r4aCR8QexrgjPVb
	Qn27K+o9a72ogLF/WFmZxnlk28r39C/HJlPW4KJX9gQOo4h5LeNB2ng1K3vEKP/3
	Nz+nCVcPq+CvBkah3D89aFxJIDXDsQTZf6YKv69737iH5cu3oFSqn41mEKZ+fBZM
	cE89Wt6TJomsXLtvLelLsp6IUsyzc49tC7axSaPJoovzcuEeIkX+3uiWy2pseBVk
	51YPtVdqQk8RdIN05bZj00Bz0EA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy9gd15qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 17:06:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDH6gev024426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 17:06:42 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 09:06:41 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 13 Dec 2023 09:06:44 -0800
Subject: [PATCH 6/6] wifi: ath10k: remove duplicate memset() in 10.4 TDLS
 peer update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231213-wmi_host_mem_chunks_flexarray-v1-6-92922d92fa2c@quicinc.com>
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
X-Proofpoint-ORIG-GUID: o113M8uWNgMGPXX11Br_ZlzAUJuPoPVd
X-Proofpoint-GUID: o113M8uWNgMGPXX11Br_ZlzAUJuPoPVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 mlxlogscore=521
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_090718_429192_1D51F9FA 
X-CRM114-Status: UNSURE (   9.37  )
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

In [1] it was identified that in ath10k_wmi_10_4_gen_tdls_peer_update()
the memset(skb->data, 0, sizeof(*cmd)) is unnecessary since function
ath10k_wmi_alloc_skb() already zeroes skb->data, so remove it.

No functional changes, compile tested only.

[1] https://lore.kernel.org/linux-wireless/626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com/

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 4d5aadbc7159..0cfd9484c45e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -8918,8 +8918,6 @@ ath10k_wmi_10_4_gen_tdls_peer_update(struct ath10k *ar,
 	if (!skb)
 		return ERR_PTR(-ENOMEM);
 
-	memset(skb->data, 0, sizeof(*cmd));
-
 	cmd = (struct wmi_10_4_tdls_peer_update_cmd *)skb->data;
 	cmd->vdev_id = __cpu_to_le32(arg->vdev_id);
 	ether_addr_copy(cmd->peer_macaddr.addr, arg->addr);

-- 
2.42.0


