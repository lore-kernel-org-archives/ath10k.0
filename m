Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403E606B349
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PQC2b04j;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUy26aCm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tr7p6QFZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dUhczvU+wHnfm+9Fyorjp/rDMH/7fLllS5Jh1+JzEbU=; b=PQC2b04jElhwxn
	2cYEGQHGrh/M+NGIqudTVtJKeIyaQEoiCe8eo6equahcMMP/U8c9dyzYTELJ+BKTLTJnhIVotA96N
	VflIV154FtvFEbbdx6sEMcl0IDmuVJql/I3p6848GoF20XCP3BK/mNPhfw0zPsVjr7DitflQN4PJ0
	L8MDRnZt3JuC27bhbql7w1pWTqI3+BNn3gTqBYjAhDknZJtYCc7bXb71giWyzJEoJnhFi/2JC6xlK
	k71hnZcJLN6XaCGz/VOkrRZC8IhObPr9Ss4djwhPY3utSEck37Kf1X47PdkQHeIjluIDMxxkxOjUT
	kIfKg+4F4rJZlFwmyccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSxO-00000009hMt-3Z2d;
	Thu, 12 Nov 2026 11:27:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwu-00000009h1C-35at
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 11:26:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9DvOD480042
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dUhczvU+wHnfm+9Fyorjp/rDMH/7fLllS5Jh1+JzEbU=; b=SUy26aCmhmq3Pkmr
	Y7uWGVYMI1/Mwo+Vx5LIuuU1vM5Ugq8n5v8Ia/7kpLOGSZ+OnWkmZBrAU6DH8yM6
	1xnuw0xD0OCj2lDfDksou5MrOMit5VNwb8cnnocgFK9NHleqpnu1Ap7jIkwN7UPQ
	V6X5WPDKWwxKzZyZBasYVxnRzgRUwHm6BbQWZxojbaOHQwNpB/nrBC/zSjUHb6cv
	dyWb8jdhOYAkSW32VzySUjDZ/ixFNsEerCMotdDmZe6L89jMy9BqceqEwbPnCnEr
	1WSXmd37wiDYehni+OcTj4tRiGiUT6FIbLuL7Cb8OOGvciTufXEo182wgOmMmQqT
	EAOC5A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4re9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37628596fc9so1068858eec.0
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482795; x=1795087595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUhczvU+wHnfm+9Fyorjp/rDMH/7fLllS5Jh1+JzEbU=;
        b=Tr7p6QFZ3MdoXLtBHts8IpHzxu42sD7bV/LjmCu0bXl03GDbW68MwQLXcSXG/df93/
         ATF6UNdMi96OBhp9lhrN0A8t3xjhUo/0bH4AuQ+/Z02bwPmwXX5nb3whpyZhuXOLGyhV
         HA0YV8RG4TY5Efbhno2nNV7JHWhOpdgVGcEv3wXsFKroV3KJ92YHP9BJZE5YLSNTF0fk
         zzq7zbP9f5hXo9jp9SbIbNkgedFcnQuGnvUP61eulijz6uwbGe77xOeW0mpTF/aK3Q0d
         rvhSl2Tto/ThfkBkCeNKbnPcL6AGbqFPm2sEywDV0vrIMdCl3rexxtuXxRoY4MXFhjDA
         BPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482795; x=1795087595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUhczvU+wHnfm+9Fyorjp/rDMH/7fLllS5Jh1+JzEbU=;
        b=TWhT3aRzNwQdith044vKJcgaC+G2IRqj4v/CrR+IrPs9L8t6sVKmrrqgocB4IjV29r
         JsVOcEmvb+xDNCG3pI2MvK/vjDB2nXdloie5UysLTmAiz6aRaa7NVjwjnRrusn5h6FQ7
         ApxHKNt5K3BrCxV4cAdCzNRtEZ1Fpa6QpFWSZGk6tzfCb21AhcVfjPEHbKdl2d+6yJIv
         LDbBPOA6MOUyiWPVqG3SpD0pcjMz9d1LUOwQRtTDf6lIewrjkYyrJsfNUc65azXidQG2
         pLpI+CWQnhnVAHBPW6BYmee1f3IrLEX/Yg1mVt1wXcXnw7q5kbZM5QEI8aWGYExX5Fve
         R+mA==
X-Forwarded-Encrypted: i=1; AL+hErEqPduT3VZwd6ndAgHNJpbJMM84xX5rvYudKBak/BWxgaGoiqO4HTqfrNE2NYNeMFnKNDQc/XA=@lists.infradead.org
X-Gm-Message-State: APuU4Z88Cl3Z8ARhwyQiXDCxntJLcCYY3JtLgJJQA//vmADqZlrJ5h0A
	evAVpE7c0LQtwxdqI0jWcts15Eb+Fkzd9Xvu0Nna5iVAt1U1UCpy42EWDrxL0plmUImV7CAoDH/
	0/2Ftlwu2I9rtRxjqtrgSuLJwaFbN7SpJbBUe++c0D8Gb6zIKDmodygRniPrBBlkn
X-Gm-Gg: AYBFou0mA/OvucwkF/SpTZr+hTQaFzGumbIURgFQiwQ7A9RRA3+yEq9rZWGtfFvOzB+
	JNMzwoutD+fkPPHlAWDQ3qMO1Eqp+9v0/h1Kcq5ab/3ptZDU9OBa1w27QFs5ecImy+S/icex7pn
	t2Pp6zGz4UyEOvqMmfhouK4Ja2xCTv00z7F7t347nOMID5oMyzm0M6RnxbF3sM1mC48NGissDU8
	qr3PFPw+XVYAPnlrGqaeuBDDsyv+n6kG4pdeKru7gDDAONmoVI0yT0xCzoJ1k66f9yPcyKrFjA7
	2X5usskt81Tqs3I9uwmJkRiDog9hP1kqpgsFWIQRNx9V3eAxCmpwC+8/CpffuUd6neUWR1EWzJT
	QZ7iYwbEZ3zMXqoXXfPidVpx9WDThrOaFDBMwWP3PSmWdJOmE/kZmunM6+etOWV7aq/WDyrGhkZ
	jmierxSkOr3+kOtyshsT0N0Pq/
X-Received: by 2002:a05:7300:e915:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-37685a88c50mr5250868eec.13.1794482794572;
        Thu, 12 Nov 2026 03:26:34 -0800 (PST)
X-Received: by 2002:a05:7300:e915:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-37685a88c50mr5250848eec.13.1794482793875;
        Thu, 12 Nov 2026 03:26:33 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:33 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:04 -0800
Subject: [PATCH ath-next v3 05/10] wifi: ath10k: hard-block the radio when
 entering WEDGED state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-10k-sdio-crash-v3-5-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=1644;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=MWfUEvjZr46HYMaP11xduek9QR2GcZgTmlqW2Hg4VCc=;
 b=G5l6aC6zo9pxETS3U2CFCijsxu592zbVekuDs5xhEm9El0qxvySyOmmJDB8y/qMfkimIN+cyc
 q+IbSHt1ZJUAvY/Ch2Qdh19Y8PqEhplDl0ZHI8w/ae0F6C+1vDv+882
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: 6Jz8WeR23mbFr9sY67a08km5mECM6HWM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXwSxKUBnB+cXY
 QQZP+a9VO7GFTltQGu+/waEYBUs/JCwB4Dq3pq5RePjDuWTCirKvq+uYFKRAnMjDRHDVKEoCalR
 s8o99S7CChZ+i3VDvDUuJyPsbA0LvBc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX0bT6TSLv5+cR
 0Qj2gZuNtWCk42kTi3ZolXtPyAKbIHCM6vpc5RkVLW31kVhz6XpixZDwBDSjjask/rHKzsc3u+K
 na4w/LvTbE6JltFB03E1SaTZRW2PniUit4neIgVB4xA10gnQGvC7V7c+5WiEm4MuG1nXINgXRSx
 q5oOQ0j6Fgh3n+6eoRbMR2DAjXhi0n8mue7fVPxJesa1hrsYdzWFDMs9RDqz+ji+LUaMGY/HvmE
 iM3LI7iXMrdk/2Va1CNe9nuL98d4d/6Y9ZeDlTAtlJ2PRbJ0s2tGgV0dR/SEissT21esqaAOHCr
 yTs5sQ/vxZ5VZpy+EclF6OeG/xfFI0x0SPRrsRWnjW1tBvwHvc8hlXXHAYW+P8P3P4BZPSqC/jE
 lVw4f0xNTO5lrIWZYCaNapzgCCv1E5Y4IoXFV/Deg68NjNgqRJjmFXMh4ELD04iQoFiaOL7JGqL
 ZQpHY2p7fL7jBKYJivw==
X-Proofpoint-ORIG-GUID: 6Jz8WeR23mbFr9sY67a08km5mECM6HWM
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af5a26b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=F3v9Kh8TxewD1bH5_NUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_032636_902002_E3CDB0A8 
X-CRM114-Status: GOOD (  13.13  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Once ath10k reaches ATH10K_STATE_WEDGED, the device can no
longer recover and remains unusable until the driver is
reloaded or the system is rebooted.

Userspace daemons may continue issuing scan and connect
requests, which the driver can only reject individually.

Mark the radio as hardware-blocked through rfkill when
entering the WEDGED state so userspace stops retrying
operations against a device that can no longer operate.

Both WEDGED transitions already route through
ath10k_core_enter_wedged(), so adding the call there is
enough to cover them consistently.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index f6b6b81a4896..4eb91efdba41 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2521,6 +2521,14 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_core_wake_all_waiters(ar);
+
+	/*
+	 * Signal the radio as hard-blocked so userspace (e.g.
+	 * wpa_supplicant, NetworkManager) stops looping scan and connect
+	 * requests at a device the driver has already given up on. The
+	 * state is cleared only when the driver is reloaded.
+	 */
+	wiphy_rfkill_set_hw_state(ar->hw->wiphy, true);
 }
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)

-- 
2.34.1


