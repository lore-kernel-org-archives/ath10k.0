Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2CCC433F5
	for <ath10k@archiver.kernel.org>; Mon,  9 May 2022 02:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vUSzogQ5bQQ7jV6qej/yhaKaLAgszXYmTdn5QhqQENw=; b=VT8Xt6Hzwgpn/2
	50FO3jdx5ickxvC3FCycRbpUWm9RXPNXYYTo0GHE4chc9fWjyeXcTadJLWzU4kbMHhLzcb1n1MpWB
	o2hHOJgfi+eu5xYNyk4xCOrxfJv4+n67luRM4E5y7+ojkzyn2MGJ1lWw+k9lpetVkSknSftXhIo6z
	63SU8MQmDsS9kXGn9hzj3+l5SZEwkkwT887vDpeh/eLqmamkqcrI8ueUGFoXHWzNtlg4li4GRlivL
	yb8K6RMVGnh3v5kP48EfYbOYCOXL+EhrRozYo8gL9M/BMJRY3VShw96emMRkIY5Kneb9g5qel7kqD
	FtreyH33Oac5gaXfowJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnt7E-00C3MO-UG; Mon, 09 May 2022 02:27:16 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnt7A-00C3LN-61
 for ath10k@lists.infradead.org; Mon, 09 May 2022 02:27:15 +0000
Received: by mail-pj1-x102d.google.com with SMTP id iq10so11904976pjb.0
 for <ath10k@lists.infradead.org>; Sun, 08 May 2022 19:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UVV0zq0BI+Boi5FKN3bFP+EprP0KgXC18tq4wiIrcbg=;
 b=PO8GQx73Vg2JsGT0kyl3GqPW2ozaF5rDSl9B48i25inLdmg///T2YX/nbVqRLK3Du9
 gGQgBwRS14q2LXG70IFuxsLnEkng/7DK7qdLnXofp/vvDEtqhYuujElTUj7UeWjg3xNC
 P77Evszkbo9hTKh1FT2Jko1Nkelcl277S5Cac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UVV0zq0BI+Boi5FKN3bFP+EprP0KgXC18tq4wiIrcbg=;
 b=3ufiIIZLjyVxQ5uNIUlzpiBjBvqzBL9vZs7gpd7MuxaSajNbXt7nTWw8BEeEUPv6cK
 qni5wD6KYdxBOBvQCH/uuHX/tsh0HX9Lbq34QboZ/1aFT2CXcmzUdlL+D1yWnfFymLIu
 3M/+mAAEiazpwlstJVSok01LNG9R1+8Gs7Q0nbc/J9a3DbBd1JBdZuNUx1s0rQaJCqct
 mIjRok4cq4XnX5+ZvDDjAb3wHZerHQv6lm/dwqskXehNrt9LAXP2PZh9pjeC4STuL3IA
 HvwbZWDvgvjWa1Q6kEGFAcIZ5cOvmP6DLZ/NAvKlvssXIqKCZg5OCiHZcJWuryzmN24q
 CeUw==
X-Gm-Message-State: AOAM532NzD//OSqCTNaV+c6kkAo6pRUDtrzIbrF+k+nDWo89wKnNycSd
 Qtncmc4Dce5XPOOQ/OGlXUL9N79IFEI7VA==
X-Google-Smtp-Source: ABdhPJxC8BosOM+WPt9kdM4/G0Q0MjoRMTqdjhSzSHAo+4vQpubAXZjTzID6GZj9w7pUZ54NSYIzKQ==
X-Received: by 2002:a17:902:d4c2:b0:15e:abd0:926f with SMTP id
 o2-20020a170902d4c200b0015eabd0926fmr14334901plg.129.1652063230046; 
 Sun, 08 May 2022 19:27:10 -0700 (PDT)
Received: from kuabhs-cdev.c.googlers.com.com
 (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170902c20100b0015ec44d25dasm5776327pll.235.2022.05.08.19.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 19:27:09 -0700 (PDT)
From: Abhishek Kumar <kuabhs@chromium.org>
To: kvalo@kernel.org
Cc: netdev@vger.kernel.org, dianders@chromium.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, kuabhs@chromium.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v3] ath10k: improve BDF search fallback strategy
Date: Mon,  9 May 2022 02:26:36 +0000
Message-Id: <20220509022618.v3.1.Ibfd52b9f0890fffe87f276fa84deaf6f1fb0055c@changeid>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_192713_903730_0AC896D7 
X-CRM114-Status: GOOD (  21.43  )
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

Board data files wrapped inside board-2.bin files are
identified based on a combination of bus architecture,
chip-id, board-id or variants. Here is one such example
of a BDF entry in board-2.bin file:
bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_XXXX
It is possible for few platforms none of the combinations
of bus,qmi-board,chip-id or variants match, e.g. if
board-id is not programmed and thus reads board-id=0xff,
there won't be any matching BDF to be found. In such
situations, the wlan will fail to enumerate.

Currently, to search for BDF, there are two fallback
boardnames creates to search for BDFs in case the full BDF
is not found. It is still possible that even the fallback
boardnames do not match.

As an improvement, search for BDF with full BDF combination
and perform the fallback searches by stripping down the last
elements until a BDF entry is found or none is found for all
possible BDF combinations.e.g.
Search for initial BDF first then followed by reduced BDF
names as follows:
bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_XXXX
bus=snoc,qmi-board-id=67,qmi-chip-id=320
bus=snoc,qmi-board-id=67
bus=snoc
<No BDF found>

Tested-on: WCN3990/hw1.0 WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
---

Changes in v3:
- As discussed, instead of adding support for default BDF in DT, added
a method to drop the last elements from full BDF until a BDF is found.
- Previous patch was "ath10k: search for default BDF name provided in DT"

 drivers/net/wireless/ath/ath10k/core.c | 65 +++++++++++++-------------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 688177453b07..ebb0d2a02c28 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1426,15 +1426,31 @@ static int ath10k_core_search_bd(struct ath10k *ar,
 	return ret;
 }
 
+static bool ath10k_create_reduced_boardname(struct ath10k *ar, char *boardname)
+{
+	/* Find last BDF element */
+	char *last_field = strrchr(boardname, ',');
+
+	if (last_field) {
+		/* Drop the last BDF element */
+		last_field[0] = '\0';
+		ath10k_dbg(ar, ATH10K_DBG_BOOT,
+			   "boardname =%s\n", boardname);
+		return 0;
+	}
+	return -ENODATA;
+}
+
 static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
 					      const char *boardname,
-					      const char *fallback_boardname1,
-					      const char *fallback_boardname2,
 					      const char *filename)
 {
-	size_t len, magic_len;
+	size_t len, magic_len, board_len;
 	const u8 *data;
 	int ret;
+	char temp_boardname[100];
+
+	board_len = 100 * sizeof(temp_boardname[0]);
 
 	/* Skip if already fetched during board data download */
 	if (!ar->normal_mode_fw.board)
@@ -1474,20 +1490,24 @@ static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
 	data += magic_len;
 	len -= magic_len;
 
-	/* attempt to find boardname in the IE list */
-	ret = ath10k_core_search_bd(ar, boardname, data, len);
+	memcpy(temp_boardname, boardname, board_len);
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boardname :%s\n", boardname);
 
-	/* if we didn't find it and have a fallback name, try that */
-	if (ret == -ENOENT && fallback_boardname1)
-		ret = ath10k_core_search_bd(ar, fallback_boardname1, data, len);
+retry_search:
+	/* attempt to find boardname in the IE list */
+	ret = ath10k_core_search_bd(ar, temp_boardname, data, len);
 
-	if (ret == -ENOENT && fallback_boardname2)
-		ret = ath10k_core_search_bd(ar, fallback_boardname2, data, len);
+	/* If the full BDF entry was not found then drop the last element and
+	 * recheck until a BDF is found or until all options are exhausted.
+	 */
+	if (ret == -ENOENT)
+		if (!ath10k_create_reduced_boardname(ar, temp_boardname))
+			goto retry_search;
 
 	if (ret == -ENOENT) {
 		ath10k_err(ar,
 			   "failed to fetch board data for %s from %s/%s\n",
-			   boardname, ar->hw_params.fw.dir, filename);
+			   temp_boardname, ar->hw_params.fw.dir, filename);
 		ret = -ENODATA;
 	}
 
@@ -1566,7 +1586,7 @@ static int ath10k_core_create_eboard_name(struct ath10k *ar, char *name,
 
 int ath10k_core_fetch_board_file(struct ath10k *ar, int bd_ie_type)
 {
-	char boardname[100], fallback_boardname1[100], fallback_boardname2[100];
+	char boardname[100];
 	int ret;
 
 	if (bd_ie_type == ATH10K_BD_IE_BOARD) {
@@ -1579,25 +1599,6 @@ int ath10k_core_fetch_board_file(struct ath10k *ar, int bd_ie_type)
 			return ret;
 		}
 
-		/* Without variant and only chip-id */
-		ret = ath10k_core_create_board_name(ar, fallback_boardname1,
-						    sizeof(boardname), false,
-						    true);
-		if (ret) {
-			ath10k_err(ar, "failed to create 1st fallback board name: %d",
-				   ret);
-			return ret;
-		}
-
-		/* Without variant and without chip-id */
-		ret = ath10k_core_create_board_name(ar, fallback_boardname2,
-						    sizeof(boardname), false,
-						    false);
-		if (ret) {
-			ath10k_err(ar, "failed to create 2nd fallback board name: %d",
-				   ret);
-			return ret;
-		}
 	} else if (bd_ie_type == ATH10K_BD_IE_BOARD_EXT) {
 		ret = ath10k_core_create_eboard_name(ar, boardname,
 						     sizeof(boardname));
@@ -1609,8 +1610,6 @@ int ath10k_core_fetch_board_file(struct ath10k *ar, int bd_ie_type)
 
 	ar->bd_api = 2;
 	ret = ath10k_core_fetch_board_data_api_n(ar, boardname,
-						 fallback_boardname1,
-						 fallback_boardname2,
 						 ATH10K_BOARD_API2_FILE);
 	if (!ret)
 		goto success;
-- 
2.36.0.512.ge40c2bad7a-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
