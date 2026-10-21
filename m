Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A8260A2601
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WQ082vbu;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jr5WDmIT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ibS8lYm2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DedU1k6ASLyHSDk7lk7U07zZCarEr/9oVyaDy/PsXbY=; b=WQ082vbuCRslBX
	WUlO9QKRisKwvZNwEsF8hk49HwgrdgYBZ6BkY8j72vLNIS9T6scBzAlXdDfu1LtlVj2InEha/y/oo
	Ik4wDDSqqwwOChtGcAPOuoBWjFyLhUMmryWCXOrJwQJoIQw8Ru6L0iAosVIOBd1jR4CPAzUei2r9s
	QrJrrR8Hatso51LfvOTYLpPNXLHztl2d/2pVQ0QSXcYG08eRdL+pey8q1tUn+YmodbTGKGHbLylaP
	2ltZFL/fXLN2eEaX/VPV2RTZDp+Gtc3B7kLdVL7U2NJKqiWh8zUq3isd9laZ1yEGj7YIBmFfRAPsL
	Wc0rQR6UJyLwDtuzujSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKa-0000000BRWo-0zxd;
	Wed, 21 Oct 2026 09:09:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKY-0000000BRWD-1xsy
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 09:09:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8ouHr108922
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DedU1k6ASLyHSDk7lk7U07
	zZCarEr/9oVyaDy/PsXbY=; b=jr5WDmITz7eX75BcZm7ftA9DLDNW2i2yB1kxmA
	v8lSPdCXFKd0lxxwmdwj7oSMD0wd5fTwl4YDum3UgGKBEEtYoSFu0a7RAt6ko9Dq
	rqpdfYppK05jVSoAKqinCc7w45n7S4LvVNM80p7Ui80nqWlBAsiKeosNSNJCdpJT
	GpiZKzat2OlLkWthBNin9Rt3bmlysX1hVG6uCsB7YzDTj++y4qNJASxO22Cisoxv
	mrHe5OjqqMadDuRK7jyFJDWAtfWAeayHt8lWoedF2eWQpbzwC634VcrhTyCcyGD9
	WGNdxBqSn6oY1qMc424P+LM7qNR2oyfhkGthwQvH8U2Zh0xQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r28ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:09:53 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c467e19391so803840b6e.3
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573792; x=1793178592; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DedU1k6ASLyHSDk7lk7U07zZCarEr/9oVyaDy/PsXbY=;
        b=ibS8lYm2wu8MO0JK/wWUsptRc5GPI7+cq4+YgsaU7LLvcqIFAfdFNgWVOJCY5Bge5e
         nlxDkhVYKt2DpRnVWH4tge4Cwuf7IqrpleRGmtwVTAQoScK3b5ImghQqMe2wVVD+YP+p
         vzX/QdECc4tyECnhjh07cPDb/Mio+ftANFH2sZ6NZFvxFnYHpqPGgaOLB43gT7vnh/vc
         JZ00BQ3tm1cIPOAu4xkDNp3qgmyoYwMQ6iiXBtanR3Q05zULSgsXxyq1O8Wp53OhcRTx
         xUrl+H2WFdYEop7DWqcmI3ukxE5pcQPOeNcUM7sJOw7vCkZ0izfn5/PU6n31ZslaKPab
         pBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573792; x=1793178592;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DedU1k6ASLyHSDk7lk7U07zZCarEr/9oVyaDy/PsXbY=;
        b=OiWxmuqBIW7DqyehZI9BYmJxg3IXjdFqDxYJXrcjgGGqR2e+vbjUGc1B5Ph4/cgTLD
         RpBlTR+Z4wk3l4huoTXZ0Y3C9VNf0dnynuT5qEYmPjhlFVchT/2fRF4rAUbXLb85W2m+
         6bwMK5Bsr52910yQmMMvRXSNqrJxBA0NWM4uU6lUrB6yKIp6F3ssz1MTJ5kirOkRtJNQ
         zGK87VRguTxVhuZNH+QhCjZRPBrwRuz/dqQRNezMSdY+gsm6U2vu1ElK8lrTj+ql0kc+
         kak3D7r5vzSsShNJGvdjeeWXlvhF1/B+pz28HsdQelbTPNm8pEchiepR3lGp2i0qU60C
         Mung==
X-Forwarded-Encrypted: i=1; AKwUvBxKBn5/xgxHqswjzfLdAxKy0Cvt+a3c0/f2ynzGcALoVcBOGcPtRvfnmXYwQn8beCQuDux3kME=@lists.infradead.org
X-Gm-Message-State: AFq9FYKo4DG09xL3/Hbi5W4lRYePzaYxBSiZLgfB/gRzaoNRa43wubwS
	o46x9Dx3256iWg4ublGYQi5Qxo3Pznt9L2GwPDrk57YO5yptn7qzoS7wPmUbpWwfY6fUhLuQLpj
	Pwe2lI3FyTZFHbsQ8MOFzr016eEUKTPhHl2+2ymOtOkrvEZIRmKoQ/5zhr/z4y4/S
X-Gm-Gg: AYBFou0XiInseXU7/zpL3AVtbQHMuZRt2CUps2/5F+j7ugC7FiKMHXXX1gkdG3U48+Q
	Q/nAjxJfNv+/xufE+a9jMHRj/tLYYQ4wAVrOydSxXZqtD+olXbxf6EOZ4ym/GgOd66dj8xZar7J
	12oR7Za1S6r2LxSC9F+AyerDFL4+LOmIgfglYyPNNlBLIZEnqMI/81tP/XfOpvMdRnTLPeNp6cv
	lq3Qicjxa4+JQltnqY+vL4JZWOBaYkr/Vvqky1ae5DSyobf794eIWwW2FFHM6uHc+2taMFxjjD9
	XkcFIIiYyidJAFcQ/FN6zMjlvJwhIUYvK4AOnlYeEnAaq1VxTSS7oFgg6Nx+DNR3sWEOQjv/Mhd
	yvpoDOq6oqBVnFY2kiKKiMTjbGZRu54fWlLSEYalOBwX4PAFL6A==
X-Received: by 2002:a05:6808:4f51:b0:4d6:9222:99f7 with SMTP id 5614622812f47-553600880d2mr992243b6e.55.1792573792335;
        Wed, 21 Oct 2026 02:09:52 -0700 (PDT)
X-Received: by 2002:a05:6808:4f51:b0:4d6:9222:99f7 with SMTP id 5614622812f47-553600880d2mr992228b6e.55.1792573791906;
        Wed, 21 Oct 2026 02:09:51 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:09:51 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/8] wifi: ath10k: fix recovery and WEDGED
 failure handling
Date: Wed, 21 Oct 2026 02:09:28 -0700
Message-Id: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEiB2GoC/yWM0QqDMAwAf0XyvEDNpuJ+Zewh1mjjoI6mG4L47
 +u2x+O428EkqRhcqx2SvNV0jQXoVIEPHGdBHQsDOWprRw5r90AbdUWf2ALyuePh0vcdNROU6Jl
 k0u03vAHngFG2DPe/sdewiM/fHxzHB6syeWd8AAAA
X-Change-ID: 20261020-10k-sdio-crash-a37ab499725f
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=2814;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=y3stYXDvP4O7TcU01G6DJq426Gkq4u9WW481UMbgOaw=;
 b=BaCSn0O1b365N5SOMHIn6Bh6B658hO4GH0DBkzlgj8SoAdnaxWhNmkUt3TzqMmXjnJYdbR0XQ
 NOXKIzJPC3rBD7LxN1AIQN6cqQ0sa300M1BhZrll2iguJJB/iXPLJbq
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad88161 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=I84dKf3nx1YZGivhVUEA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: JRb9ytyVd5Eo_Ylam9mUeImtcpz7EXry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXzz6zJQqdTOI6
 228Y6oXhsNo3L4jPOPkIHINTfWUKHZGyCEnDD8Av2aNO+An75ccNM5m49DLlijgOIiDqoriVGuS
 P8WyKh2YuIDUVUmcN1gTwYAbGAooVVpFn7+bnW+vDjHtUGnLp3wm8ZygzQrDSl4eXQps/TintwT
 4kmVhhsq1V3/z5eaOZ7A1HhZemnq0nqykwlwjtDJ7H0d33+4HY+FKujABB8kLBv0hR/+4NkdtSw
 pOSFTTAW1yD18V6Ajgr6373HxL0ilvnVlVQEfFVxJXkwmuRNzUkhq3/EBs5zbSnZj6M2R1uc40k
 KA2VY8q0L532SxdBg5eENET7H3RyA/QzSQJ/VW1j2mtmf8rbuL3IBZWcTQQqSh5L0k0xZm0m6KM
 0NrGjF99rYWtau82w0iWBv8Ze/Y3K/ahTL2r84k2ZRG2OODKU1KSBw/S3C4Q2dKWze3Bymxhygb
 6yQRW8/3G3FyJDuGqXA==
X-Proofpoint-GUID: JRb9ytyVd5Eo_Ylam9mUeImtcpz7EXry
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXxS0BtYo6NGZ2
 RGSfOiidH7T+K4jQxCPQdxCVVmQ2BHqmLeHjj1uhFKodn1FbLOoeqbhcT6vUvxdXDJko+Z9FlSR
 n2LXtPyltEa5ltWY6D3nMUmZm2/X98Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_020954_628927_6C8DF891 
X-CRM114-Status: GOOD (  11.98  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Recovery failures can consume significant time before the
driver eventually gives up and enters ATH10K_STATE_WEDGED.

This series fixes several issues in the recovery and WEDGED
failure-handling paths, including recovery detection,
recovery time bounding, waiter release, and PCIe error
handling.

Several patches fix specific bugs and therefore carry Fixes
tags. The remaining patches address closely related issues in
the same recovery path because the fixes alone do not fully
resolve the reported failures.

Taken together, the series ensures that recovery either
succeeds or transitions to ATH10K_STATE_WEDGED within a
bounded amount of time, avoids unnecessary waits after
recovery has failed, and reduces the likelihood of watchdog
timeouts on affected platforms.

Google has reported this class of failures for an extended
period, with more than 4000 observed crashes over the last
month.

To: Kang Yang <kang.yang@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
v2:
- patch 3: also wake wow.wakeup_completed, peer_stats_info_complete and
  wmi.radar_confirm on WEDGED; reinit peer_delete_done before each
  peer delete command.
- patch 5: remove the early-return time_after() branch from the monitor;
  in ath10k_reconfig_complete(), cancel the monitor with
  cancel_delayed_work_sync() before clearing fail_cont_count and
  pending_recovery.
- add SDIO Test-on tag.

---
Kang Yang (8):
      wifi: ath10k: fix SDIO aux workqueue starvation in recovery detection
      wifi: ath10k: wake blocked waiters when entering WEDGED state
      wifi: ath10k: also wake remaining blocked waiters
      wifi: ath10k: bound recovery time before entering WEDGED
      wifi: ath10k: check the recovery deadline on its own timeline
      wifi: ath10k: hard-block the radio when entering WEDGED state
      wifi: ath10k: remove now-unused driver_recovery completion
      wifi: ath10k: trigger recovery on PCIe MMIO wake-up failures

 drivers/net/wireless/ath/ath10k/core.c | 129 +++++++++++++++++++++------------
 drivers/net/wireless/ath/ath10k/core.h |  13 +++-
 drivers/net/wireless/ath/ath10k/mac.c  |   9 ++-
 drivers/net/wireless/ath/ath10k/pci.c  |  27 +++++++
 drivers/net/wireless/ath/ath10k/snoc.c |   8 +-
 5 files changed, 130 insertions(+), 56 deletions(-)
---
base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
change-id: 20261020-10k-sdio-crash-a37ab499725f

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>


