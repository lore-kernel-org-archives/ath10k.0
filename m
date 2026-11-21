Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1115A606A33D
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 19:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HxCof3ht;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IgSZTnxn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N1ILjrfOvivQ9e4CltHPCcP/m7QhraXB8+5+5LIR19I=; b=HxCof3htNVcE7w
	5Ox1JgS34PuyMy3atwY6g1i9V7tcXga+TbucGa7vPLceg/2xSxBZjOtH35CBpbSj8MMwe+nVo7g4t
	daEeYoTfP2Q77Z1zwCGQAiB6mSXYiTWGxYjddrSR++dxUycP/vPMSzHV82GjZiyobAf0lQc7eU0Qd
	+l/CJ7VTHE/MI/hgI4xvkpgvcp/0b38O2FtBwrdHxxkXoF5C5N4Oy3ldD2pPsrYbW7TuBWu3YstcA
	Thvlfrwb8zXPm5jBdxZ2NXao6NDmnKXoa11IPcQpeY8dEnXbLvfwm2sBpA1tZOoyCy8tY4J54o8o1
	krhp1WnsLP1dDc3Un3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUr67-0000000093T-3JDQ;
	Sat, 21 Nov 2026 19:50:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUr65-0000000090e-1osw
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 19:50:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so15102525e9.3
        for <ath10k@lists.infradead.org>; Sat, 21 Nov 2026 11:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290603; x=1795895403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1ILjrfOvivQ9e4CltHPCcP/m7QhraXB8+5+5LIR19I=;
        b=IgSZTnxnJQEJlq37SrhOoQPg5dTaCUcBxUkHWs2ZpgZE4decTmYFTwpIrzGYyybKof
         GI9STqTkXgrArPJFXz2hMYV/0xwdKToMqIsPABfq/YR1VRuo5Bf+k2Pjo5Q9cNwukJGF
         ymNAEB2E3x8QIi1Nt3SfTEYCAUwZNJ3cAo1ydIqnwWtLNggU6o/yj7VHfnLM0qjmS3Tk
         Ug9NsYxwJDwVDr0Yi+C3bkhL2iXTNWwC0/iuEZSpGbPbe7AA4/cKYGyEzzx8YiY2skjx
         +v/9FWnvwipbNQaRUjCrCWx96G+gxXxQEWeIPYhbo/i1Bt/JaDsyBH0ci9a89vn9u1wY
         yz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290603; x=1795895403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N1ILjrfOvivQ9e4CltHPCcP/m7QhraXB8+5+5LIR19I=;
        b=dT08YWRU3ycMu+gxXsQveSaYC5HqRdCLDHFkxMdyEmBUMS+qZZA0IMsx4twp2dO+nz
         mr9lPgU8MODzrluaQI0JdDfYovPQoHTraYH7I9prfITCnLIEWIFWkyQjWviRxK4/EVIw
         UkCqqrHUFJpRBFDwt049U+u4QQTuG0vqUVZR2DehdAoXBVr5T/bNdrWKH3fvc3srpf8K
         XQUSTDeJ1MYmq/V5qnUOe5adiynWptVikv83o7+oKgDxlLcvIiUaVnMofs0BSkf60hrz
         bU6XwKWbq+XD653IOu4QjnVqHHG5SRHjpKmONfL1809/I4kz2bRpsefuQT6GXNAWPhLo
         4cQg==
X-Forwarded-Encrypted: i=1; AL+hErFlP08hpQtgcfV79KIzAbt8jhBVD7TZiexkxK2bio8nAHxUKJB+8/bIOQgCZUqjpkf3Au7dzyg=@lists.infradead.org
X-Gm-Message-State: APuU4Z+cwU+SOpBQX5gHSBr7YWupkrv+H4nS7wjWqUZQRJHK/tYh6kW3
	UzT5A4Bhwffh+RYcc1cl299mn0UKlQMYzlbKBtFg0gejMtjqTr9jRmyP
X-Gm-Gg: AZFdTZe9Vot233KxjOwr3Mv7gifZVElN/nfMMYaWjI1VuznQepLSSNqL2vp1hFD2Ctw
	AcM2JG7bWNep0000NlStHaR6A7+qc4DHkEfmzysX5utXOnzTyZGOeVhLc2sEg/x0ehyfMuBO7K7
	jP03DG059uJvwGuiU+PR0Tc5FvXmt3PINYksCGhWA3obEl7qwUUWp86zkAE4/+FskT5ROnIsAUj
	yYQ8HBuOouFAf3eBRVh5HujLv/c4ZXjEdrOPfyVbkHvafpJgqihT8MHSR/TLmbmepuIzc5IKgh0
	tODWjHI60HXkH/0uH7JKxisvSMsugfgHQIBz5e+kA/So3hocpmYSj/ihk9Cc99lcbmvmqfloh6P
	bfuHLHGSW+qJmGj7VYbWLEjUj2i+rKTBKmC0BxOt7GivsN8tHUceqB6TqWPv0ibOxlpdPZa4N2f
	pN33YMVMaljnnpA8DaxeYuMgXDKcrSADRBD4op8s1zOAoM7C65exwMuTzw8rMq/mKS87oMqRQ+O
	B46dXkRSx3/RDDSsObAGCo8Tq33Ld2zOvriGEja+iNYGfN8q+TR8vjD6lP4dzmtns2F+/LGzbxj
	KoaEND9fphiqcNpGpMgqyhDG52QkdipYkJOlAGE7jeM4/dnj7wH8MSUSI5c=
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr149032465e9.26.1795290603440;
        Sat, 21 Nov 2026 11:50:03 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:12:31d3:47a3:3d6d:45fa:53e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm196876215e9.7.2026.11.21.11.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:50:03 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: jjohnson@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 3/3] wifi: ath10k: add firmware feature bit to force passive scan on 5 GHz
Date: Sat, 21 Nov 2026 20:49:39 +0100
Message-ID: <20261121194939.3647400-4-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121194939.3647400-1-morf3089@gmail.com>
References: <20261121194939.3647400-1-morf3089@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_115005_493180_8412A527 
X-CRM114-Status: GOOD (  14.00  )
X-Spam-Score: -1.9 (-)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On SDM660 (WCN3990), no 5 GHz BSS is ever found when 5 GHz channels
are scanned actively. Marking the channels passive makes them show up.
2.4 GHz is unaffected.

Add ATH10K_FW_FEATURE_PASSIVE_SCAN_5GHZ; when set by firmware-N.bin,
mark every 5 GHz channel passive in the WMI channel list. Since no
probe requests are sent on 5 GHz with the bit set, hidden 5 GHz
networks are not discovered, and the flag applies to the whole channel
list, so it should only be set for firmware used in station mode.

Tested on SDM660 (WCN3990).

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 drivers/net/wireless/ath/ath10k/core.h | 5 +++++
 drivers/net/wireless/ath/ath10k/mac.c  | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6272e0f62..6ce819e06 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -817,6 +817,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
 	[ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT] = "no-chan-stat-event",
 	[ATH10K_FW_FEATURE_NO_QUIET_MODE] = "no-quiet-mode",
+	[ATH10K_FW_FEATURE_PASSIVE_SCAN_5GHZ] = "passive-scan-5ghz",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 5dd21f063..482195d28 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -846,6 +846,11 @@ enum ath10k_fw_features {
 	 */
 	ATH10K_FW_FEATURE_NO_QUIET_MODE = 24,
 
+	/* Firmware does not tune the radio during active scan on 5 GHz
+	 * channels, all 5 GHz channels must be scanned passively.
+	 */
+	ATH10K_FW_FEATURE_PASSIVE_SCAN_5GHZ = 25,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d..7710310dd 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3448,6 +3448,11 @@ static int ath10k_update_channel_list(struct ath10k *ar)
 			passive = channel->flags & IEEE80211_CHAN_NO_IR;
 			ch->passive = passive;
 
+			if (channel->band == NL80211_BAND_5GHZ &&
+			    test_bit(ATH10K_FW_FEATURE_PASSIVE_SCAN_5GHZ,
+				     ar->running_fw->fw_file.fw_features))
+				ch->passive = true;
+
 			/* the firmware is ignoring the "radar" flag of the
 			 * channel and is scanning actively using Probe Requests
 			 * on "Radar detection"/DFS channels which are not
-- 
2.56.1


