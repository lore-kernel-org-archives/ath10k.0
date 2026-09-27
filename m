Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D897C98338
	for <ath10k@archiver.kernel.org>; Sun, 27 Sep 2026 19:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7pu/3ON0/cCBPt0BqikF7H7Rl4I/09E3LOdHlSpQShI=; b=nG8B5fnPx2Wv9FM230wIS9tpUy
	51b84q4N34MfLEPqRtR6QLgHybnYwMb3SvDoNYyKOBu50nveDobMQLq541U3yxJ2Oa6himGQY/gCo
	ia/a2HnKeuXdRSQ6f7hEnb/o2NlaXONnVJ6lottC7L5BiU/flqPih++pMmY4QUFPXJDtMvPRSea21
	/jDDMzLrCLy9E4evACpczJ3oAJF9K2CamGXAuN9blRE3PvIHNcrpkUKmudsPvci8KBvmddRRM6mt+
	p4vgyyk7UFAEYFot0+Bk3UbchvePSI1kAzdH/JvweQ32PtQKn9vo4In0wYqEM21Ut5JMPVzZElSev
	Tq1Z7kRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAuA6-0000000GjjS-1F4p;
	Sun, 27 Sep 2026 19:03:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAuA3-0000000GjiP-3Bn8
	for ath10k@lists.infradead.org;
	Sun, 27 Sep 2026 19:03:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RBvwqt2763816
	for <ath10k@lists.infradead.org>; Sun, 27 Sep 2026 19:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7pu/3ON0/cCBPt0BqikF7H
	7Rl4I/09E3LOdHlSpQShI=; b=BBIG8lj8P7KOqukoAifuhSgO0SrwvXsZTXTtFu
	bL6pF3MuN+YE4cg7JsTjYGI/dRylcaokGGN6AMeGXoOIEdzmEEN6LFoMwalX5+jq
	6O3SAJEvkmdBSkuseMpX0uNcOAVWgZHlHjoUVl4n37DGXvSJ3iYIvsF+cgrv8943
	m4pBe8cp1uU1nJCAkzGB3UrF7Oo/BCzEd3yOtVDe3oYeHUhwsidZTngesGCBcMWQ
	u7UXUIFxrQ3y765zIwED7LZFaBOdM4tcMf1+japiFF44l6wAUUrr0t8dL/XLSVGs
	84fjC2UKTMvuEI3EBU7GfhskkDM7d9zBJTBdQF2Cy9/iBPAA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx64uupv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sun, 27 Sep 2026 19:03:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so5071746eec.1
        for <ath10k@lists.infradead.org>; Sun, 27 Sep 2026 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790535821; x=1791140621; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7pu/3ON0/cCBPt0BqikF7H7Rl4I/09E3LOdHlSpQShI=;
        b=C7UBgAm/5VRTznSjXuoVECQO5kgvMjpcUeB4Zr98GLg2YfA4DU0rj80SqJhXVWWlWz
         LIRKH/FWlcL2UTvdoy/DaNl6SCZOivrOhf4lybx9uaTq0eqxS3ZL8b66W+xaZq/Vgt0o
         14d0ybkv7HsZBUpvvSIFzV4/blq9RHyjov+7NVdGUX5mq6eVzpU+qOQp+7kKaVh9yCQ7
         FE4UcSjOEs3pgzc2vTAoc2aaAg6vv6kmR/Pau1F4+BO8h0xneu+VFy4C1cXkFWUYvlgc
         ohTWojOFKu77ufoY2SPpXRjmLVrMcyJJX/PklNcjBTGWTUz0lg0P1q+JalQuvENAd8d0
         OsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535821; x=1791140621;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7pu/3ON0/cCBPt0BqikF7H7Rl4I/09E3LOdHlSpQShI=;
        b=riJENg5t5yWrwpaWi8Ps0EpkTT0JJdFhXvux9UsbeqLA+YWZp1aftUDfk68rKOTq1V
         yMIqjps66rL0tnf+ZIqaZD9aP7lVHkBDuiYFGy3lIBzt2apckzEZgo4vE4TjqFQuVdfD
         QdE/GqaFbKDyIb+sYigqqfRnec/OL3tIldEambKKsXWhgMlPShVQvkJIRG19QXAIutab
         CpLvjShTaZjZfg+sHpqetzMT1EkUEDnWNRnYAWSyO3O6qG8du1pbsDSIX0UhzSmm1tgx
         qKkr1g3X6+t1hMyakB2mNEJ1XYQGrdFN5sEr0ONpIEnj4J+xdv1Q9TpxPgUCBPFh5+sB
         rKrg==
X-Gm-Message-State: AFuF++krQXgmPYBLvc86uQ8KyWl9wVpP/NCqhK5qvSiWY0typy3/4Y9Z
	rrsHQyiSrjJxFmkE04zUhtMpqD6+iA+DUZ9biWxBJJzw+PyQnVKlMLSQm9KcJt2BsbkhNhJXmc/
	lD5muTE0SCtzCwBq0OFtpaf/WYk33AaX6ieAxfNhJQW8M0Te50otVCjHoaU6H9y3o
X-Gm-Gg: AYBFou3mrrS9gCcPhDsDU5ecfqsHgp/NyOAf0D78xxzWcy/Cb2mbtVn2SHHrYkzTFj7
	OZfcLGJsz+BVU+EgqzKSHv9WH67BLf9fHmvfWFqobwvipXLbjrk6pQqHdEf9AUNBIkmvDaIH1mB
	HbFetZ1Wmn1TJhXRT8ZEz66a9Y0dxBtTRqK8MpMxvNxRwMpL/zrRBGOQdNez+0c77Xep9C5G0+Q
	w0K/lWg3byzN4poV37WQBPO6WTZ3/LUyUMg+V01S/PD59vqQ3m5n/KlrEAxkgmNPukRwNoMNtNt
	c9yWDTHVBpxKsv8YVEqnbk2bKiY0vO5vw60uxjbeUe50GN1rFIM0338xp41y73F84XSzCrV4EJN
	yX5GstftHCA+kd8He9s15G9Kbq4AMvg2jP/U=
X-Received: by 2002:a05:7023:a5c:20b0:144:c123:4036 with SMTP id a92af1059eb24-146d077b67dmr6179671c88.35.1790535821278;
        Sun, 27 Sep 2026 12:03:41 -0700 (PDT)
X-Received: by 2002:a05:7023:a5c:20b0:144:c123:4036 with SMTP id a92af1059eb24-146d077b67dmr6179619c88.35.1790535819659;
        Sun, 27 Sep 2026 12:03:39 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm23281813c88.12.2026.09.27.12.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 12:03:39 -0700 (PDT)
Message-ID: <ac4beb38-a504-4e0a-8766-ed6b854b66a8@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 12:03:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260927
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA3NSBTYWx0ZWRfX/cIyq4UVefet
 E2J/4z67tHXmGgQSC4kF6uwCWwnCZOf7ll/aT2d+tXIi0yTk5rffPsX/AxTLuAODSHRObNp9uwa
 1Dse7m/EU+foaVoUW0O1lywXndfaFlQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA3NSBTYWx0ZWRfX7aGf7vY0ewDr
 D5f1I8cWtF7rEvvVYAqxitb7OoSSDJEXze8eVKzMlXsdxHxlJYkV2199dMMptg5Z0MRewl1BdEg
 ylnKp2DBpyMLFFOQnGUugC6mNJgoaR7YPo9+mfNFFVzxGWkjnH26Bn0GDNICQ0mCy2VCYIIf+eV
 CPbTr1g9BMnX+h9Yitiqv4+2B7qecZISjbISzkCD+FpFKCQ/ypVD8CsmtHsAAFMYIglyJzY3Rpz
 1PNXr8eRobERg3ltsruHVejsXbiiU0h39CWqcmyETrx0V5fKAHYOh7lTPwRu/QviNXKrbePk96H
 4xV7XBgDcrjPtcdmWbfkelNdzL6PKcibWBHogf9zEWHFm9diGuQR1dx4+k8b1RS9JOGQv1xwUjE
 OSaf9OSgFmw/2B2SwKkJWvyoP8osZ1rRxuJwTn0O0rrVzAPpHxnWUEFKIW2Hl+sqv24ONxfTNow
 PKUm7wuR/V4Cq9O8sxA==
X-Proofpoint-ORIG-GUID: qLW5dKGrk8oC131tKKG4_oTiyYSyucUO
X-Authority-Analysis: v=2.4 cv=E6xYNqdl c=1 sm=1 tr=0 ts=6ab9688e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=FX_wVIGubitqPvrcck0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: qLW5dKGrk8oC131tKKG4_oTiyYSyucUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_120343_921863_82C95EB0 
X-CRM114-Status: GOOD (  10.38  )
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

The following changes since commit 10cfa109c880092df32e396647b4afdca9be8350:

  Merge tag 'wireless-next-2026-09-21' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next (2026-09-21 18:17:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260927

for you to fetch changes up to 753baa59527f8e606c49eac25692b8b08918a3a9:

  dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells (2026-09-25 15:20:46 -0700)

----------------------------------------------------------------
ath.git patches for v7.4 (PR #2)

For ath10k, document NVMEM device tree bindings.

For ath11k, fix an error path resource leak.

For ath12k, fix monitor RX buffer lifecycle issues, properly align QMI
memory to meet firmware requirements, extend datapath device stats
coverage, and a few other cleanups.

----------------------------------------------------------------
Aaradhana Sahu (7):
      wifi: ath12k: move dp_profile_params to dp.h
      wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
      wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
      wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
      wifi: ath12k: convert ATH12K_NUM_POOL_TX_DESC to inline helper
      wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
      wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper

Aniruddha Mishra (2):
      wifi: ath12k: add WBM RX error drop statistics
      wifi: ath12k: add WBM SW desc fallback counter

Baochen Qiang (3):
      wifi: ath12k: use per-device max QMI chunk size
      wifi: ath12k: clear chunk paddr and size in ath12k_qmi_free_target_mem_chunk()
      wifi: ath12k: align QMI target memory to 64 KB

Hariharan Ramanathan (4):
      wifi: ath12k: rename wbm_status to htt_status in HTT TX completion
      wifi: ath12k: add TCL ring TX buffer allocation failure counter
      wifi: ath12k: add device DP stats reset support via debugfs
      wifi: ath12k: track per-ring RX sent-to-stack count

Jeff Johnson (1):
      wifi: ath11k: fix reg_info_store leak in ath11k_service_ready_ext_event()

Kang Yang (6):
      wifi: ath12k: fix skb leak on paddr mismatch in wifi7 mon RX pop
      wifi: ath12k: free pending MSDUs on duplicate mon link descriptor
      wifi: ath12k: fix stale tail_msdu pointer returned from mpdu_pop
      wifi: ath12k: place dp_mon_mpdu on stack in mon dst reap loop
      wifi: ath12k: fix skb leak on monitor PPDU ID wraparound
      wifi: ath12k: avoid double DMA unmap of held monitor RX buffers

Loic Poulain (1):
      dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells

Miaoqing Pan (1):
      wifi: ath12k: remove unused ath12k_dp_rx_h_find_link_peer()

Pardeep Kaur (2):
      wifi: ath12k: fix out-of-bounds access on TX stats arrays
      wifi: ath12k: fix 1-based ring index in REO Rx Received debugfs output

 .../bindings/net/wireless/qcom,ath10k.yaml         |  16 +++
 drivers/net/wireless/ath/ath11k/wmi.c              |   9 ++
 drivers/net/wireless/ath/ath12k/core.h             |   9 --
 drivers/net/wireless/ath/ath12k/debugfs.c          |  78 +++++++++++++-
 drivers/net/wireless/ath/ath12k/dp.c               |  90 +++++++++-------
 drivers/net/wireless/ath/ath12k/dp.h               | 114 +++++++++++++++------
 drivers/net/wireless/ath/ath12k/dp_mon.c           |  15 ++-
 drivers/net/wireless/ath/ath12k/dp_mon.h           |   2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |  33 ++----
 drivers/net/wireless/ath/ath12k/dp_rx.h            |   3 -
 drivers/net/wireless/ath/ath12k/dp_stats.h         |  25 +++++
 drivers/net/wireless/ath/ath12k/hw.h               |   1 +
 drivers/net/wireless/ath/ath12k/mac.c              |   5 +-
 drivers/net/wireless/ath/ath12k/qmi.c              | 102 +++++++++++++-----
 drivers/net/wireless/ath/ath12k/qmi.h              |   4 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c     |  24 ++---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      |  52 ++++++++--
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c      |  39 ++++---
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c     |   5 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |   7 ++
 20 files changed, 451 insertions(+), 182 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_stats.h

