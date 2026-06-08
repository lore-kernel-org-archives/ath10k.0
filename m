Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC3FCD8CA4
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fEqmHXkDhVrdf0VTdQTKHLTZEqeQsjBP5qTz2xfevEQ=; b=nOA6+K23lF84Zv
	7o0Qu75LWoMIoqy4egpdkquCtV4FNGeqlkIvlkjDY8CS9fDqev5W4o+9ytHPyfoYPIcbaMMUvxxCl
	h+5vNLLYvAKh+AxhemPI9NZi8iO63wNHpIaDTW1eAtpdKrQz+bLZJcWxLUpCY5vmSQ9cB8CWCT93Z
	HXQzTb8jDOLQPqMW3O7XrjVIfsKbXCJUQB0s6pXLzKJlXLP9soqS2m3fdLZ9I5ZlOlz7ORGfn7Mor
	W2PqKKyjl+2LvT4UepwsHa6DFcm7ngP0f3qlec58+vhVS5JExYYBt/i8Yt+malQDkA/ot3zU2mYJd
	Y+4gfT3rXmXARFCsBbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvQ-00000003bln-1Ss2;
	Mon, 08 Jun 2026 13:21:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvN-00000003bjv-1e3i
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 13:21:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9TmK2993062
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 13:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fEqmHXkDhVrdf0VTdQTKHL
	TZEqeQsjBP5qTz2xfevEQ=; b=aSlj52Nljtsf3Ff+u/32sjZxks7a4hYM+fP6x1
	3HEKdC49WzPVEwwgKyPWYwfiq1LTNlM3RPA1bgXZOcDyf0I4L82YrNMc/DPOgry1
	pRj6eDyONFEIgh0Amw5yVUpN+7tYzcuNCCSxZoWhOZ4/cS6NAaBirkCuwHhPt3mz
	nIm2LyXFz54ubNJW+F3h4V1or/6rRyZBRdsW0XwpaWSWDATO+EorIj3AA7tOV0Xb
	qKJ9Ya0kEQlI3JDzThzc9bZIQMDHhKjYhLw2GZcjkBcsCX4A2DwsKbGsQP7PrlUu
	QOntLc+f2oXR7k14vZdmAv7XdyEQNCpaQsAb/f2C5Ksm5gxQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna8u0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 13:21:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30761ab3483so9520132eec.0
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924912; x=1781529712; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fEqmHXkDhVrdf0VTdQTKHLTZEqeQsjBP5qTz2xfevEQ=;
        b=KldLRJM3PaLxZedMj09qJ/G/jdvEInFGDw+/DXxoaLNfXY5mujeDX0XnUaIFrYlUIy
         G7Wx/o8pvtddqbAl2V7MkBneM58hiVpCGdxBQ22+Cy741+usR9gbh/wdnkC2uUYjt0S4
         y1yrlxbX6RDe2npoASScG4uPSzru6GyQayNXlhMCkAFJgG0Y56p5dMepN1bIvQinbypP
         j63P4UyN0QeIBrravfj2qhfTyjPQqDBbJDW264WC1J0y89WFmV/AwuBt+MkN7uaNlW0m
         3maT7FAFKlxtO37wUhWrQjp0x6x7a03Rhf2orY/H15OdOWUnyILqf+msVck0i3rb8Lmf
         YBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924912; x=1781529712;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEqmHXkDhVrdf0VTdQTKHLTZEqeQsjBP5qTz2xfevEQ=;
        b=i88VkIJ+bnls12Lx+ecKvey7TiRyAdMsIcN/99L0SI/aensCvpKack9QsBFUIktmnN
         8j/OZYBHv7Kz3z2txwEizpjFQD1MklHZccbNu30+OqW2FiUG91viS+7lA1kqtO5SrjXV
         Gx299UTAuZh7+xXJ6m4UYa3/IKR7mmEQ3xebOaKHKSmqoQzuaBHMO8fpTtQe9wYxgAJ4
         EbHVXLnkeQPu0sDtnOIC901OYagwdMx7kJuvoG25ps4mFWi2mQyuTF4Cbw5dYnWxkqzd
         3BwkYFGqsYNvhvynskE+JoLtEWLV7MqcQmhybtqF0EdzIZQaywpVlGxDTi10ZgDtf0Kz
         1oDw==
X-Forwarded-Encrypted: i=1; AFNElJ9Jz6Ipr5RIGI1AG6jpiZLIL1WKvWGNlzr2dQAsIYH9kPFMNXjAar2SPbRHy3ggKzC+klTfm7U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt4sE0xLa9mPakDWMlelmLixvTD2HKHQFWkuwBWz9Ks0DhQRdF
	Zy+KpJpIQGsHCR95wmHYVZAGXqStC5F04CuVBvSW/0cvX7x7AbvF693RjGqPT8Xw6740NBPaDmL
	ztqVuA4KMq3bgCngoqpySsIJoqPkjUK0wYDzoAnTqOe14DR1qIuU0bnNTiZFy90tQ
X-Gm-Gg: Acq92OF3v9ScE3+wL5R6aTGvEq82U9v0DMO1Iq8Cq56rEBmCLgPlo6tgLbxWBdxj7xt
	YdMXHtOuDHWDbJdLZ5suOVH/yaX2SlTWgkeuCz7jq6h6lvuoR7cJ5cg8zg0RbhxSBtIwd8vMUgV
	D7RMTdzyDMgf/rDJiJFB8QKgaYiq4k0/hOs4g2Ona6QDsYXN74/RvUSEYFrl/eIuGK6xUYOIGHD
	JIRebfn9t5bfrtIwPcZl1LHzFHY8e25AByaS5qnQhzSxUK7vdpaG6lui9IictutZlJ699fv9FnE
	zlS9D/9Ph4lbDn2ctIrjDclYVgjvafQz2e8e6rrAsjB/Ai2jFoidDN3JyBxuTPLuf0C1n3AGeMc
	2/6Apg4veHxeck9h2gKwDQBwP3nhbo9SU6/orDEbOUmqMBlQ7vNEFSJVmplPczRj50ns3xwo0rq
	LH8l1nJaAOv8o=
X-Received: by 2002:a05:7301:1e84:b0:304:c520:4e0c with SMTP id 5a478bee46e88-3077b2707b0mr8229725eec.6.1780924911956;
        Mon, 08 Jun 2026 06:21:51 -0700 (PDT)
X-Received: by 2002:a05:7301:1e84:b0:304:c520:4e0c with SMTP id 5a478bee46e88-3077b2707b0mr8229708eec.6.1780924911418;
        Mon, 08 Jun 2026 06:21:51 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm21607280eec.13.2026.06.08.06.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:21:50 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/4] wifi: ath: Update copyrights
Date: Mon, 08 Jun 2026 06:21:31 -0700
Message-Id: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANvBJmoC/3WNyw6DIBBFf8WwLmbAd1f9j8YF5SGkVSxQozH+e
 6lxZ7qZ5ObOOXdFXjojPbomK3JyMt7YIQZ6SRDXbOgkNiJmRIGWUEKOWdCEPjG34+JMpwPOBCk
 oFNDUAChio5PKzLvyjuI3HuQcUBsbbXywbtm3JrL3h7Y4ayeCASvCH4w3SmSyvFnv0/eHvbjt+
 zSe39jB1394SVhFVENFnldnvt227QsOxZGZAQEAAA==
X-Change-ID: 20260604-ath12k-copyright-3d1520509800
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNiBTYWx0ZWRfX/petjmDttwI6
 uY8cDsq29ctpRe6BL5VkBnLfPob0GOT9BxQuPhHH3gZXdHbYMRIt3BYc43nqJj0T3HICt+fE8SR
 XnGoNbcCMnkFfYfPE5TNXFdo73zGLvwI0vCYOA1HvxRu0K4MmMaIgeoDz0foNPt123Cngai5L1Z
 lkZeA3z7MCEpfUGwliUEZtuOMzeT0i69ML9REBcr345DNiblKiI3Nv3c66Yj9wk9c8wlDcOnvu1
 hNcTxfvpTjhAkb4YtR8zEEyWu2us9PJbyWxcyDvxUIUUYw8uwUC4KXbHf4ynxyVS3XrKSF3nMFU
 +6JV9eaud+s/sid8a64Yla25T2NCHPVixz2xaFLJcKdhoD0HkXTYJV/7cezHxgfLmEx2wg50ZRL
 yTXzzIjGTeXrte5xscyPU3i3t7sBcYqkDyLEDPmVNDtunVaZW29WJ6HuI/J8bwExFPgVMgoXyhQ
 7zZznBMhIfagMMHEVFQ==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26c1f0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=NZvTMgFr6E2f7DfL6gwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: hfXQEsghNvMT2YbsfY7IwF9wrzRulX70
X-Proofpoint-GUID: hfXQEsghNvMT2YbsfY7IwF9wrzRulX70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_062153_440136_D3793BF5 
X-CRM114-Status: UNSURE (   8.91  )
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
Changes in v2:
- Add new patch for drivers/net/wireless/ath (only one file affected)
- Link to v1: https://patch.msgid.link/20260608-ath12k-copyright-v1-0-e1a71f92d447@oss.qualcomm.com

---
Jeff Johnson (4):
      wifi: ath12k: Update Qualcomm copyrights
      wifi: ath11k: Update Qualcomm copyrights
      wifi: ath10k: Update Qualcomm copyrights
      wifi: ath: Update copyright in testmode_i.h

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
 drivers/net/wireless/ath/testmode_i.h               | 2 +-
 89 files changed, 69 insertions(+), 89 deletions(-)
---
base-commit: e1c8fcfd37f76b46a581b794e27765258c9a537d
change-id: 20260604-ath12k-copyright-3d1520509800


