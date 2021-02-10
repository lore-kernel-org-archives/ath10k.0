Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A165C433E0
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 00:43:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1A0D64E26
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 00:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1A0D64E26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gPdEbiPNkC1l6SCIoZpN+9bWnOz4pzTfqDcwhWWqYtY=; b=YU1vWE+fyus+R8+Ym8g+s8QjXu
	Lc/xZNH/D5RSbJNs0ZUYzD8/1B0Je1BxBjz7WyMdYdCFpIAHF0JTGGHCuWnG+NhzaOtX2qIdSHRBw
	3AO2y8R5/NybftP6GvSiY1Oul0p5e1wzoSR0Wih1sUorL7oWCaGHTEEG+f//I1kwA6FglXTaOhgMb
	DRw2bA9ct4WnVj9QdG4Zs8h7ky9iUhXsDYZWz8CgqepecjT2MnZ5W/rZARjDlPk1j6UeYvXaGdpdw
	CF1xOJYFLj61Qenc8NemA1ZbgmSmlLsJe6zjnrRbHFUH2oxBRsILuA9dnoy2OkZWKDEmFGzl4vikC
	Nd8bwC+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9daU-0001D2-Uo; Wed, 10 Feb 2021 00:42:34 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9daS-0001CO-LM
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 00:42:33 +0000
Received: by mail-ot1-x32c.google.com with SMTP id l23so258337otn.10
 for <ath10k@lists.infradead.org>; Tue, 09 Feb 2021 16:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=etuaipsRI8VUBgOpRvDQ8x9GuLj3LBOY0jfZPD+9PZU=;
 b=RyZp4bKd5jXCGBD5pFwR/hdVXBbL9IX4AzrmLeByylFz7gzsGYVcbuRrTX+6s0BQcj
 kQ3nHfB7Oxxdz0toIE7NU2BIn/ub7gbfxk4EjGeBbiVXq9SdLaOpfbNhj0vLqF4fO1VK
 cBq9b3eJsmf+tmJeEtT48SPYH17zjGsqAo3yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=etuaipsRI8VUBgOpRvDQ8x9GuLj3LBOY0jfZPD+9PZU=;
 b=qxevUrXJfB8iIwc8aXyu0DbDIZWJI2I/9tSfGHreZ1KDJ1m61nEa9XUcExNuov4kMH
 xYyjqxd9G1QGM0EKc62taFHT96tg+Mm1VRVCEbJSltz2IapOIrAWSGv3JyoB9XLZJG7e
 okQSO3g/wdT4h9Dy2tBFLnTncacBGeRrQjVAEnrObZZMhreOg1XviPEKcnp3B+ZQYCzu
 LA+Jf08zuer31RxYj+WF9+3Oxvt3jq0zP4RMjQZscvCDA3gRZ9HheTJilmSPvhGFxAdQ
 r+lArPmcTgzmQS6EzPGtbZcybO3R5FPcmmFY3eaZsvRTIM73J6+whp77450E64oHSndk
 KSzQ==
X-Gm-Message-State: AOAM531T4NzlN9cSASkqu6p6reOmZmvzBE5dripqHGK3EgTRZ13Mzipx
 3F8e8uTNTzAZP81loMTvDMk3wg==
X-Google-Smtp-Source: ABdhPJz3qC3Vss2S7hgvN3dmYgFFQWBTBmhf4k+ZiQK8BXjQbj1R8owtdETJ8jUJrHBoGGLX27ZKsg==
X-Received: by 2002:a9d:a87:: with SMTP id 7mr227340otq.319.1612917748911;
 Tue, 09 Feb 2021 16:42:28 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id s123sm103060oos.3.2021.02.09.16.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:42:28 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH 0/5] ath10k fixes for warns
Date: Tue,  9 Feb 2021 17:42:21 -0700
Message-Id: <cover.1612915444.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_194232_721727_D8559DC8 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

I have been seeing lockdep asserts for a couple of months and finally
found time to debug and fix the problems. The dmesg looks clean with
these fixes.

Enabling LOCKDEP and ATH10K_DEBUGFS triggers the lockdep assert and
RCU warns.

The first two patches in this series are fixes to lockdep assert and
RCU usage bugs.

The last patch (5/5) is a fix to reduce invalid ht params rate message
noise. Patch 3/4 changes a message from debug to warn. Patch 4 adds
detect to assert not calling ath10k_drain_tx() holding conf_mutex.

Shuah Khan (5):
  ath10k: fix conf_mutex lock assert in ath10k_debug_fw_stats_request()
  ath10k: fix WARNING: suspicious RCU usage
  ath10k: change ath10k_offchan_tx_work() peer present msg to a warn
  ath10k: detect conf_mutex held ath10k_drain_tx() calls
  ath10k: reduce invalid ht params rate message noise

 drivers/net/wireless/ath/ath10k/mac.c     | 13 ++++++++-----
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 15 +++++++++++----
 2 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
