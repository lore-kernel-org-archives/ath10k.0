Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3F9FC72AD
	for <ath10k@archiver.kernel.org>; Sun, 22 Mar 2026 13:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVx6+9D0T+ApnWRp1SbXG3Z0dDSdc75tY72kqtXBbSI=; b=jkgmYsyHXnC2Dm5+U8KdfEOKD+
	chupOoT3I6LnKLgPhGf2Ewi8mQNHJyWMBeUVxMRmnVpcPPv3zX/tT6qo7ac6fycopd0JOxGpe0Cr7
	7gn6tyoNJRHHdYY/6Ddhuk0YwSkSI151FZ/mN1E2M+eGPutuvHRPQvgDNz7iDpU7EPtBoJYaUWJEQ
	g9923Wd4VW0WPhNIwdWj0+0dQyJ9cwI4RGujN4JCfohfgM+bLIP+WceS3Oy1OK7omzqTGmSLg5dL9
	+WDTkVWvNglwbsrb2rjagbG6ZV44nHaCO8M07F1/vaICiGQDt0Zx2BINbG7/IAqoCqcWda9GGxJKA
	NyTCOHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JBD-0000000FNaZ-0h1k;
	Sun, 22 Mar 2026 13:49:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JBB-0000000FNZa-1RvD
	for ath10k@lists.infradead.org;
	Sun, 22 Mar 2026 13:49:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so2989313f8f.1
        for <ath10k@lists.infradead.org>; Sun, 22 Mar 2026 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774187359; x=1774792159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVx6+9D0T+ApnWRp1SbXG3Z0dDSdc75tY72kqtXBbSI=;
        b=ZOv7AQU/wJST0wwLjQqYiWhzt+LraKkaO1kGguXBd3UvWRgUKxZ9yzGdd8SolttYxk
         KqG24aBgseyDzotnlA3HG6XjoocfoS49lkW/UAIFAwMtsJGdZBFM+go8RVej4cY5ekWF
         VG0I/1tUzMHTxsc6s8BCvmPccjSnWPlXMMImhjADt7lySLE+kxaoXatITIIGGGAblAAf
         J7TkfG941So8iELIIKq0LT6wJzYcfeTJ6Yx5E6KGbbsmexZSUnRPibv3/hK1mT0GB90l
         MSnnk2Yszgj/UjVABK49FnvF4SPjUSWGG/FubNp/qzHu0hQ1K83omCnvP1yoc6pd86UK
         8Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774187359; x=1774792159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bVx6+9D0T+ApnWRp1SbXG3Z0dDSdc75tY72kqtXBbSI=;
        b=E/EVl36FOaGoo/BaPRPhLxRrMlnMq+N2aK4KuHShfnXIlhywXOuK07gOcjq1oKZcyo
         IpAYc2pbRRD4usBLfB8Tjc2ClPJrJ3EFZIZBH2bpmW3gbLk2nb68PEbdbFs2Nw94Z8Ib
         TdO6P/1Aq82f5pf9zl6CftJo1cyijfQ9MUMl8+Os/WosGLGquTFIUEPj4P5cEL0hkJVA
         tfwDIpPaBc0poBzqNA97SCCzZXf0MW+epYjrKJkofyi2xsLrO2UOx/2Cx2rNfZHeqYhA
         lkShUhaXT/LK2JWPlpt7lCHyGBiNVi22+4R/NiY1NsLswZ7244zaBj/bEGFqpU0XJTaX
         8AlA==
X-Forwarded-Encrypted: i=1; AJvYcCX+19Q7sKjXBrKZsobHM606pNXUqwbzLkdsFgmYlMD/KAJztGQpZNw6y2EVHg7W71Z4r+sP6fI=@lists.infradead.org
X-Gm-Message-State: AOJu0YymjEku3GuSadAFeooD4JeSV058OKJ4EpIpAFMZPb6F6hB50ZyP
	R91MKjPOofjhk7Vf+Kadfo++NonsvmLsemWApJ0+Zw0EGwYery8T53bg
X-Gm-Gg: ATEYQzySQyI0Nc5CHkRDPtL6waZm5mWhVZYvOt6fW5jX1xNEBcaGTNiD2TBkt8z8VzP
	eVySsrPuyYGPMZ92+tpdRUMzYqMai2iLAptuC+KbgSTrsiwcYspvaArcJoq0mda2B17taHIYPrm
	cRyPIyvkqh7Eb0Tus7haqeh+WHhOY4NYIWOFGXllH66MDuOcgKpC9Ru0/+HcnevzIV992MSuGNi
	phXkYqB8/LzGVotJGzn/5fMOHpE26dW0Fck+/39jqozEaniIwpRQKqapVEef8Jnt3FkqN4lnNBc
	DY6UREwV26zJi1b/+681okrzJN8n62vQlSIQ/ekwcgTI1dNuI6pb8+B3VKT2I7naKpGjqRAmxTg
	A+O0EeVjMUW9YgRGF6tUtXucXqYl9g3c8T06pjfMlrQX+ycEyNFqxZpUybDipDyWBHWGxmQDykk
	WlqudqRBgoKiNFmOPu6LlVYgdaQlDah227yHPpRUBDCWV/nURAgLzFM2z+mIRvoMyf/avVrfnqZ
	QoE02e0fidS0sq7dzbrjqrLfQ==
X-Received: by 2002:a05:600c:3e10:b0:485:3428:774c with SMTP id 5b1f17b1804b1-486fe8b0073mr140863515e9.4.1774187359319;
        Sun, 22 Mar 2026 06:49:19 -0700 (PDT)
Received: from DA4-DEB.fritz.box (p200300de871aef00290206c667fbb9b3.dip0.t-ipconnect.de. [2003:de:871a:ef00:2902:6c6:67fb:b9b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700658441sm268260335e9.4.2026.03.22.06.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 06:49:18 -0700 (PDT)
From: Malte Schababerle <m.schababerle@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Malte Schababerle <m.schababerle@gmail.com>
Subject: [PATCH 1/2] ath10k: skip quiet mode for WCN3990 to prevent firmware crash
Date: Sun, 22 Mar 2026 13:48:21 +0100
Message-ID: <20260322124822.230492-2-m.schababerle@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260322124822.230492-1-m.schababerle@gmail.com>
References: <20260322124822.230492-1-m.schababerle@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_064921_425482_5985EE11 
X-CRM114-Status: GOOD (  10.57  )
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

WCN3990 firmware (WLAN.HL.3.2) crashes deterministically when the
quiet mode WMI command is sent during ath10k_start(). The crash occurs
at PC=0xb0008e20 in wlanmdsp.mbn, ~17ms after the subsequent
vdev_create command, and cascades into a full modem crash.

Commit 53884577fbcef ("ath10k: skip sending quiet mode cmd for
WCN3990") addressed this for HL2.0 firmware by gating quiet mode on
WMI_SERVICE_THERM_THROT. HL2.0 did not advertise the service bit, so
the guard was effective. However, newer WCN3990 firmware (HL3.2)
erroneously advertises WMI_SERVICE_THERM_THROT via its TLV service
map despite still being unable to handle the quiet mode command.

Skip quiet mode unconditionally for WCN3990 using QCA_REV_WCN3990()
instead of relying on the service bit.

Tested on OnePlus 7T (SM8150/WCN3990) with WLAN.HL.3.2.0.c2-00006
and WLAN.HL.3.2.0.c2-00011 (both crash without patch, both work with):
- wlan0 comes up without crash
- WiFi scanning works
- NetworkManager recognizes the interface

Fixes: 53884577fbcef ("ath10k: skip sending quiet mode cmd for WCN3990")
Signed-off-by: Malte Schababerle <m.schababerle@gmail.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 8b15ec07b1071..33f299f414710 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -136,6 +136,16 @@ void ath10k_thermal_set_throttling(struct ath10k *ar)
 	if (!ar->wmi.ops->gen_pdev_set_quiet_mode)
 		return;
 
+	/* WCN3990 firmware crashes on quiet mode despite advertising support.
+	 * See also commit 53884577fbcef ("ath10k: skip sending quiet mode
+	 * cmd for WCN3990").
+	 */
+	if (QCA_REV_WCN3990(ar)) {
+		ath10k_dbg(ar, ATH10K_DBG_BOOT,
+			   "skip quiet mode for WCN3990 (known crash trigger)\n");
+		return;
+	}
+
 	if (ar->state != ATH10K_STATE_ON)
 		return;
 
-- 
2.47.3


