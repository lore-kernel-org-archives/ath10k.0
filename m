Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94C5C9830E
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 12:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5w7q9ogn31YAk0QYJSlGxujKIiOMeqXwjSr/p/4Hy10=; b=HTgDw12w+8TBeXN2GZXYSx+b8G
	U1rmVcF1Esq/l78bSNYvcoZ45way6XT2bVNddVlfbDF4Mqds1B1xLDae0O4WsIJwkDFt2zcyc0yF8
	qIPf4jrHdVpdl/NrtGnjV/29ckU2sa6Ei6vS50mHMXeCXIGcnTeHMbUUdNvDUFidCsX06SaIqYjha
	Hvu45wb4NwpJ5AxSHUUF5cbzQpRi856Wut+JgOlwph5s99P078Dd/pe5S6A3JnUG6Ect+ZCyAd6+m
	7SaQyE07ielrb5quZN2kBv1GTQk3aDAxWY9gAB4hlnNBtCvuxG8J46IaODUZtCRp6ePY6rueJBzz5
	ZfPVK+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA513-0000000DJZD-0zPa;
	Fri, 25 Sep 2026 12:27:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA510-0000000DJWP-1lTr
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 12:26:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBV8Lj425742
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5w7q9ogn31YAk0QYJSlGxujKIiOMeqXwjSr/p/4Hy10=; b=YPuF/NNhJ1fqJwMZ
	roaklHfCelHPIvk9+11KTWRlpwrpPjwY3JiOtWf0HZQN8h6+8a9xiPVUhF5sPiPk
	Bgu6PxXJrDozIYd1AxnI+CVqKIpahbosNsmEq927NyLY9T1zTRS9WfdSeKAF9BGK
	ZxqmE6VvtwhZwZF5I00QRb/TJ+EDXfU9ujeWCeOP5YCq52oC5mUGtkqeNzCt3AHL
	WQ2Pk9Fbr2Wq8tDIHaKO1EyvXszJk8zlBrmSaecpfjwRUEOQ8bEKku9/DEK9FIk+
	0p4f/VnRHxmnHrHKbLOsRvn8aBaYO/6ONFL3cV8xQcqmyGz2MyivLxA69sMeHF4b
	nI96kg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e85hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1352199a91.3
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790339217; x=1790944017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5w7q9ogn31YAk0QYJSlGxujKIiOMeqXwjSr/p/4Hy10=;
        b=c6vpIs3WvRthxjPKpWd/bzQkjZni5mfmwoly/RH3HW6+gVITfhaCTLcY6UBJmFf3MA
         9oukgFAxsxYUmYktTqy5LUe3iQElawfClXDZEgIZ/XJAXb9hGR6VFPOB0Q7rSXtReETd
         gxO58oU9C9VG63Fy2l1VhJpUAWH4JVzb/qtbK78ZBFkXVGXbowHHtK8ySYdEDnY96i1/
         RsjB6rEnAx+86KzyLBoDO9Uy8SjZhFKKFmg8CzvgKeSMX0SG8I4Z8KgNqxSIW9Thp7Js
         DPZ+2eUc2hb7XMLXLL93cIVn3ElfAZQIXlC2zkkvYj8OZqRkD1ZE+JOrglEQEKJpx88Q
         C2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339217; x=1790944017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5w7q9ogn31YAk0QYJSlGxujKIiOMeqXwjSr/p/4Hy10=;
        b=k8+440Idg24LVcWU16h5TUD4I7uNOInHRP2GYI43iF/7zNSrFQnL2eN9kNnPU3F4Lu
         8oogqngCbQTRxGEF9cITDv9YsugQU+AUXNF/zwGc8hnp6vj/swgQxwfFGYlEu49Ro0Sw
         nTcUiF+oso2iWfO/XgFb5NlBhUrTWGDixxojdIJcXdLNbg+LIba9QGiQ3yH3meJBC3x3
         DYibSQ/tOSwVmvX+z3DRSC0wKjnPoYC8Q/IplzQM2OzVKNN5Wvo1f6In3QZ91XCU8RHF
         /zK6rxihNhzlQkq3/Hivh+5rDvjlvo586TRp1p7BK4d3leDzFZwNj8t8VrF8++Mc8ObX
         j2pw==
X-Gm-Message-State: AFuF++mIJ2tf4ryQa/jrvqI9f65luHLMpE7Ngwi134bdwVITKYIGPeyF
	jw3c1/brNzYHs4Qz8vf0xBR18uJAq58dheF4yJg83ZTaZIp9VzEyrnn8ByA/huuPHbCMxXMS7By
	6ymrBzCH10e9gkVUCzFiiRHXXEmq5jTo7Hx3D8ji402tduShBtjdX3qDN34h9/hAV
X-Gm-Gg: AYBFou2W+4dzBLMl3f/2VbDWNzVQ9gVLL4yZKSF5ltEE2oJ7IooEph+iWlyLb1VEupm
	AyUsrNnG0k5+PJ6IhaRbzzLRyd16qR+0pwLk4X4zT8yIPWZpx7fxLlG814Lkn96Nl4jifc2Y790
	TGevltb5gMMtIB1DWzzlBeHHbn7TcJO3PsHzyrEuBq+Y1JdfFl3y2pe6W5O4Ob+tY2jhQZg7UXH
	BBT4ZUO1SpgiWSEI88aN6PF6aHI8L83e9tJj3p9tetB+Hys5MKh0iE9lsVaAj6h1XTfS05XzudQ
	tZvXmRaZReO7fssgODHPrPZrfNy126KcTmfe4dnbCKPfu+61uWA5/0oToUTog8rzmE4Pe4vPWwD
	wj5rYb8s+OL+Yc5WXm7ZYMktRCpjqNe2FGT5tkqFmr2DzGdOTrMw=
X-Received: by 2002:a17:90b:1c02:b0:3a0:94ec:74e0 with SMTP id 98e67ed59e1d1-3a09929094cmr5081601a91.60.1790339217153;
        Fri, 25 Sep 2026 05:26:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1c02:b0:3a0:94ec:74e0 with SMTP id 98e67ed59e1d1-3a09929094cmr5081590a91.60.1790339216691;
        Fri, 25 Sep 2026 05:26:56 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b998dbf2sm4401671a91.12.2026.09.25.05.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:26:56 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 05:26:36 -0700
Subject: [PATCH ath-next 6/8] wifi: ath10k: hard-block the radio when
 entering WEDGED state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-10k-sdio-crash-v1-6-14baf913df94@oss.qualcomm.com>
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
In-Reply-To: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
To: ath10k@lists.infradead.org
Cc: Kang Yang <kang.yang@oss.qualcomm.com>, linux-wireless@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790339204; l=1566;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=qDHwxjUD+8UZM/3Jp2H7I6rAdDHpUJZY86zTWrG1hNc=;
 b=FA5KhqslqB+mtpYpggXB0lgfb7PumDyJ5eQqa1r4RvGGUxcZW5AJBY08RVU6GUpxycajNolW9
 g5LwklyF3D+A3jbpLRlUFYrU3mmQAlZgwLgobk9h1sq1Mx4CaPkmkK4
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX1UhHSGrJSyV3
 1oprm+AmmdhDPMk0gTCtcB6ocRs+aKGqgxwy1MuXKvTdtlGFBidxD4zQcJwvOwbCO9nE5atBGdE
 Jknn7zaChrLy/cZFYIw+rYD71Zmq7e8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX5w2wr8dS+EUf
 3XlebL1fEAkzm4Mje7VUmk1+8OPQKzWlRFEVngK49ht46Oxy28f+QGPKZ7erwDSnHgyKbP2GlGI
 p0nxWEw7ipvhO7SRJABSIi5tHtpzD/Fn6ld5kUdTCT9leYji58o2+dQbjA1/r4LWNtxebpLXoB9
 Ryldx1HMh8AXOt5tGAIXe2eiM07FwvlgNXjTEDtMzbFclD7JJrxvLs+wvUri4v080+maOGAwWsq
 03pObS8pq8WekWfT6rUDKBRhLCRQ54k1dKzsc497GXWIdL17qKrDGA+Pdj/jw8q/ing7Exg8izA
 fr5TI2R0/xMqpmA1a6KA6jQYQGi348OZZrWgh91Qlf4QPGC0+bsSW56BFA602HqexgGQd529iME
 v/Oym9EMbWX6/5ppSaMThweuTkGGCUuLj98PSk2RWXPH9/m3OoyQ5GZN/nbABYP9kkm0Z9wqngU
 OckEaEnuNPb6KPJkhQQ==
X-Proofpoint-GUID: MiAoEPQLr6KTbE4DEMLKpW7-clIvWIt-
X-Proofpoint-ORIG-GUID: MiAoEPQLr6KTbE4DEMLKpW7-clIvWIt-
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab66891 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=F3v9Kh8TxewD1bH5_NUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_052658_473419_417ACB79 
X-CRM114-Status: GOOD (  13.68  )
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

Once ath10k reaches ATH10K_STATE_WEDGED, the device can no
longer recover and remains unusable until the driver is
reloaded.

Userspace daemons may continue issuing scan and connect
requests, which the driver can only reject individually.

Mark the radio as hardware-blocked through rfkill when
entering the WEDGED state so userspace stops retrying
operations against a device that can no longer operate.

Both WEDGED transitions already route through
ath10k_core_enter_wedged(), so adding the call there is
enough to cover them consistently.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 93dc7332c759..0a87a577b3f8 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2518,6 +2518,14 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
 
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


