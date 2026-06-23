Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2665CCD4F26
	for <ath10k@archiver.kernel.org>; Tue, 23 Jun 2026 06:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uWG8ZbRoFu7VygoYFMNL7hhT7TFlyehiv+P+4V+rcck=; b=lUyWLqOAz2WpBU8WpV0YHNgOlM
	uijkDSQmN2iO78thkin5A6cIkkWkuNEPii5ktp8Yb9lHv4Qy9ZVo1ufxw/cq+C70zcvKoKwH1qWkN
	DPKAit6NvCwDn58XvCDyiyCqoRoEeXC+uQZ41AuZctawDf/AKOaeOP2o1e9SXOoMACmTylmnYtG27
	eFXRLWjIDKAv+EvNDR/qL02Ne6USCfmzf83998OLt3PO3f26kSrHpx/Mtanq0B4xxJPDz2wev1++j
	Bk8MgZAj3kdM4zfVI5sil1gpWUlCr3yiA0bi+2wCeMpNrTLx0ZmlL8JMISt1IOs9LoRUQ7qOTST8m
	5uQ6rsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wburs-00000005mVd-1YIV;
	Tue, 23 Jun 2026 06:44:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wburp-00000005mV5-2kHD
	for ath10k@lists.infradead.org;
	Tue, 23 Jun 2026 06:44:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6ckhx3564061
	for <ath10k@lists.infradead.org>; Tue, 23 Jun 2026 06:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uWG8ZbRoFu7VygoYFMNL7hhT7TFlyehiv+P
	+4V+rcck=; b=VcOlb0m+4HNUn9JrnDbMZY0DH7pABHAWGzOpsxnfnNr6HQ66g1r
	s2HQ1Rm+KfB0WUqJRUAxHC/RwQDqHjEEEaDutLxv2BCLnR9GihG2dB1zlymxV8yB
	EZVV6DCz68SFzLaWtfx7oVoQ/UH7cV10OCnX8V3skMaiu5//XCsYnbjXlgU2G8dY
	osdGDWJAJ1/Px5fxzvuhw0AGaEfD4Ea4ksdF8hTiVgX9QjNHkB5FYG63MVFrjFSH
	GMjujNZhRv975O+kKB642V77Q9VHbCySqfk/8umTdh4CqGd9CvGjuwZ/WexuouNf
	d6ioxYZfBVX9P/F9STqrrxmbbbCKDopzKeA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n43cgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 23 Jun 2026 06:44:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c725d3e886so69971165ad.0
        for <ath10k@lists.infradead.org>; Mon, 22 Jun 2026 23:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782197054; x=1782801854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uWG8ZbRoFu7VygoYFMNL7hhT7TFlyehiv+P+4V+rcck=;
        b=daIU3BuEIt2Rg+e8mczekT3p4AvOcAqiuADxXLGrM0fDEwabWiQstmBNEI9BriqNdT
         jukQSNO3YpvB3f1eLjXUUZIfirjNnJLB5FrvlIDufIXgRBlsE46qwWBLXATyDFDkUe19
         /CGfOIKo8ncMGi9AHDYvREd+PL9It0w+0TY9tT35UUpw/tWR0HflQzEZM+GhEdqv49Wz
         b9GtjWiMoSuBghlkdvTsGcHnI/aHO3sJ3SGb4jOUQEQzG+bCToCshRPZjWYGwOY92gBk
         CiX2tK/YXwwIFVWUbkx+p80jPDKNtCTqgv34KK6XzH24vZ8ZnEuib8VlyWidgklrhacO
         7O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782197054; x=1782801854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWG8ZbRoFu7VygoYFMNL7hhT7TFlyehiv+P+4V+rcck=;
        b=p1k0/A5ioG9rpt8KVwJTxPUCY3VRLdmsd9bd9ezc8UbhPYy1wAZ2XK3r5QeReqxvNe
         7yEG7tS3SlLW2GFzp9ut5+yUZzs4CKSoXh3ZlL3J/bWY0G1o7I4q+AAEneKuXintyYcH
         Mnw0Kiwk0x7yDhnl3TNFvv8ZVS3VEyNLxoc5mP49JVGUe6cJ/XFtmhUBef/lgj5mePQw
         JsrPC8kRim6XxvFw32/y7UW+FBdkyO14BDvkw/a6o1cuOIQxU38KOKTOW1nPXJTyuP1e
         CroQ0MlnnyWexjG/Oi2MgFJTLvHHQvQAW+zvupK1rDHBHQLPOaExV6DOQbhX23qW429u
         4j9w==
X-Gm-Message-State: AOJu0Yz6ku0St7ljp9nPdQPP1fE9awm5qcDv4jYhP6zRoBMea8IjwZIE
	1S9OYqOI4qTV2FU8L+SUti00Y0iMxaMvlS0boDc+LWOXFjzKU//TykE6FA7Jexi3A4XXBpfsVyL
	41vMcJTCHulPxlxTSPkBC2Xb+0zzWjSIY7YcMbA2dr/rT9Mkp2LksUIHMPvEUI3hJnDeNgWA4
X-Gm-Gg: AfdE7clGFQoQ/UTAhw9kQLCx6XVzA82qidA3uAoysQqP6HvDtrtiT9oQNRYKVtfRkbd
	kWVsEgrbc8tJRCSUdDulkBRT8DwC/OD94U4Uu5iqdUdVVRLyEBOmGrCxazrrNZsyqFPROmPvCco
	/Ghv1V3ZbWmMhS/J/dg0GdN8nLyzlIB5gzfdY8zffDPWL1A62N0bthR0/knTzAhQPMjlP4tfqIT
	sEdqBstk7O3Ljo3IY7iln9XQTP9OaeCCezRpkh/AZTftovm4YjvG1k5iGENGA+x97RvwAyfVoN+
	arbsh2yVMtBG9kVnxgehA3mXsKkGQGZe5KSWBP9NURwW4hI9SEMlX89aUnOdWX05+qU9bFhiWBV
	Zu/mUPC1JP/cjdbOtktaXeuOs8CkMCPj+7slJd/69YPlJL/ibx5pcGQ==
X-Received: by 2002:a17:903:4410:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2c7c9a06132mr12864655ad.24.1782197054147;
        Mon, 22 Jun 2026 23:44:14 -0700 (PDT)
X-Received: by 2002:a17:903:4410:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2c7c9a06132mr12864065ad.24.1782197053572;
        Mon, 22 Jun 2026 23:44:13 -0700 (PDT)
Received: from hu-mpubbise-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af220sm94346315ad.16.2026.06.22.23.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 23:44:12 -0700 (PDT)
From: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath10k: fix skb leak on incomplete msdu during rx pop
Date: Tue, 23 Jun 2026 12:13:55 +0530
Message-Id: <20260623064355.1876743-1-manikanta.pubbisetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1MSBTYWx0ZWRfX2U1wHp/ThMy1
 hjsvw3/MFbllaXbeI+O2069jY1AjzqQFhITrFNIYL4XSzd5B0JQC+vQiOx1jxIEB2QJNRm41m8R
 OAqoxMOmZz0dhYX1v/EfE+nXx4Te9nA=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a2b3f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-FVftbl86dZ79iKRIzUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: FKRZHwnO-bjY56cTiGMY02EN4LxSpBOB
X-Proofpoint-GUID: FKRZHwnO-bjY56cTiGMY02EN4LxSpBOB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1MSBTYWx0ZWRfX3Qk+f9cfx+P5
 y+uZ5hvvEDhivU0eArb0Hrsnf10oR91IqJ2I3YKxEEvswfsWre2F7bwl/DYbDx1awrqIEyDgNmJ
 j4HiCB+2imyB5pBLP8VLzEu9lMxCkDyOfV+IqfIIE7lWGrA8ZpPYzVpk/A2vMRLrq1vbD8yUZ5/
 hSfACfVMSJezcvDkYXIVzAXI148wV8mX3r0VeEUwXHDaL6yFqiOYuPqkDuYxSNcy4S2y2tnFOxh
 Eck0B/bj06cjshHn9wAlp8TnmhnvRfUY6SQv/SAbic9yp3t66ZmFi0wtix/hf+WVhT/YMBgCIqi
 Nvxo/Dhkwxhpe0ZBoamGQkg0rUIZYyxbIBNqkjEPnQWUczI9R+WARhnZupqs6qVBzPERjVyaXXA
 rnzhEFPcvTN2L1OUnXxavzGu81bjuTFTDaGrobuEF5n3ybxLtKWPSKqb1E07UFBgozkYd748d/E
 D2kk4iHy++0IVnZKwFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_234417_840536_389A38B0 
X-CRM114-Status: GOOD (  10.29  )
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

When ath10k_htt_rx_pop_paddr32_list() or
ath10k_htt_rx_pop_paddr64_list() encounters an incomplete frame
(RX_ATTENTION_FLAGS_MSDU_DONE not set), it returns -EIO without
purging the skb list built up so far, leaking any skbs already
queued in the list.

Other early-exit paths within these same functions already call
__skb_queue_purge() before returning an error. Add it before the
-EIO return as well to be consistent and prevent the leak.

Tested-on: WCN3990 hw1.0 WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1

Fixes: c545070e404b ("ath10k: implement rx reorder support")
Fixes: 3b0b55b19d1d ("ath10k: Add support for 64 bit HTT in-order indication msg")
Signed-off-by: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index faac359aa9ac..b3f1b7186721 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -706,6 +706,7 @@ static int ath10k_htt_rx_pop_paddr32_list(struct ath10k_htt *htt,
 			if (!(__le32_to_cpu(rxd_attention->flags) &
 			      RX_ATTENTION_FLAGS_MSDU_DONE)) {
 				ath10k_warn(htt->ar, "tried to pop an incomplete frame, oops!\n");
+				__skb_queue_purge(list);
 				return -EIO;
 			}
 		}
@@ -770,6 +771,7 @@ static int ath10k_htt_rx_pop_paddr64_list(struct ath10k_htt *htt,
 			if (!(__le32_to_cpu(rxd_attention->flags) &
 			      RX_ATTENTION_FLAGS_MSDU_DONE)) {
 				ath10k_warn(htt->ar, "tried to pop an incomplete frame, oops!\n");
+				__skb_queue_purge(list);
 				return -EIO;
 			}
 		}

base-commit: 972c4dd19cb92e03d75b66c426cfade07582a1ba
-- 
2.34.1


