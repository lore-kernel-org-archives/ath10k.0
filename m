Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1250C433F5
	for <ath10k@archiver.kernel.org>; Sat,  2 Apr 2022 15:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hu1iSzZMdqDoOjlAvGSrqPF8FgOWg2o75IBYTHkWzvk=; b=XJjTsufVuSqCwr
	BZGPTj8LMAN2QtCgPKErZVWJCO19B2odTX/JGIbVr6u4ojP4/TdHSa6N+qiry14EZN+5mC8G6bcKD
	Sx2ANo2CGOVPZNit1XLravNW6p0Avm/FXQAeXNCgyi7VuVvJ4sXEPscYQuS2t/oEARiGtzjZYzWr1
	8j0Gu1k1HJXBfEdh9xsCP97/zG5nMMo7K8XTIMUeagf9DmKd5Gb6xYuQQ7Yh2cUDDTe96ER4F4Qy0
	2pAUvmUda6VN3S2fX7QKLMYdSmuM++ncXRqWui8tMxthqh5ZHRxiiNvyIeN0cdH61cQG9M2TQlHr5
	QkUjMNqygrHiNbVPavWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nafnj-009UUJ-2X; Sat, 02 Apr 2022 15:36:31 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nafnf-009UTN-Oz
 for ath10k@lists.infradead.org; Sat, 02 Apr 2022 15:36:29 +0000
Received: by mail-lf1-x12c.google.com with SMTP id bq24so9872977lfb.5
 for <ath10k@lists.infradead.org>; Sat, 02 Apr 2022 08:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sQp3E/tCtBXrNhoAsk/Z0N/SCGmUP8kpIty3COodPo0=;
 b=A65EsVXEABnj6gSYQg6vpas/3zrSi/rQORU3vmz8AqDExqUXj0Tz5FRs/ZowLKOOdn
 V5cIP2e7IMvKQP0u1xQjdgVDdDzVsIyC69JeKmbEUFjecNVpItjGInEDdtCRbb56S2rF
 q0deq9CGnM62VhbTdSLOjaZIIjdP/IOhyReGIFVxxtUCAO+myyQOWDOvPb80VLZk46I7
 y+G6uC49Dw5ebnH+jFHOFVWBQ7Vqf7V8ptcWOSDiUNRAIkUhd8WUMxIXMzFoQf+wEHtI
 CF8JuUUFJ/lBPYPy5ZSMWap9h5GqVQmhnXW+D3j28oxRnpijmFLGheIFA/oyNSLJQpj6
 B2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sQp3E/tCtBXrNhoAsk/Z0N/SCGmUP8kpIty3COodPo0=;
 b=hr+vPmTcZuyfM9OTnkoCmVhOcndrCT/7j4775G9rYin35udwpgAq8xMUCQPH7oKJcT
 +sWtOgzTWB/KdpddVSYfN50GQ0BVx1+1M55NoZ4F5r4ZSrrgTpT9ceLIIUhAu1yxbRvd
 8CXX03Eruk5PfFhT25jwejrNoNnN+8Gf+mkV6+C2YqQsvCcvjneYBldeIY/r2tQ/5tMq
 6HlRjQcPH9jP2OQb6iE43ZxlGe5SSMK7tc6J5r1xIm0QLKMzLZOOlcH04w1UeXz/lDRp
 CjuMGR+eZe9KcLEVgyl+lr/zja0VrLMxb1z+vfLTXLad775lZUBNVLfrqjKWH5ASGVNK
 zdSQ==
X-Gm-Message-State: AOAM530MKOJXEQnZ1dnAlE/VhzZZ3E7CuS3ymuWvWmSRm3JwXR5XvKCa
 oYNQ5h9BHrNO+Izbw37+Eig=
X-Google-Smtp-Source: ABdhPJyHE4/QbkgpBXdGcPqWrtFCSZBwKxDLhQyBeLGnKHYRLR3VUzBdIk65DNiw2Ywg3Rrgo2bFrw==
X-Received: by 2002:ac2:4dbb:0:b0:44a:da57:33f5 with SMTP id
 h27-20020ac24dbb000000b0044ada5733f5mr5439929lfe.653.1648913784094; 
 Sat, 02 Apr 2022 08:36:24 -0700 (PDT)
Received: from rsa-laptop.rossosh.lan ([217.25.229.52])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2e3512000000b0024b12b5044csm52884ljz.89.2022.04.02.08.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 08:36:23 -0700 (PDT)
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC 0/3] ath10k: add encapsulation offloading support
Date: Sat,  2 Apr 2022 18:36:12 +0300
Message-Id: <20220402153615.9593-1-ryazanov.s.a@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_083627_872068_C461E0B1 
X-CRM114-Status: GOOD (  12.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello,

this series introduces driver support for hardware encapsulation
offloading feature.

The main goal of the series is an overall improvement of system
performance. On a QCA9563+QCA9888-based access point in bridged mode,
encapsulation offloading increases TCP 16-streams DL throughput from
365 to 396 mbps (+8%) and UDP DL throughput from 436 to 483 mbps (+11%).

The series consist of three patches, the first two prepare the code, and
the last one introduces the offloading support itself. The first patch
reworks transmission status reporting to make it flexible enough to
support 802.11 and Ethernet encapsulated frames reporting. The second
patch reworks the module parameter that configures the main
encapsulation format of frames that are passed from the driver to the
hardware. It makes it possible to configure more encapsulation methods
than just raw or not-raw. And, as stated before, the third patch
actually introduces offloading support. It changes a couple of frame
analysis places along the xmit path and starts reporting offloading
support to mac80211 via the corresponding hw attribute.

The new feature has been extensively tested with QCA9888 and works well,
but it may introduces some regression for other untested chips. So the
series is just an RFC for now.

Sergey Ryazanov (3):
  ath10k: improve tx status reporting
  ath10k: turn rawmode into frame_mode
  ath10k: add encapsulation offloading support

 drivers/net/wireless/ath/ath10k/core.c | 11 +++--
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/mac.c  | 67 +++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/txrx.c | 12 ++++-
 4 files changed, 73 insertions(+), 18 deletions(-)

-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
