Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800CCC79FB9
	for <ath10k@archiver.kernel.org>; Thu, 10 Sep 2026 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GFur5lMKzWOr/vPCQGQAzSEKh1oHhUM+qY0sKZHwzYc=; b=iCBSR3SoAe1AWALDN+Qq3hnCOm
	GE0PO30IH6eX06D9I9DSmYKK4vTrC0LEInLb3wLXFLlSjlxpFDTqs4kNIwKtfZg+sx6VAX6jA6PRQ
	hKoEPACdu8Omkz+pn/PAX9/AYczeSjb5+bre6k0pCWCY3MRzIveSlmS7YmHLJ5IiUztm292KeNPWP
	XsGD+Wxr8dpMczZGC8FjTBR8wfC4XSL4pc9Zf0dgZWYFO4f5rv8sJ2SMR+UPQNA+Xa/xXmuXexpHY
	SRZpy3MBTJO/+I9v6MknJkftNEUI4x86aFHDzI50XGxvUZqmKAqMj9rFwDi1MpPCcuoKRlIkCYK6S
	ytuheYCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZpZ-0000000Dgtc-03q9;
	Thu, 10 Sep 2026 08:08:25 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZpW-0000000DgtB-3mil
	for ath10k@lists.infradead.org;
	Thu, 10 Sep 2026 08:08:24 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso864729a12.3
        for <ath10k@lists.infradead.org>; Thu, 10 Sep 2026 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789027702; x=1789632502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFur5lMKzWOr/vPCQGQAzSEKh1oHhUM+qY0sKZHwzYc=;
        b=h+wS2DN7YSV3nb8HAwLIBGCx1yuIR5rUY5h8YSfMBlm6g113Y/7PAP/hyVxoco1zrQ
         uiroAi+L+IUmSA7JC60yUWMYfO6TS7+0LWSXBn0ZbK40ZhgCxyX2PZO+E9TLK/BuDQ++
         EOsVlJNdiaNNEcAWDcVO4wUUfGcI9kHheZQzfh4QnY2kpZdAFLHNtGC9sKgoPc9VJAfl
         3JYmyY4FJpm9EuCoqXk2NDuK/v5sF+kNVf3OoxpvdRwLbNqYz3tfLml1AN8LyxROoSQd
         obb9KTVs27fZiWNqh8+5d90YHaWDiazHY+o1w0RGU3XElIzVqQc9y9LvdubnSQp/jFkZ
         9RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027702; x=1789632502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFur5lMKzWOr/vPCQGQAzSEKh1oHhUM+qY0sKZHwzYc=;
        b=pi8c7REI6vkXdcxriWn5GprKYt0ydNa0rEW+Pm53CN+midqk8kt7oBoUO/IaDGQZY/
         5m37XLkM/6Cm8/xAPOJG/WKVnaRDzWuPBVZT2alFNV6S+7EzjhVds/fRCCTxDSrgHzM7
         PKzkgAJmwKoXF97/N1+BF+XgOyMmH9N3MLp4CLH5lUtdLK3c6Kuh01/WFIBZxZKjuD+I
         H0GI1+t23RER0J9laLmlZuoy0Zu4QviRWd1wUXj7/RSit4KENQu/B1SrzP2IEJsnzopK
         LGxJdJaeqS0pNCMv2CqeChuj9WPsiUmSSauNT+CsZ2ftnKcqvX4HNHpASfIiP6wVNIsF
         N33g==
X-Forwarded-Encrypted: i=1; AKwUvBx7nzSgyDWhPcS+PintMvDn2dtoIeKYWDjPLBUh4o/62SCtnPNCsmo+RGIgfiMCupHWEt5Uajg=@lists.infradead.org
X-Gm-Message-State: AFuF++n849ApZNlT6ePfPthROwqnjDbSw+OdaEsM2RhfiVcng1DElGik
	hb+SPXadsgPn6ErnNwDazTwlPJ2Bt8OBsKa8SQ8GZKhhGjK2BUwZkpE8
X-Gm-Gg: AYBFou1G2iaYpe7iSjc+K85AT76xLMg1fC/eXB5ul5qmRc8R/WGay5p4u02DEx3mZQe
	fmacW3CsfEMotw45aFVFMl1UovZL4itT26Ksw+EqjTHpfFldejoh+ZT2JhGBgg+BIyehVGKFK0z
	lJei8aMEpkhyJNAT4sGICaEiHDUpPCMdkpodzxIghvZ1+hbWG26u5bqwDAx70sq/ByNfN8BwTaS
	PZPuk547C2SuebOYl1JcwinjJrWTtqTrF0pcpKlGEyEamkF/d5YN5cheE4vhpeTHI8woc3PBUGx
	Yz3yeDoBvjPeJD6XhHI+/AXpusHpa/UrSus9G/4ReRSwneDPxfZUQKsiZsK3WgLLwi/YuRvQvIM
	yf5ICLwXx4ITuH8iZyWP0pfIKQthf97hDgy76M9C3L8C5Eopt/YlHIIdDEzHOdAIZvSDiisiYgd
	S5GZWPEF/lBlNgI1VpYMSfQ+PxVIBBziMhvDJ5U+KY+avwfS4uIF/k6Kg8i8C5E1meHYV5dCNXT
	tfUXnhWtNn2SoVEIKEhnrU//oLvUdhuo82qI7ZO9FMWnpy+4srlCMC9dSM6ByRiqqVJlylJcXEu
	QHTfebB0Dn2D
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr58516127a91.25.1789027701516;
        Thu, 10 Sep 2026 01:08:21 -0700 (PDT)
Received: from codespaces-1adab9.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77486a1esm4607521a91.12.2026.09.10.01.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:08:21 -0700 (PDT)
From: Rivaldi Hormat <rivaldihormat@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kvalo@kernel.org,
	ath10k@lists.infradead.org,
	Rivaldi Hormat <rivaldihormat@gmail.com>
Subject: [PATCH 1/2] wifi: ath10k: Add missing validation in debugfs mem_value and reg_value
Date: Thu, 10 Sep 2026 08:06:58 +0000
Message-ID: <20260910080659.20831-1-rivaldihormat@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_010822_942437_83F69832 
X-CRM114-Status: UNSURE (   9.81  )
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

Signed-off-by: Rivaldi Hormat <rivaldihormat@gmail.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index fb61e53ff..50e017021 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -729,6 +729,13 @@ static ssize_t ath10k_reg_value_write(struct file *file,
 
 	reg_addr = ar->debug.reg_addr;
 
+	/* FIX: Validate register address */
+	if (reg_addr > ar->hw_params.reg_size) {
+		ath10k_warn(ar, "Invalid register address 0x%08x\n", reg_addr);
+		ret = -EINVAL;
+		goto exit;
+	}
+
 	ret = kstrtou32_from_user(user_buf, count, 0, &reg_val);
 	if (ret)
 		goto exit;
@@ -819,6 +826,19 @@ static ssize_t ath10k_mem_value_write(struct file *file,
 
 	mutex_lock(&ar->conf_mutex);
 
+	/* FIX: Validate address against memory size */
+	if (*ppos > ar->hw_params.mem_size) {
+		ath10k_warn(ar, "Invalid address 0x%08x for mem_value\n", (u32)*ppos);
+		return -EINVAL;
+	}
+
+	/* FIX: Validate size against remaining memory */
+	if (count > ar->hw_params.mem_size - *ppos) {
+		ath10k_warn(ar, "Invalid size %zu for mem_value at 0x%08x\n",
+			    count, (u32)*ppos);
+		return -EINVAL;
+	}
+
 	buf = vmalloc(count);
 	if (!buf) {
 		ret = -ENOMEM;
-- 
2.53.0


