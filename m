Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38D4FC72AD
	for <ath10k@archiver.kernel.org>; Sun, 22 Mar 2026 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvG7vaVxYt7j8HH9LHHGlNM2wx2cXGwZObQrBCXRyTk=; b=tgsgsJd7dgOLe+X1iLcX4/0gN7
	c3CuBf6jNW36lJBaTLM1lMx0+p0u/rmOaIs47skvoq4RieBN+aNVmzJ7XyLpXOn8VoqO3oV6gOngn
	oeEpfmBIAqWaR/zLFw8Ru7vbHWMgxCmhDc6YM0hhcuPj3cWTP6WKQg1jFWwHrGAXpJiCrVylWYays
	XEgptLM9R6ys7NPJAwLePsxA78+AHpTpJlav02cG00ALVdzLwEybUMOzCdbKypPkQSeN2NYJWnSYv
	6MhzPyPRrbscA9hQ8CZT3bC6ofqaeKTReTj2OaocAutar3UlRyQB/hy7xZ6j9W6o7MnfmPnCCfzw/
	QWluHKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JBI-0000000FNcK-1sax;
	Sun, 22 Mar 2026 13:49:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JBG-0000000FNbP-3LLs
	for ath10k@lists.infradead.org;
	Sun, 22 Mar 2026 13:49:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486fda2a389so16484905e9.1
        for <ath10k@lists.infradead.org>; Sun, 22 Mar 2026 06:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774187365; x=1774792165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvG7vaVxYt7j8HH9LHHGlNM2wx2cXGwZObQrBCXRyTk=;
        b=KJIBPdXzwQBUIKGUjZOXSF9dSKI4jvB00TjacqGfIK4EL9ONNUjnPsT61qqreXiR0K
         FjADxAhWkxV83ZHKGCpnFk3j+/oMRPgeJBu/WawodjsZLa8tjZndDNpmcoJghlDV+HG+
         TAhQWPP0t1GYxpX11Oj/VIa0pigQEtqtv2hLiomSYAF6jPeWpFP7iRIX5t4KV3/QkeLD
         G6ibQVM+4trtVDnOy2Rx/pMZK51cFXZYAFaDxZX5vOxrIztxlbs00UClS+ZaGMRSeXPk
         MQCFHZoB40hPiCU3GsR8DkBanomailLl/+T7CKLgNdvZcJPy2heUmT82zdS8lHZ0uAea
         g5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774187365; x=1774792165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CvG7vaVxYt7j8HH9LHHGlNM2wx2cXGwZObQrBCXRyTk=;
        b=QBT/JophMFFekJwK2+pzCHeTM7yGZTwkf17Disd4QZucy4r01y96uXK/VfxbF4FzGU
         s1VslwkK0uERDnRE41nZGT79+jLaMxvYrDsO2FziajJ/SFzpxQlekcLb8NcrzedlACx+
         Emnea2OepE2PpEVdMY7iS721zod8hAQCuIeLdxmLPqfaROM/0gDDMbzodFZ38tEiF03Y
         ydBurR13IqYVon4hrNDrSAAuTYwU+qEQYnsbmJoyu4fCF0uBiM6oJ4sNcLqPHC3oivmI
         v8r2DXttFQcky2xZV1Pib8wxceM6qVtJbu/KmDtc0+rws4yc0MfmnCLiU7UdN1EY9tui
         PS/A==
X-Forwarded-Encrypted: i=1; AJvYcCX2v/eUVtpS+jSkolsmQTRkRhQnwH59exk6WNoLklOTC1r3+l11omNHff9JU2RUXp57DX+uL/o=@lists.infradead.org
X-Gm-Message-State: AOJu0YywxMQsHPNPlnj89xGzDG7+Ga4m6qzKnCgvdMPbrFLDS5zg2Ql9
	yJRIm4cbSbFIghCMlWm6hWd+L8LnjV3Jz6n3flMeEhITdd+uVTck6X9P
X-Gm-Gg: ATEYQzxpVlcwtVtueDTqCX4gSl8tKc5uEEp4LIhaAlxdqb4JlVPzvaRt2QgKUUo1p2U
	CXn/38UWG8TnRcwscEhUzt6pskmsjGTaAzLZdWZsRFlkAaBE/n/PIDVxab1GXjhfmq7mncYRJsW
	r/Ddj6Yo858xa4qyjty8k7ZcVzmgudAgcbDrXIdiJ0w90P3JMlv0Vqu8DU6jjSypmpoyI4ZqXxf
	qCqZGcec6SxmkfAv6yygwTR/Es9sc1Sn3sinM0v0Ii4g4Nr3Mvk8E6CvBUw9HgxLNeNGTcF/od6
	f1bAYDIjC2G0AUtd0MW1jgW1IAd9jZntnHMMfw33D4LzuOht99PsZZ5M2BuLl67KSgqFz149eR5
	KkDXgFPYph3p1r0Mqyjy08Ok4lolKQnkLlK64lSx7c2ff11VF2DRqean71OSveB8R8fwaxkxKay
	rMZppml2h5YQL2o7W7KhiYm1nsuKGdCMlwSnqr6tXLXLA57itzRTuk0DyEkPfumz8FcYi2Gv8mR
	S41/5s7cmQxYpinDNOgt+xpGw==
X-Received: by 2002:a05:600c:3b8c:b0:486:d76c:fa51 with SMTP id 5b1f17b1804b1-486ff03ffa5mr121948785e9.27.1774187364780;
        Sun, 22 Mar 2026 06:49:24 -0700 (PDT)
Received: from DA4-DEB.fritz.box (p200300de871aef00290206c667fbb9b3.dip0.t-ipconnect.de. [2003:de:871a:ef00:2902:6c6:67fb:b9b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700658441sm268260335e9.4.2026.03.22.06.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 06:49:24 -0700 (PDT)
From: Malte Schababerle <m.schababerle@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Malte Schababerle <m.schababerle@gmail.com>
Subject: [PATCH 2/2] ath10k: force passive scan on 5GHz for WCN3990
Date: Sun, 22 Mar 2026 13:48:22 +0100
Message-ID: <20260322124822.230492-3-m.schababerle@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260322124822.230492-1-m.schababerle@gmail.com>
References: <20260322124822.230492-1-m.schababerle@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_064926_856157_A30BB8AA 
X-CRM114-Status: GOOD (  11.48  )
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

WCN3990 firmware (WLAN.HL.3.2) has a bug where active scan does not
tune the radio on 5GHz non-DFS channels. The radio reports identical
rx_clear_count values across channels, indicating no RF tuning occurs.
As a result, no 5GHz networks are discovered during active scan.

Passive scan works correctly on all 5GHz channels: the radio tunes
properly and rx_clear_count varies as expected.

Force passive scan mode for all 5GHz channels on WCN3990 using
QCA_REV_WCN3990(). DFS channels are already passive, so the effective
change is for non-DFS 5GHz channels only. This follows the pattern
established for WCN3990 firmware workarounds in thermal.c.

Tested on OnePlus 7T (SM8150/WCN3990) with WLAN.HL.3.2.0.c2-00006
and WLAN.HL.3.2.0.c2-00011:
- 5GHz passive scan discovers APs reliably (e.g. ch116/5580 MHz)
- Association to 5GHz networks succeeds
- No change to 2.4GHz or DFS channel behavior

Signed-off-by: Malte Schababerle <m.schababerle@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 24dd794e31ea2..f6829232f6b15 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3441,6 +3441,14 @@ static int ath10k_update_channel_list(struct ath10k *ar)
 			passive = channel->flags & IEEE80211_CHAN_NO_IR;
 			ch->passive = passive;
 
+			/* Force passive scan on 5GHz to work around WCN3990
+			 * firmware bug where active scan doesn't tune the
+			 * radio on 5GHz non-DFS channels.
+			 */
+			if (QCA_REV_WCN3990(ar) &&
+			    band == NL80211_BAND_5GHZ)
+				ch->passive = true;
+
 			/* the firmware is ignoring the "radar" flag of the
 			 * channel and is scanning actively using Probe Requests
 			 * on "Radar detection"/DFS channels which are not
-- 
2.47.3


