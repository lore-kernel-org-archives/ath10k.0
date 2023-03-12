Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E87C6FA99
	for <ath10k@archiver.kernel.org>; Sun, 12 Mar 2023 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Au/mnIpcmE4CjjDQBNSkWCnm5NZJ+lFrDP644ldeumY=; b=bF8FBIJD8gJGWM
	jZmCYht6b3YIGAARlYrWCiOmhfENTOShjp1QLgDDupjsmdHLgY635Qbedgd3omhui0zo/mDA0ozVp
	WGSMOw3U4J0B+HhxAzpoijyGKY6o4Xy7JAK/23XI+K8O6Nw+vuXNCQJc2pdVZZpmQ0nOu9IH48l+R
	RGhRuMyVSWw2XCkJJ3q9SyTFCcysMhKT8P7LOUaMWS8AkGeqZwbkcKCx8MODspV453p+y1y/lFGYd
	lGYvg9Z9sFZicxrNVc43/kpvnyS4++55hxbfHoODbTzcAmgOhX9z1yNa5YHlfykP1Qd6U5DKOfFOm
	D0v9yhbl5r8gkWyMPWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbRb7-003NxD-2H; Sun, 12 Mar 2023 19:43:13 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbRb3-003NvC-US
	for ath10k@lists.infradead.org; Sun, 12 Mar 2023 19:43:11 +0000
Received: by mail-lf1-x12d.google.com with SMTP id n2so13099763lfb.12
        for <ath10k@lists.infradead.org>; Sun, 12 Mar 2023 12:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vtremblay.dev; s=google; t=1678650179;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aoWDm6ZvoLUF7S3MwvjvsZ9EtvnX0w1eA+1a4fAYPFo=;
        b=MRUo+6uH6ZRSO6/0ST6hEl8hFEHL+/Jlt/VITXca/2FVm/4cxI0W1u1DZJlbQ73Id5
         3wU1T45GxE6PdWyx8K2NssDthOHNQGZ6LMCfPjDETu14Q66QpeTqF74EknyrXsv5mrUd
         T3f5tDVZnMEm6fCmaiRXdXGC959bpLU5PKzg7m93YNSqg2iaywKKCkzwXR9QjjAPAMQZ
         5nXphPs9wgpOPaspqMxBW/76eBSgtFxBVEZiQ+rXdoFtrHLz6VkOwUKMaoUUoY/6Tjay
         u99Ijp7sb8YkgJJRGCTI3DCj1fAsd2TZT/Q2Vx0NY5kA0JzVA/Te7Z+CQhn19oux1pVJ
         LUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678650179;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aoWDm6ZvoLUF7S3MwvjvsZ9EtvnX0w1eA+1a4fAYPFo=;
        b=FoOQ44tt1z/d17xLn9ydbZa98WABIpcJQYrpco8GFmgTsWCHEVSbxh7YTugjToJAyR
         Qi9zkq6pm+py/Ol1GmnDzUzSO5ULli87LckR//0qZjyANjiEREjG7LaZEf9InbjIclmG
         GZl9fbQkYZcraPK4kl6j3/guzJzIe75X0INe5MQ+8ECM7M87HaXm7UtlPkt4GQkFW6i9
         fPW0u6S6cHs5msU2+c0QzvAvPA842mPAfQpYzeVxRXlx61/KeqHsNcOEPTDQYcP6AB+6
         silGs+kV8NQtSS/ChDdJO04HIWRP7ayr+NJOsLhfVRqq8H5XbVQHfgBwocF1QDMVTDGw
         gP5w==
X-Gm-Message-State: AO0yUKWhaDLwEpECnWVzk/3a6Uc/x5Hyrk02OBQJIILDcApvgJg2GSiD
	vyRTWQFc3D5bD1AB3FoPIQaM7fr5T6c7233BGXK91rJEA46gR5I5bAUqRg==
X-Google-Smtp-Source: AK7set/JdhbmCYvzyVHpzDGiI6rd4IlV2eKMxhAp0xPqIhwVaAo0QYAyMSMBQ6DaHVbP4yZQyldvidpcE5x2Bn7Zdz4=
X-Received: by 2002:ac2:51aa:0:b0:4dc:807a:d14a with SMTP id
 f10-20020ac251aa000000b004dc807ad14amr9784883lfk.9.1678650178750; Sun, 12 Mar
 2023 12:42:58 -0700 (PDT)
MIME-Version: 1.0
From: Vincent Tremblay <vincent@vtremblay.dev>
Date: Sun, 12 Mar 2023 15:42:47 -0400
Message-ID: <CA+RD57MwUfAzF2u31Ews4uT0+A6uhjwwd40O=9uyZihap4nxdA@mail.gmail.com>
Subject: [PATCH v2] wifi: ath10k: read qcom,coexist-support as a u32
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vincent Tremblay <vincent@vtremblay.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_124310_134484_4FCA0FAD 
X-CRM114-Status: GOOD (  15.87  )
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

Read qcom,coexist-support as a u32 instead of a u8

When we set the property to <1> in the DT (as specified in the doc),
"of_property_read_u8" read 0 instead of 1. This is because of the data format.

By default <1> is written with 32 bits.
The problem is that the driver is trying to read a u8.

The difference can be visualized using hexdump in a running device:
Default 32 bits output:
=======================
0000000 0000 0100
0000004

8 bits output:
==============
0000000 0001
0000001

By changing "of_property_read_u8" by "of_property_read_u32", the driver
is aligned with the documentation and is able to read the value without
modifying the DT.

The other solution would be to force the value in the DT to be saved as
an 8 bits value (qcom,coexist-support = /bits/ 8 <1>),
which is against the doc and less intuitive.

Validation:
===========
The patch was tested on a real device and we can see in the debug logs
that the feature is properly initialized:

[  109.102097] ath10k_ahb a000000.wifi: boot coex_support 1 coex_gpio_pin 52

Signed-off-by: Vincent Tremblay <vincent@vtremblay.dev>
---
 drivers/net/wireless/ath/ath10k/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c
b/drivers/net/wireless/ath/ath10k/core.c
index 5eb131ab916f..802d6a12dc1e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2355,14 +2355,14 @@ static int ath10k_download_cal_data(struct ath10k *ar)
 static void ath10k_core_fetch_btcoex_dt(struct ath10k *ar)
 {
        struct device_node *node;
-       u8 coex_support = 0;
+       u32 coex_support = 0;
        int ret;

        node = ar->dev->of_node;
        if (!node)
                goto out;

-       ret = of_property_read_u8(node, "qcom,coexist-support", &coex_support);
+       ret = of_property_read_u32(node, "qcom,coexist-support", &coex_support);
        if (ret) {
                ar->coex_support = true;
                goto out;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
