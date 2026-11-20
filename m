Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A368606A893
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PaNC3sNq;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hOsFZ1x7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ggGq7Ehd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gq1L5L7pty13ukZWKibi8pt1+KwROY5DYn4hDcrRZr4=; b=PaNC3sNqo6t83b
	uC3YXwIwj2Cm3bYJXYJkSOzjbNKP06UhPWFEzHwMVuaa0KFiYtzIqnWl1FfNDiA3i2BWYu//7Y+YG
	A7JMGPy/PlMsFO/gdZwC2cttcYRwnSTayU6UPcMmCp9lHfnXhBN8bptnyIQsRdwFVZrXW2T797qre
	6JUbJtJqPPv5U3UF0bVdrCgfb87yB1TEikbTLZs2br35HwELgyGUiPPwdyRUwauZLrgBH0iVs+CBR
	gaVzTxeifqZRJuzSc3V/N8D5HO7MX0Y0kn38hZFZo0p6Whl/UbrKujb4/u82D9K5ULdDbaIedNJR2
	10TjIBA21VfNnTTYL4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKD6-0000000EMe8-2lG5;
	Fri, 20 Nov 2026 08:43:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKCw-0000000EMXJ-3bIn
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 08:43:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqKB1268327
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gq1L5L7pty13ukZWKibi8pt1+KwROY5DYn4hDcrRZr4=; b=hOsFZ1x7CtTSFPfu
	KjI+6wzyjc5QLrg/seq6JetwneD63OGffpZg52Qmh4j8kyJistMg43AzVergJ1wb
	AOidtDa6X/BaakYDhr5phrTjY63yvgufVJQhd6emyCY2LDlGoR6P/TIOKD6PP9hZ
	RjQJbX5/IHQXVoZM02aZBPODXdrxsLSeqBsqrXancqflAd6vbA+8OKRGIIIqwlRe
	+YJ7DkVYmM/crp9+fScqy/OQm8+QkeUQ1tVr83u/NxAak81IQkbWUEttwusRCNzu
	PpApzH5qprCtiwyB8Wbt8FXxrGEmJsn/xKeoTeCu7T76S5C4TPiRXGuQFpe3gKCv
	ihehog==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1sgv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso820144eec.0
        for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 00:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164178; x=1795768978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gq1L5L7pty13ukZWKibi8pt1+KwROY5DYn4hDcrRZr4=;
        b=ggGq7Ehd4Y0K3FFg0fcwJmsRN5JR0mdEFearcynZfy2L40zH3M1Jd2PN9U6GyZMs/y
         pNxrTwMpEeAStZGW7/mYwGSJlyxDkAKz2yJ/KHY8W36DbvZ+JdapfkioEDrVFyELKCvQ
         WfnNLk0ghUc73/g7Wfdjy5vhoXw7YRuJxnQrbIjOe65y2+WHYazPKamMccqmmYXrVEvn
         l8fzPkkDvvvFN9ZzA+gCkrmzx9OZxwNQmnuaKf0WVM+6vC4e7LxbPIr+opGYQn+J2poT
         1WhZiahxMnCtyLj3XBNbTGBNFhTmkleKUmKFJR7lJ64/8Qic4usmxXHIaPOz3Xbge4Ag
         sp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164178; x=1795768978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gq1L5L7pty13ukZWKibi8pt1+KwROY5DYn4hDcrRZr4=;
        b=KI5MPU0NCeYwnFBq0+JjLUanGYdHsPq8IkOSLKLUm5pIFSUBLJU24hRAeOPYxBsDHS
         3Bpgs2+HwTfw3fAeThnNkoeI022ozmyHhmFRbydP2A/MLj4tw+nN0MdZdVUxJ5FMz188
         UXkEgVE8ZE9sNCqm5JkR9VECjJ9OLBlQRHz7g3KGVsd2smR2C5Gga6iBJGx8+LGU9iIt
         5GAL/cjsf7hyvdGmalZZTciGMQxZiCskP3iCtoQFYjR6np1u3vF8wAmPJWpMYpafPpMJ
         HdKtIhurn3gXgU9nQTuKWl+0f2lJkWXEY+GrT0foXmkhdTp4bjt2jnjhkXadZh5Cyu89
         hQzQ==
X-Forwarded-Encrypted: i=1; AL+hErGT9WLzqpwryLqn5kg6VlWAKnp+T1aixMTtzNnZT2LoWSHU4X580oUEeo3NmceR+gd0LfrIPjQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z+i/av+b7ctVwVG0AReShO0eYoBfWJV+Md6B6av8YhGcFm3aoYT
	HUDWTspbdOkeNsWaRHq70woHyyYZZnOONAsQogjh+ONGcvm/aECGVwvC78jLsdanEBi3yqttoXp
	iz+EUXu5zP5vawb+8FXCPp+TKvycH8r/Gk0z2IxyjPQQDBSH1zz/WjlN3Ij33e4BY
X-Gm-Gg: AYBFou2y2DMNTYTjbhGtbU0lhL3letVpRTGbjUB8m6EFN3s8okkMfwvzd8IqQaL2VB3
	/yQPNBGai9sXsTYU6hdVIMY5zyRhs0fSlQMYUDCVk7yvYYEbD5GoDLZBegJtwScq/sKHRGCuXfe
	rP2AiA7FkS6annfBxIj9ijGL9ybmKuYBW3FXiHg5hmqK0GWQNAAf+1HKJBhg9KD0aaPO/gXewQB
	sDyIDr0h1WVv98m/KvUlt9Du57MaPjI+0eaCRQP3+/6IUTYfmk/IlZ6sSROsT/xKEmsKG71hxZj
	GHswR55lvbovp+ci39PVF0jkdH9WEPsxF1I1flIEKxgWGJDd9XYqB6dSeBzeAlosokll+FCrsan
	gPkITDvNdpYyYMxdiJOF1Pw2ehw5j28/4J6gBdh7Ow4A9lypLp+EUYuKFMNPQAlRWqkQdsdFYqN
	A07ta5LNAqz2X1rakjR6VO07w=
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr2104905c88.22.1795164177815;
        Fri, 20 Nov 2026 00:42:57 -0800 (PST)
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr2104876c88.22.1795164177335;
        Fri, 20 Nov 2026 00:42:57 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:56 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:30 -0800
Subject: [PATCH ath-next v4 05/10] wifi: ath10k: hard-block the radio when
 entering WEDGED state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-5-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=1644;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=vdDPtDHbfB+QI9Z7JKCzOpKtIqwLhgBWSgRR6mhsMlg=;
 b=soTE0DczkYsUZBwC88XdOwSYKvquC6brPAd1/W1gp4/bb/O5sNbfzWg9Q4FzEDjpN9GaeBiHk
 D2xDN+bNEjxD9aW9zXqrr1U4pPgeNWMwzZckdFEiinDNoTYgdDdRqwO
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b000812 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=F3v9Kh8TxewD1bH5_NUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: IRTkzblD3QRkFXF-DdhvzXRdcUvNSfr4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXy+kDdZAq8I8u
 krY9GZKVdTFtvuG0D9Ui+hWxMlmcHnVk4ONXZnU5OZS68U5HFeoKBQKKgFMi5VNzZXTUYhN43uT
 JWcZW/n0a5/rYiHNNJoNhL7rrsON0QnKKXJ2Veute0guB40O7Ap1FBaWKAHj+YkiDKY2LwdIH4t
 fII89xbclu7fqytOGSQjSShPko9cm7iYYKsi9DXBAF2V4+Jiw0Wm2q9kgRlw3KO/KtKyonlgH9e
 9EjjInuLN7b3SEOlO9ESaKx8UwWRQOLsrWD1H6RTioEP4txBaxmy0Fbuj3BdHnN0sCqavYcH7pb
 Vkkkr+bBl8x98Ek4PZjVRjVHR3Q5oCTfPCvqJxormxxwDz72T0FKZCwvvgFk8hfuHn8fxEUroZy
 F4psjG6LNi331kACa67fdwFGpftMMJyhDt/iQEYbLx75vxmQhr99WJFmg8UeUcFjzinBW4Fszuj
 Y2a+B555LvV8IxY0svA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX52DTkSDhSLTA
 EdPsn6p3+q+wwEJnXhwfs+IAawydsHdFu13tGkRF4kiLsPHxu7TjSWKh1U/1eMnZiR35bg32XZW
 5BuOjwYT3r+eXHSxFaKIwR+RPQwU0qw=
X-Proofpoint-ORIG-GUID: IRTkzblD3QRkFXF-DdhvzXRdcUvNSfr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004259_000849_219D6AB2 
X-CRM114-Status: GOOD (  13.36  )
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
index 99960f12dc66..676f9657b032 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2562,6 +2562,14 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
 
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


