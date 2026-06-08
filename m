Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A56CD8CAD
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 13:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pwY6r9ceSIbFZ3Z3ZupRAzVFykfNoBkJzFy9SkXL1FE=; b=pWz5oGyuuVS7uJ
	OcDnors79GYnk6mbZsAzq3T0oKgt7Mv/yABQ30NcpMe994SSaCxGc2OIWLNex0RooqB5z5knctB3U
	PFMcrZcssbzC3oCDeH2iP6DjW68apc3V8dqUMYpVnvzKDgq3Iojbqvhb39nnN82G4JlcIa8QR4gGj
	T6CduxlEyC1Q89wP9eje0/WO0Ll9Z+JItmVvAyJncuDyloos9NMrqhfWqMfPb492IYmpM1fL3iMmK
	sKgDsy/jyKix5teW87kgmJ5hJSwDqEBYmPSFbPQaYnzfNAyE8DAROQ2I7e8DJPpkUcODvw5mdjD17
	uT1/lesxqn60sUTSgDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZgG-00000003ZT7-281M;
	Mon, 08 Jun 2026 13:06:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZgD-00000003ZQG-15DC
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 13:06:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BBIpl3417567
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 13:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pwY6r9ceSIbFZ3Z3ZupRAz
	VFykfNoBkJzFy9SkXL1FE=; b=AnhVfedMGZ57F2W4ocK/VnoKmZPMLi10nB9YVg
	McZxqEFO++T6rMrBQ/W4DYyzWLqR//qXX/JD+Lki1u5BRAyhF1ddNCqbQCaCKnK4
	kHzS9MKAwLRLdXd5H3F20L7ttoZ9mD8LQDo76QWfW11MDSOJTCh/GxlFaNbP/W3v
	dd6QPfaKA1+yjpt/k2NUBxp4cX73+ITo4y/JwyHQBWQ2DI68g2asaO6kVINRJGyV
	qY11nYRhqGmGyZ+U6hUX98eHooF7oa2BVMBy/zvUTbUkX/RIuQRxd5RyLGGNIJ4J
	uLgUle5tPmpYM3iBR/Q5dsSlL8ePqqHUDpvG/3qIHPgP5A5w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptgrf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 13:06:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304e7fc90b1so4181925eec.1
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780923971; x=1781528771; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pwY6r9ceSIbFZ3Z3ZupRAzVFykfNoBkJzFy9SkXL1FE=;
        b=GkMpr91OERShOWCEdGlTeGO+LZDvKTgcH60GkYiTlvqS3n2lIQzqYt5cndt7J844oi
         VZhXqZ+N63yPyJMcK9BPTz2F2z2YYWt+zEHpAyKJbIaDuMFLfhfZV89cQp2ybTepKKAD
         HTnZuFxu5Zun+1ESMEs/tq495xbirqUdACj/mnw0cPx9SPrvnqmfZqY9Z4/GMWWmo8IX
         6oFhQRieNVUGFvZDZSNPqRgRle5EBxsxv9v/Vpv1Rlb2dc28HeaEkRdoL+RF7ASXk5XM
         w77y2pEzf3//4LW3/Tdgwwj8+UFaYARgkwgEXKHPRqY0FXJCFa/BGvyPWhiV8SetOgXH
         48Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780923971; x=1781528771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwY6r9ceSIbFZ3Z3ZupRAzVFykfNoBkJzFy9SkXL1FE=;
        b=gX91FF2zdOZzVT4TNpgx2PFVHRcg/6yepTdv3aKpXNBthmwkxnSWO08XN3wMcoz/Uh
         0wrGyX+DkpcOsAPd0Q8WcwGQ8OHcXGgd9QslGG2RZKnxjr0FIR7ozeeZScfhNABCI78I
         I9uQ5d6TFqZYMfEu7bv6rxcnhu91193U38l9zeV7w/5TUxwwB3AoZ7hTjLD+kmI93C37
         Kk25+AMY9vuLFJmf0hZ9TuUz4SR/xIErF4NWUVzVLsK3vCAun6lwzUrJ4tzD9C7oHWK0
         VsNRsexh1Nscdl6CRjpzb/TRne6CIAhPSvUYai8Tp6TSsDTIrIBHmTdgYWcO1mAdHQ95
         INgg==
X-Forwarded-Encrypted: i=1; AFNElJ8k6gB/yi0Af9dfGgddykC2yp2lBLDDn6f7OPkyZ/zB5AJjKT8y8Kc3PVE+Ab5he/10UIaDRWI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKLryhUZL01X+hGcHlGNFTn3AKndpCkx1cShMjzMjA6KORUce2
	BCrkVHMGDOGA7rM4BvNnGXOPHP4TMpUd1XO1PE+8Q03v9xVKzpJvdlciBelT1Pc2TYfMQ8mQriy
	Zec9lEDZ6a/PpRxuhtdwpsX7rPASXRGo4EsheJXtxlhgeS1c5NrbL59GLRiS4s215
X-Gm-Gg: Acq92OEBneq53IzzCttK2a7R+DBFOCBNGkGXmz9GxXcD89Au3aVLHVKkZcaMkVnu6Vm
	VFACcpzkiB2b96m5JBIHEK6glT/67xvxYEawNlUjNfqEXszLoHNqdeltRR9HaGtvjPyUTZLWVO+
	HDKS2XwP3JlM7wGuCC2lEBLAsuchem2Zso0L4GsumvUmPvaefa8dzN26lSNNV3IgcQ0CoFbC85h
	BIablIk4PdkSNsRCV3mLTRjEQ0T73zcHCRxT8lj/hBmVvydeQJAqRvspOs/1/s77KFB7BAevqjQ
	e7dwyzT47wRQRF0JedtBWFkni9EvDklnboB7nGsqW02qOjLDeLAtlqVxDMgafsLo6RAhWaT0Po+
	wt75nqUne9BeuqM8k8XRYg1q6VG8Qqwh30mVNH1dzc6ZQ6Sha57hwT6TfXmjwm82HmcekQmGMWg
	vT5A+B6uD92mY=
X-Received: by 2002:a05:7300:ec15:b0:304:d8e2:3c4d with SMTP id 5a478bee46e88-3077b2d9d1dmr7722204eec.25.1780923971104;
        Mon, 08 Jun 2026 06:06:11 -0700 (PDT)
X-Received: by 2002:a05:7300:ec15:b0:304:d8e2:3c4d with SMTP id 5a478bee46e88-3077b2d9d1dmr7722184eec.25.1780923970533;
        Mon, 08 Jun 2026 06:06:10 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm15666701eec.10.2026.06.08.06.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:06:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath: Update copyrights
Date: Mon, 08 Jun 2026 06:06:05 -0700
Message-Id: <20260608-ath12k-copyright-v1-0-e1a71f92d447@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD2+JmoC/2WNwQ6CMBBEf4Xs2ZJtESKe/A/DoZaFbhSKbSUQw
 r/bEG9eJpnMzJsNAnmmANdsA08zB3ZjMvKUgbF67ElwmzwoVBVWeBY6Wqmewrhp9dzbKIpWlgp
 LrC+IkGaTp46XA3mH1BYjLRGalFgO0fn1+Jrlkf+w5T92lgJFJ81Dm7prC6puLoT8/dEv44YhT
 wLNvu9f3gVrdMEAAAA=
X-Change-ID: 20260604-ath12k-copyright-3d1520509800
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: CZRZ4-L17alwF4sgl5CYi4iIh31NwfK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNCBTYWx0ZWRfX0pmLCiWcYUHf
 GP5Tz40L9UGOvkGN73/snYdBpvindrr53Rz6uzaskKuu4wcCglwlB7igPat0M4ubyqAzpQdEGTi
 sKUeW4o3u+sgkQLztalns0H1J5YItpvPSXt7/KdWHcrdhmD3S/Xu1hGFfK6NMGQKRIE8oWPGoQY
 UER1FUhag0nHlXUjAOSjmX/lNBFvvDXORUiLuPqbT8aqqWxLUNfmKy3XJljDetZPaD+WDOlKve9
 CzKFaoSrKz6XCWl5JN0Q36xZm92hEFgGnUCJPTrKcQ4sG/NWvh2sc4n1KEDamgQcGEGVomf1Mjp
 Gl6PfH7eydtcYmBvBn9l8jpOhB25JZgwF2wzNT47gySxUzIg2PdKV09raTNgH2yQcBv6sPb9UUK
 72gTk47AdK8G+L2dzAMdyiZ5w494iYVmXyjPb6OKvnBVYfhnXr7Ua5jeUbJTs+5AwOy7MIeHhen
 rot0qaS4SCxH19BuMGQ==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26be44 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=dk-9R-U10jJP_KFx_BcA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: CZRZ4-L17alwF4sgl5CYi4iIh31NwfK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_060613_409957_1FDCF034 
X-CRM114-Status: UNSURE (   8.52  )
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

Update the Qualcomm copyrights in the ath wireless drivers that were
substantially contributed by Qualcomm using the current guidance from
the legal team.

---
Jeff Johnson (3):
      wifi: ath12k: Update Qualcomm copyrights
      wifi: ath11k: Update Qualcomm copyrights
      wifi: ath10k: Update Qualcomm copyrights

 drivers/net/wireless/ath/ath10k/bmi.c               | 1 -
 drivers/net/wireless/ath/ath10k/ce.c                | 1 -
 drivers/net/wireless/ath/ath10k/coredump.c          | 1 -
 drivers/net/wireless/ath/ath10k/coredump.h          | 2 +-
 drivers/net/wireless/ath/ath10k/debug.c             | 1 -
 drivers/net/wireless/ath/ath10k/debugfs_sta.c       | 1 -
 drivers/net/wireless/ath/ath10k/htc.c               | 1 -
 drivers/net/wireless/ath/ath10k/htt.c               | 2 +-
 drivers/net/wireless/ath/ath10k/htt.h               | 2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c            | 1 -
 drivers/net/wireless/ath/ath10k/htt_tx.c            | 1 -
 drivers/net/wireless/ath/ath10k/hw.c                | 2 +-
 drivers/net/wireless/ath/ath10k/hw.h                | 2 +-
 drivers/net/wireless/ath/ath10k/pci.c               | 1 -
 drivers/net/wireless/ath/ath10k/pci.h               | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c      | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h      | 2 +-
 drivers/net/wireless/ath/ath10k/rx_desc.h           | 2 +-
 drivers/net/wireless/ath/ath10k/sdio.c              | 2 +-
 drivers/net/wireless/ath/ath10k/thermal.c           | 2 +-
 drivers/net/wireless/ath/ath10k/usb.h               | 2 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h           | 2 +-
 drivers/net/wireless/ath/ath10k/wow.c               | 2 +-
 drivers/net/wireless/ath/ath11k/ahb.c               | 2 +-
 drivers/net/wireless/ath/ath11k/ahb.h               | 2 +-
 drivers/net/wireless/ath/ath11k/ce.c                | 1 -
 drivers/net/wireless/ath/ath11k/ce.h                | 2 +-
 drivers/net/wireless/ath/ath11k/coredump.c          | 1 -
 drivers/net/wireless/ath/ath11k/coredump.h          | 2 +-
 drivers/net/wireless/ath/ath11k/debug.c             | 1 -
 drivers/net/wireless/ath/ath11k/debugfs.c           | 1 -
 drivers/net/wireless/ath/ath11k/debugfs.h           | 2 +-
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c | 1 -
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h | 2 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.h       | 2 +-
 drivers/net/wireless/ath/ath11k/dp.c                | 1 -
 drivers/net/wireless/ath/ath11k/dp.h                | 2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.h             | 2 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c             | 1 -
 drivers/net/wireless/ath/ath11k/dp_tx.h             | 2 +-
 drivers/net/wireless/ath/ath11k/fw.c                | 1 -
 drivers/net/wireless/ath/ath11k/fw.h                | 2 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h          | 2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c            | 2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.h            | 2 +-
 drivers/net/wireless/ath/ath11k/hal_tx.c            | 2 +-
 drivers/net/wireless/ath/ath11k/hal_tx.h            | 2 +-
 drivers/net/wireless/ath/ath11k/hif.h               | 2 +-
 drivers/net/wireless/ath/ath11k/htc.c               | 2 +-
 drivers/net/wireless/ath/ath11k/htc.h               | 2 +-
 drivers/net/wireless/ath/ath11k/hw.c                | 2 +-
 drivers/net/wireless/ath/ath11k/mac.h               | 2 +-
 drivers/net/wireless/ath/ath11k/mhi.h               | 2 +-
 drivers/net/wireless/ath/ath11k/p2p.c               | 2 +-
 drivers/net/wireless/ath/ath11k/p2p.h               | 2 +-
 drivers/net/wireless/ath/ath11k/pcic.c              | 1 -
 drivers/net/wireless/ath/ath11k/pcic.h              | 2 +-
 drivers/net/wireless/ath/ath11k/peer.c              | 2 +-
 drivers/net/wireless/ath/ath11k/peer.h              | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.h               | 2 +-
 drivers/net/wireless/ath/ath11k/reg.h               | 2 +-
 drivers/net/wireless/ath/ath11k/rx_desc.h           | 2 +-
 drivers/net/wireless/ath/ath11k/spectral.c          | 1 -
 drivers/net/wireless/ath/ath11k/spectral.h          | 2 +-
 drivers/net/wireless/ath/ath11k/testmode.c          | 2 +-
 drivers/net/wireless/ath/ath11k/testmode.h          | 2 +-
 drivers/net/wireless/ath/ath11k/thermal.c           | 2 +-
 drivers/net/wireless/ath/ath11k/thermal.h           | 2 +-
 drivers/net/wireless/ath/ath11k/trace.h             | 2 +-
 drivers/net/wireless/ath/ath11k/wow.c               | 2 +-
 drivers/net/wireless/ath/ath11k/wow.h               | 2 +-
 drivers/net/wireless/ath/ath12k/acpi.c              | 2 +-
 drivers/net/wireless/ath/ath12k/acpi.h              | 2 +-
 drivers/net/wireless/ath/ath12k/coredump.c          | 2 +-
 drivers/net/wireless/ath/ath12k/coredump.h          | 2 +-
 drivers/net/wireless/ath/ath12k/dbring.h            | 2 +-
 drivers/net/wireless/ath/ath12k/debug.h             | 2 +-
 drivers/net/wireless/ath/ath12k/debugfs.h           | 2 +-
 drivers/net/wireless/ath/ath12k/debugfs_sta.h       | 2 +-
 drivers/net/wireless/ath/ath12k/hif.h               | 2 +-
 drivers/net/wireless/ath/ath12k/p2p.c               | 1 -
 drivers/net/wireless/ath/ath12k/p2p.h               | 2 +-
 drivers/net/wireless/ath/ath12k/reg.c               | 2 +-
 drivers/net/wireless/ath/ath12k/reg.h               | 2 +-
 drivers/net/wireless/ath/ath12k/testmode.h          | 2 +-
 drivers/net/wireless/ath/ath12k/trace.c             | 2 +-
 drivers/net/wireless/ath/ath12k/trace.h             | 2 +-
 drivers/net/wireless/ath/ath12k/wow.h               | 2 +-
 88 files changed, 68 insertions(+), 88 deletions(-)
---
base-commit: e1c8fcfd37f76b46a581b794e27765258c9a537d
change-id: 20260604-ath12k-copyright-3d1520509800


