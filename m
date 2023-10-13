Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFC7CDB47E
	for <ath10k@archiver.kernel.org>; Fri, 13 Oct 2023 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hSWRicnGr9tFtaxRprAv5XAbHhXvdo1NB8RY7uaqnbk=; b=2SN
	HJm+HY6VBNFo0fZ9amiAUpdn9XoR3Az1wkm4Mcn2NLiNeW//KQz/4Mo4z+Vkowtk736iPKHJ/4ZnI
	ez3+u1C820TcEi1vK/E/PReob3Jej92C1YwYuLYQ6g4G6UxakAUwwvy/zPAUG10M/sh3GaaINNBsO
	SKioqE6AvPkjPON7XccKTMzwZfk88HtLSHpb6K8TPiEySIiY6CUr3SZJfP19GscIg6YkXRT4iVINd
	zcxlvOrJqOj/+SBUOV0Gk6IGz8oFp05XxtakAIBGGyZTgAOg8SZLyXtlKsuZ9G/p0Hgh9ZBYDbYt+
	wHqKfuJ+/HwIApX2PHJEAHrLr7Jg1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrOr5-004EPF-2g;
	Fri, 13 Oct 2023 20:33:55 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrOr2-004EOi-2C
	for ath10k@lists.infradead.org;
	Fri, 13 Oct 2023 20:33:54 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d86dac81f8fso3614878276.1
        for <ath10k@lists.infradead.org>; Fri, 13 Oct 2023 13:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697229228; x=1697834028; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eG6A8LXGdf5DishXidGUjCut3MBs3ddn444r7C+ElXE=;
        b=vocSKoJgPMBKc4mJvbBBvhz0gYBXrWEzKQlaZuThtEIdZstn4hQNdEIlAV7d7xn86U
         rMvqWky5YJxMA7ps22mjDo5riUbwvdWDAPd8NV69O4G4We3na9nLZB1E58viDpWMMY12
         1bCwGwrFZrgYL9A+R40n4fJJ8AMGiRNnQfMZ3pcuE1mXNaeIWIYo4e7WNBo0biFtMftT
         jIppO9RHTKcqPDhorX3ma6E9UueLdlA/jClu9K7yJFzME6zhE2mDx8ZxfwcDFRMTAbq2
         izPEuEwY8FPg4WxY/N60JIn4a1HMV8Acp8p3VuId4OYQWs6bUu/gxT5bkjL80IiugzK8
         Nnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697229228; x=1697834028;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eG6A8LXGdf5DishXidGUjCut3MBs3ddn444r7C+ElXE=;
        b=Gu9/bigcJRkXy13M7cPj4SHaDnpJLT9uK3M8HeveBnrBzpJ2GDpODQnyEe3Qu0LBlX
         xFO5yYFEBlcXy116QiZpK/fbnx7m3UZcec7fmb1g9UOHZ2wOLZh2AXKNZAkSMbefPSgV
         SRGOYTv67LIxgpt/2Ogy3e3bMjnTYy6SEDEWGALNRD27qWYsjcPX6nEffnKXzKAc9Iz+
         /mP3jdrxRIZp/UDzRvepZZamXJZj3Gh7FBDy0pbDcijwssljTGoHbkQoCKkUCT+q8bLL
         NSm/3ZmxHZ9iMd3vg9IkikmynA3ZIywByo8T+lF3KIQyCl7QnWlMISv1ORpsay5sdU84
         NCiQ==
X-Gm-Message-State: AOJu0YzcxJcwDWkKhno2+nm/6X8M86Lq64bkKcx0wfI9vXLjeDR+klqh
	Jj3xCozwHqVOp3B9oq/XgUxK14vXyTAj/8OZ/w==
X-Google-Smtp-Source: AGHT+IE1DLGODvnUeOyBO95DQWbeWAG3EQH/FQzqvAHpAtiVubf5eiiRi9rEMF1X30r6/tRVippKDNEtWmsLOAHylw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:5056:0:b0:d9a:3dac:6c1a with SMTP
 id e83-20020a255056000000b00d9a3dac6c1amr284177ybb.11.1697229228652; Fri, 13
 Oct 2023 13:33:48 -0700 (PDT)
Date: Fri, 13 Oct 2023 20:33:48 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKupKWUC/x2NQQrCMBBFr1Jm7UDS0AheRVyE9GsHNZaZ0Cqld
 zfK4y/e5r+NDCowOnUbKRYxeZUm/tBRnlK5gWVsTr3rg3c+sFUtef7wqLJAjQsqr6J4wIxTnX7 z7s7PlLlxDGkYYoyIidrnrLjK+987X/b9C0V4zo5/AAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697229227; l=2804;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=bIMAUwS6tKmB9c3Rk81R/5V5UUFo1cBwPXaV7yFWMoA=; b=CMqSCYBAwjGQ8NqCJLEe3oWu/b2U+C4UYTWSlc/PUeeYHnfx5MQOccK4vtSKlHLLgk37gUzWa
 wuqPSkQzuGcBq8W/yBQzKG3d3WsDrMe0sr4hx8u6ZKodNLkDgwsgk/2
X-Mailer: b4 0.12.3
Message-ID: <20231013-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v1-1-24e40201afa3@google.com>
Subject: [PATCH] ath10k: replace deprecated strncpy with strtomem_pad
From: Justin Stitt <justinstitt@google.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_133352_720668_2C9C4560 
X-CRM114-Status: GOOD (  12.53  )
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

strncpy() is deprecated [1] and we should prefer less ambiguous
interfaces.

In this case, arvif->u.ap.ssid has its length maintained by
arvif->u.ap.ssid_len which indicates it may not need to be
NUL-terminated, although by virtue of using strtomem_pad (with NUL-byte
pad character) and having a destination size larger than the source,
ssid will, incidentally, be NUL-terminated here.

As strtomem_pad() docs say:
 * @dest: Pointer of destination character array (marked as __nonstring)
 * @src: Pointer to NUL-terminated string
 * @pad: Padding character to fill any remaining bytes of @dest after copy
 *
 * This is a replacement for strncpy() uses where the destination is not
 * a NUL-terminated string, but with bounds checking on the source size, and
 * an explicit padding character. If padding is not required, use strtomem().

Let's also mark ath10k_vif.u.ap.ssid as __nonstring.

It is unclear to me whether padding is strictly necessary. Perhaps we
should opt for just strtomem() -- padding certainly doesn't hurt,
though.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/net/wireless/ath/ath10k/core.h | 2 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 4b5239de4018..ba9795a8378a 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -607,7 +607,7 @@ struct ath10k_vif {
 			u8 tim_bitmap[64];
 			u8 tim_len;
 			u32 ssid_len;
-			u8 ssid[IEEE80211_MAX_SSID_LEN];
+			u8 ssid[IEEE80211_MAX_SSID_LEN] __nonstring;
 			bool hidden_ssid;
 			/* P2P_IE with NoA attribute for P2P_GO case */
 			u32 noa_len;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 03e7bc5b6c0b..7daa007bd8b3 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6125,8 +6125,7 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 
 		if (ieee80211_vif_is_mesh(vif)) {
 			/* mesh doesn't use SSID but firmware needs it */
-			strncpy(arvif->u.ap.ssid, "mesh",
-				sizeof(arvif->u.ap.ssid));
+			strtomem_pad(arvif->u.ap.ssid, "mesh", '\0');
 			arvif->u.ap.ssid_len = 4;
 		}
 	}

---
base-commit: cbf3a2cb156a2c911d8f38d8247814b4c07f49a2
change-id: 20231013-strncpy-drivers-net-wireless-ath-ath10k-mac-c-c73a55666e6a

Best regards,
--
Justin Stitt <justinstitt@google.com>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
