Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E76103A99F
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 03:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1LqtPzEsZq4zTBIrXT1uhHHxBuczbVUwyFrJqfNmekA=; b=S22GdO2XBrBNG+SMfc7gywJmlS
	1WfZONZHdTS/IcEYG0Qq/J+TWXTgxzNtp3vB/3o/i6Y020bum92BlBOV+OgerqGwr+vdaMATVRPV1
	BgW9W2ufxzdl8AD3u3ky0nhsokD5yIWHR9fWhxI3/kureFqa7b8ZU7qGVHFuo96nHqf9uUuNyembn
	JtBVoOCtXMsbxPWbCqeiYpjifOgudsfkSfEHuPvp5BThNJIqXQRkDMu/WOmsH3VeVt/2wCeZQG1kX
	XED7oVdlkN3Yw1ss0g1h/B9Z5dfrPijziv2iMWC8SZgC3QDkwozQGhTWAcLRrzp9YSEN/pgE9w5Pp
	bGdvu+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EYu-00000002ZiO-3WwD;
	Wed, 25 Mar 2026 03:05:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EYt-00000002ZiG-1Iu6
	for ath10k@bombadil.infradead.org;
	Wed, 25 Mar 2026 03:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=1LqtPzEsZq4zTBIrXT1uhHHxBuczbVUwyFrJqfNmekA=; b=lV9v2SxxmfLD6vI9/2w/ZJ3Yvs
	bCK15a677rm9PcgL4hP5nrHOKAD1Z0sm8JOu2JBEIa216TycbiY0WYAHFzhOC7Y7DMx+i1k8wWkVx
	WTx1Eq8fVMNDTU74aqpUIqmidImqbHN645rrDfEwUvTCwqbpE1SgXhV1yheSo/TQ6SClwGxAPd3xp
	ZGzed6PHzIn173g66wvFTePtTjJpopRZYbph0HZ+kZNjpqAQ3HlczuObUPFg4h0mbfo9CSO4N40Rf
	PYg1rZgMwGIGVqbgLOF7LGq582DTQ7DQwVmWD4Cp9jx6/UwTBYHX8TOMv7VhZdY0m//NcfmkzjN7R
	PwL4HBhw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EYn-00000005KCw-2zLT
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 03:05:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCrnk3110432
	for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 03:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1LqtPzEsZq4zTBIrXT1uhH
	HxBuczbVUwyFrJqfNmekA=; b=b0gTCp+qo/01NeFai6RI6lRl7kPQ+Vlw6cqMai
	tQDoToah7v8RCFWLgK2mCAqKs9XIEP71Jbk6LApvX17j8iP4Xsy5gxxab6DDyy2v
	mqZuyXNAoZqoK3NOKmrF+XfHVNlHSD0+LpGZih6NKvVE8gdG1aObOlqi58ef6jU5
	HIseZu3nAZGxHF7x1ype5J+kc2iI8ooracaVH8uSvjU1ffV+u1qPDLGEkrTk/vW9
	pCJFoctzl8tgKt9s6gVHtnx1ihqTy1yH3TpKLF67pVlm4e/AboRopb6MANnvxjta
	tzyWJ8bcFfAd23mtkZQSwrGKpxBLeyzaYPqDQQGhfUI4ampA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvtf2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 03:05:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b06c242a34so382696245ad.0
        for <ath10k@lists.infradead.org>; Tue, 24 Mar 2026 20:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774407927; x=1775012727; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LqtPzEsZq4zTBIrXT1uhHHxBuczbVUwyFrJqfNmekA=;
        b=dxqs9BZ4XfETnO4qH2sKSWilDTQ1i6CdHkn7QeAIoUxiWOWvTCVn+i/4BRQUf/Mws5
         Xys8pgMV+KdZHRclkxp764DdW/Fv3xXSMwBO6oT72CiqwHP4VpF21XR5F/C8VDPiM7ZY
         oLREG51iV/WZQ8SRDRr3Bdp00aO9LYaMmXx9eZAmvHUEdG4HqGt03m9qNnQN0m3DoHHk
         aivDH7ScAyEtkTLHL228YbSPooJYw9wzrpSr3sOTcTvC8x9SKhWUdzHnbIDWd+19Qeor
         Z9UjprEm+As/0P56cKAXgjXQ+4N93rFL1JFdZlwHimv5ytV2OPsSEYElmjc7gD34TdQd
         fiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774407927; x=1775012727;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LqtPzEsZq4zTBIrXT1uhHHxBuczbVUwyFrJqfNmekA=;
        b=BE5IsQO2dm2eckFF22uHI7o9alJgXODCcNDfNk+jrbJNrBy8jTq6dZUyox9zAFpt+b
         uv6nkC1jE6qMmAC7gPlB4cdKPQvX7VYlWeFtbbi1HFjMDUdURHG16NDZ1jD+ZPePeS2y
         uPqfl+8BHS8qO5kTP2roasR4PhMqsJ21uM9WdgL21kC2bMRr41x8GW4OaEDDW/s/EdEx
         zx27iBs5GXPJJ3XscTjeik/PnmqEYbzQPcj9QbayolJcQ0eOgUM74BvAjwubypgAEaLa
         xsAHB/E7f317BDXHu4G1xBIwCxn4gyH/3gLTt7PlX1jppehBqFa51QPlsPIu15AODQO+
         FTDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtTtqA+GXjWVOYSqdVxTHJf4UptTtTGmCo2gMfD7dgkYts36AHneMR5IQzyNYM1KzCMWIdvR4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6WXWsCYPQMmGYE1dFYGRVRKvhldB+Aait+Z/pmiRdAruFPMMM
	eR4n7yMwvTqRVPMON/IHsSxSUZONqlzj3baRh+hy5Jpc64Z9Byp5DSAGTKr8MNdRlK1viJqRaTv
	RJYZZz5H02DAyNJD8IuLMxrC2lXinLsrunObSabE01yvHhoSGvtMxqWUbeMX22R+i4nQS/5mo
X-Gm-Gg: ATEYQzxpq3RnGyf2VBW6MLN0xjxI8yTneR73CCpgdudL/8P9oeoRppBj2FcDVn9xEvr
	sqUk0Q3JArvus3njhzxKZGuCrOaXBOWXyJA2++VIMtugm0eRZ7CR0W6XlaceRS3JxmwjsPSu4tN
	955hZkKZPsxXQ8iNSPU/g8yF4DG0hQLhwpMdDmSgGiY+FShsuko6nGngPiWEofT1vNIcIOyKa9n
	kKY4ZHKaUHRKJ1GPi1iSIdqgBkomyKRPk+oR76zPKfgLRy5MBGdkun4fWkFFaxlWSVgZzjoxg3U
	JwuEYqHiDyvZ+CBO22FEgAXASHsPwm/0R/HvPSD3SPUWsOTA5hk1dbC/2xz0zfwEb+Rm7Eu5W2G
	jXb2gPkGRORRkHQ9Z55bDFl4JkL3B2zXOTdEyNpR0MMgQXJ7iNeg98kB24Vchd0qAkpJwoR+yWd
	E=
X-Received: by 2002:a17:903:1987:b0:2b0:686a:d470 with SMTP id d9443c01a7336-2b0b0a61c80mr21672505ad.23.1774407926632;
        Tue, 24 Mar 2026 20:05:26 -0700 (PDT)
X-Received: by 2002:a17:903:1987:b0:2b0:686a:d470 with SMTP id d9443c01a7336-2b0b0a61c80mr21672215ad.23.1774407926120;
        Tue, 24 Mar 2026 20:05:26 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08369617dsm207422605ad.71.2026.03.24.20.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:05:25 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:05:01 +0800
Subject: [PATCH ath-current] wifi: ath10k: fix station lookup failure
 during disconnect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ath10k-station-lookup-failure-v1-1-2e0c970f25d5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANxQw2kC/x2M0QrCMAwAf2Xk2UBa3RB/RXyoa+bCRjvSVoSxf
 zfs8eDudiiswgUe3Q7KXymSk4G7dDDOIX0YJRqDJz/Q1fcY6uxowVJDNRXXnJe24RRkbcr45lu
 MA9+dIwJ7bMqT/M7/EyzFsalyqvA6jj/omSiofAAAAA==
X-Change-ID: 20260325-ath10k-station-lookup-failure-be4dd6e81100
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        pmenzel@molgen.mpg.de, Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMCBTYWx0ZWRfX+X18LwXpFDlA
 TmEuV3C2M8tZgsC8UTHmkHwr8D5uKS+e365at7AhpAZ2eRNousnDsgRKpJIakWn5hFMZDbZojpj
 BQ5cJ+JtY7CgMlcbdLxgVW7pSXITDdSG0tGbPZglBmW0mNnwFut0QVgArhu2aKOWbIsrh0DWw+2
 pzXZSchc+lwNBrK99ZVFGXs9IZygNuJU+8czI3wY3H82p64eFrdFF+Q5vjHXr0iuZlrzQEsjrC0
 Ly3fcRWVUlSgOl/sWtlGPl13A4t9lcDmbi8t5AvrhMZZubKwvInQQmOUF9MNtbZ2qOjuv6mwJcD
 /BCxtr4wtmQmzWR1NUv1nwXo9SLBYDDLS/3hIkwT12XeI8txoshkS8pKAMNrUKEGnHnDkJbSPdE
 3xyoQMtmgcbOXMMwvXakwSRb7kDblIzX+8ew9frRsLLGOh+qq348Vrf+eRauTVY1JuAU3k3ajc1
 x5zCO4GLidf3fH7DhGA==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c350f7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g3NtLbrsMQ1ddaa6N0AA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: cNtK1qiGRidTdFgIukFexmw_gzq0vvhu
X-Proofpoint-GUID: cNtK1qiGRidTdFgIukFexmw_gzq0vvhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_030534_935406_93433A01 
X-CRM114-Status: GOOD (  18.24  )
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

Recent commit [1] moved station statistics collection to an earlier stage
of the disconnect flow. With this change in place, ath10k fails to resolve
the station entry when handling a peer stats event triggered during
disconnect, resulting in log messages such as:

wlp58s0: deauthenticating from 74:1a:e0:e7:b4:c8 by local choice (Reason: 3=DEAUTH_LEAVING)
ath10k_pci 0000:3a:00.0: not found station for peer stats
ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22

The failure occurs because ath10k relies on ieee80211_find_sta_by_ifaddr()
for station lookup. That function uses local->sta_hash, but by the time
the peer stats request is triggered during disconnect, mac80211 has
already removed the station from that hash table, leading to lookup
failure.

Before commit [1], this issue was not visible because the transition from
IEEE80211_STA_NONE to IEEE80211_STA_NOTEXIST prevented ath10k from sending
a peer stats request at all: ath10k_mac_sta_get_peer_stats_info() would
fail early to find the peer and skip requesting statistics.

Fix this by switching the lookup path to ath10k_peer_find(), which queries
ath10k's internal peer table. At the point where the firmware emits the
peer stats event, the peer entry is still present in the driver's list,
ensuring lookup succeeds.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-QCARMSWPZ-1

Fixes: a203dbeeca15 ("wifi: mac80211: collect station statistics earlier when disconnect") # [1]
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://lore.kernel.org/ath10k/57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index ec8e91707f84..01f2d1fa9d7d 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include "core.h"
 #include "debug.h"
@@ -14,6 +14,7 @@
 #include "wmi-tlv.h"
 #include "p2p.h"
 #include "testmode.h"
+#include "txrx.h"
 #include <linux/bitfield.h>
 
 /***************/
@@ -224,8 +225,9 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k *ar, u16 tag, u16
 						const void *ptr, void *data)
 {
 	const struct wmi_tlv_peer_stats_info *stat = ptr;
-	struct ieee80211_sta *sta;
+	u32 vdev_id = *(u32 *)data;
 	struct ath10k_sta *arsta;
+	struct ath10k_peer *peer;
 
 	if (tag != WMI_TLV_TAG_STRUCT_PEER_STATS_INFO)
 		return -EPROTO;
@@ -241,20 +243,20 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k *ar, u16 tag, u16
 		   __le32_to_cpu(stat->last_tx_rate_code),
 		   __le32_to_cpu(stat->last_tx_bitrate_kbps));
 
-	rcu_read_lock();
-	sta = ieee80211_find_sta_by_ifaddr(ar->hw, stat->peer_macaddr.addr, NULL);
-	if (!sta) {
-		rcu_read_unlock();
-		ath10k_warn(ar, "not found station for peer stats\n");
+	guard(spinlock_bh)(&ar->data_lock);
+
+	peer = ath10k_peer_find(ar, vdev_id, stat->peer_macaddr.addr);
+	if (!peer || !peer->sta) {
+		ath10k_warn(ar, "not found %s with vdev id %u mac addr %pM for peer stats\n",
+			    peer ? "sta" : "peer", vdev_id, stat->peer_macaddr.addr);
 		return -EINVAL;
 	}
 
-	arsta = (struct ath10k_sta *)sta->drv_priv;
+	arsta = (struct ath10k_sta *)peer->sta->drv_priv;
 	arsta->rx_rate_code = __le32_to_cpu(stat->last_rx_rate_code);
 	arsta->rx_bitrate_kbps = __le32_to_cpu(stat->last_rx_bitrate_kbps);
 	arsta->tx_rate_code = __le32_to_cpu(stat->last_tx_rate_code);
 	arsta->tx_bitrate_kbps = __le32_to_cpu(stat->last_tx_bitrate_kbps);
-	rcu_read_unlock();
 
 	return 0;
 }
@@ -266,6 +268,7 @@ static int ath10k_wmi_tlv_op_pull_peer_stats_info(struct ath10k *ar,
 	const struct wmi_tlv_peer_stats_info_ev *ev;
 	const void *data;
 	u32 num_peer_stats;
+	u32 vdev_id;
 	int ret;
 
 	tb = ath10k_wmi_tlv_parse_alloc(ar, skb->data, skb->len, GFP_ATOMIC);
@@ -284,15 +287,16 @@ static int ath10k_wmi_tlv_op_pull_peer_stats_info(struct ath10k *ar,
 	}
 
 	num_peer_stats = __le32_to_cpu(ev->num_peers);
+	vdev_id = __le32_to_cpu(ev->vdev_id);
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI,
 		   "wmi tlv peer stats info update peer vdev id %d peers %i more data %d\n",
-		   __le32_to_cpu(ev->vdev_id),
+		   vdev_id,
 		   num_peer_stats,
 		   __le32_to_cpu(ev->more_data));
 
 	ret = ath10k_wmi_tlv_iter(ar, data, ath10k_wmi_tlv_len(data),
-				  ath10k_wmi_tlv_parse_peer_stats_info, NULL);
+				  ath10k_wmi_tlv_parse_peer_stats_info, &vdev_id);
 	if (ret)
 		ath10k_warn(ar, "failed to parse stats info tlv: %d\n", ret);
 

---
base-commit: 4242625f272974dd1947f73b10d884eab3b277cd
change-id: 20260325-ath10k-station-lookup-failure-be4dd6e81100

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


