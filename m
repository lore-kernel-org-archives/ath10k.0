Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4280C4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 08:12:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3CB060FE6
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 08:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3CB060FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDJ7+ZQNNwJm20kDyVLlaYSOOUibvFpwDLDHSiqun2Y=; b=pIPa95lxXic+De
	nGTN5Js3yNOBzQrqi1uCsGYaqGFq20nmnNPT3hmTqfmy4iGTJmHL5BMbHkB/DMV90uUliODSyV6IN
	saBrrJrHPg5KpKYw9qlENRtjaPozucjreldz3PTJY6IH/6e3FNHX/rg3IyLzcPRN4Yw60H21dn3n3
	FxCBMfawLkSAAX+zLHtjOHOTi23z4UHVYx7Uy37IMqzOgGL3ghmCwuGBnaIpJIqwq/GmH3RUwLeng
	mbrdbE9dnFqbKI5nsuP5KXrt8fRFgiKHRuK8jIUyB/neeFjH0EUqeC2/urxVd7pfIX7WtXfWleNd1
	v328pHSHELcbvgH+SlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGGgW-004boo-1b; Wed, 18 Aug 2021 08:12:28 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGGfT-004bMg-02
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 08:11:27 +0000
Received: by mail-pl1-x634.google.com with SMTP id l11so1316422plk.6
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uKeBKUwE3LB2nCKXyKZoeLxITXnz1RP0s5Q/fll2nTo=;
 b=Ud6o0IAPA7dYQt34AcmxuyISOXFvgs9qpRK6B9PeskadeGwtK6xcXGOUYvN7tBoLLn
 c4s5qUZw1rPPummP4+YUYLufW+tVVTMzocUi5WwVTAc+JqsbPMtyqvkRbRJTUP/lwZbf
 Wz/2Skr8LxfHmXbtK3gLSdNq9SRz8QC4VeeO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uKeBKUwE3LB2nCKXyKZoeLxITXnz1RP0s5Q/fll2nTo=;
 b=VeB8yIFlyQs/MBvida2c7+z+wSWAOUdd1IAks3yWXChsfaofys4DOrXcaBAUSkM/qO
 5IFV3Cr59kQwZcNRP8o3gkueD6eunH/c3kOtHIWaMLEXOt9qdD6+n1TwxR2hkLp6uOs6
 nf6yJ/NioumORmMdKZDzeUlVHIWw8MI83OwEbpHSvDM1jM/LnTFJSLw1nmBuPysXhTAM
 ZtIXRaTQbxIOk9L8dLQJVRoyCYIpRULJtN1h5My7zo1CPdfx+a0AdkiHd+Plw2snDHaZ
 tGI2jE5rXGRP7RhgwiOoOFPdL6kz7KhOHIH45t/V0eeNU4UvycW1CAUk2MbcXm4nSxI+
 ndAg==
X-Gm-Message-State: AOAM5305+DHgpkejN0eO2rdYXxOBqr1b2P+Wnm92FlpXHy/39Day0UW8
 CnTNuIf+v+75mApftsjkUubbng==
X-Google-Smtp-Source: ABdhPJy6FYQc+6tJoX65EdY5eXrQDH5atPjJc2WIJdLF+T75mSr6aYZdYVEmN6MNWkli7PvjMOw21g==
X-Received: by 2002:a17:90b:4504:: with SMTP id
 iu4mr8271766pjb.209.1629274282283; 
 Wed, 18 Aug 2021 01:11:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 136sm6743988pge.77.2021.08.18.01.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 01:11:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Nilesh Javali <njavali@marvell.com>,
 Manish Rangankar <mrangankar@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Fabio Aiuto <fabioaiuto83@gmail.com>,
 Ross Schmidt <ross.schm.dev@gmail.com>,
 Marco Cesati <marcocesati@gmail.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: [PATCH 3/5] treewide: Replace 0-element memcpy() destinations with
 flexible arrays
Date: Wed, 18 Aug 2021 01:11:16 -0700
Message-Id: <20210818081118.1667663-4-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818081118.1667663-1-keescook@chromium.org>
References: <20210818081118.1667663-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9667; h=from:subject;
 bh=pWyGi50I3DoGigMPxMXfi4rXyJiQ6nw3FErUCMEg720=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHMClyDZBWRqepCcCaaLFSu6A+jHJa/aMEBC9Xr26
 EKKR8y2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRzApQAKCRCJcvTf3G3AJgFwD/
 sFEBeEkAmPeaI817B7jt5/HbQSKJ9EuH/1R/X46YYmKKK2PDo76+cRm5w0hKBD8aQ+KxtqszuQy//2
 tSbnMXP/DOnwelANH5FB4/toadqqQGw5socCzFtbQ/KEMOcwnfV7N/VKJMkwk0XsYHAJSFtS/CehL0
 9xlNgi+L7QFaiWFtgWw57FWO2cJT877pYQrzp60hL6jS52Bl4hbsAnQuzMl56e1qY5cwCYufqeoky2
 nXpo9Zl+FeMUKfJA/6tr5dKitWgFl46DIAiC8kjnStRSaTJwmdPOE+pqvf1ENr7o2gYUOsKU1CMSvI
 uPGUn7yyFh9CfgeqNWCIH1AuBBCYB8LDMsoGVBIy1fGVCKtwmuIvnrB5yIj98IL7dOCT2pty+319T5
 Bns5x91HX+ruQKp0ZC9QzDCG+nA99CgAJMwa2pO69f8AFt1pfEilhpFItoBs1tsQVsU1PXQoOEPrLk
 /vPh0ZItZgXPNbd/eoe/jlVS1fKnjKJuLs3HFlh1SXDkauYUcnpo6+/mOKQP1JoSMGez07paP7RIWq
 TwlHslAUB5qHzHBATyyzbRcTN/IniFnAzxWTAgwhlYnvmnDFuTp58Sq2g9zHvmrezQgKtCetFnxBKj
 RbJbt8WLOaQZ4IbzgLYtTVO9Dw55Q3NhutRjAn+nrmJdyHLI6yEigrwwS8NQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_011123_141651_17DF48DD 
X-CRM114-Status: GOOD (  15.77  )
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

The 0-element arrays that are used as memcpy() destinations are actually
flexible arrays. Adjust their structures accordingly so that memcpy()
can better reason able their destination size (i.e. they need to be seen
as "unknown" length rather than "zero").

In some cases, use of the flex_array() helper is needed when a flexible
array is part of a union.

Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Nilesh Javali <njavali@marvell.com>
Cc: Manish Rangankar <mrangankar@marvell.com>
Cc: GR-QLogic-Storage-Upstream@marvell.com
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Schilhabel <florian.c.schilhabel@googlemail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Ross Schmidt <ross.schm.dev@gmail.com>
Cc: Marco Cesati <marcocesati@gmail.com>
Cc: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/ath/ath10k/bmi.h         | 12 +++----
 drivers/scsi/qla4xxx/ql4_def.h                |  4 +--
 drivers/staging/r8188eu/include/ieee80211.h   |  6 ++--
 drivers/staging/rtl8712/ieee80211.h           |  4 +--
 drivers/staging/rtl8723bs/include/ieee80211.h |  6 ++--
 include/linux/ieee80211.h                     | 34 +++++++++----------
 include/uapi/linux/dlm_device.h               |  4 +--
 7 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.h b/drivers/net/wireless/ath/ath10k/bmi.h
index f6fadcbdd86e..7a9bb97d45c1 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.h
+++ b/drivers/net/wireless/ath/ath10k/bmi.h
@@ -109,7 +109,7 @@ struct bmi_cmd {
 		struct {
 			__le32 addr;
 			__le32 len;
-			u8 payload[0];
+			u8 payload[];
 		} write_mem;
 		struct {
 			__le32 addr;
@@ -138,18 +138,18 @@ struct bmi_cmd {
 		} rompatch_uninstall;
 		struct {
 			__le32 count;
-			__le32 patch_ids[0]; /* length of @count */
+			__le32 patch_ids[]; /* length of @count */
 		} rompatch_activate;
 		struct {
 			__le32 count;
-			__le32 patch_ids[0]; /* length of @count */
+			__le32 patch_ids[]; /* length of @count */
 		} rompatch_deactivate;
 		struct {
 			__le32 addr;
 		} lz_start;
 		struct {
 			__le32 len; /* max BMI_MAX_DATA_SIZE */
-			u8 payload[0]; /* length of @len */
+			u8 payload[]; /* length of @len */
 		} lz_data;
 		struct {
 			u8 name[BMI_NVRAM_SEG_NAME_SZ];
@@ -159,9 +159,7 @@ struct bmi_cmd {
 } __packed;
 
 union bmi_resp {
-	struct {
-		u8 payload[0];
-	} read_mem;
+	flex_array(u8 payload[]) read_mem;
 	struct {
 		__le32 result;
 	} execute;
diff --git a/drivers/scsi/qla4xxx/ql4_def.h b/drivers/scsi/qla4xxx/ql4_def.h
index 031569c496e5..69a590546bf9 100644
--- a/drivers/scsi/qla4xxx/ql4_def.h
+++ b/drivers/scsi/qla4xxx/ql4_def.h
@@ -366,13 +366,13 @@ struct qla4_work_evt {
 		struct {
 			enum iscsi_host_event_code code;
 			uint32_t data_size;
-			uint8_t data[0];
+			uint8_t data[];
 		} aen;
 		struct {
 			uint32_t status;
 			uint32_t pid;
 			uint32_t data_size;
-			uint8_t data[0];
+			uint8_t data[];
 		} ping;
 	} u;
 };
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index bc5b030e9c40..9204dd42f319 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -185,7 +185,7 @@ struct ieee_param {
 		struct {
 			u32 len;
 			u8 reserved[32];
-			u8 data[0];
+			u8 data[];
 		} wpa_ie;
 		struct {
 			int command;
@@ -198,7 +198,7 @@ struct ieee_param {
 			u8 idx;
 			u8 seq[8]; /* sequence counter (set: RX, get: TX) */
 			u16 key_len;
-			u8 key[0];
+			u8 key[];
 		} crypt;
 #ifdef CONFIG_88EU_AP_MODE
 		struct {
@@ -210,7 +210,7 @@ struct ieee_param {
 		} add_sta;
 		struct {
 			u8	reserved[2];/* for set max_num_sta */
-			u8	buf[0];
+			u8	buf[];
 		} bcn_ie;
 #endif
 
diff --git a/drivers/staging/rtl8712/ieee80211.h b/drivers/staging/rtl8712/ieee80211.h
index 61eff7c5746b..65ceaca9b51e 100644
--- a/drivers/staging/rtl8712/ieee80211.h
+++ b/drivers/staging/rtl8712/ieee80211.h
@@ -78,7 +78,7 @@ struct ieee_param {
 		struct {
 			u32 len;
 			u8 reserved[32];
-			u8 data[0];
+			u8 data[];
 		} wpa_ie;
 		struct {
 			int command;
@@ -91,7 +91,7 @@ struct ieee_param {
 			u8 idx;
 			u8 seq[8]; /* sequence counter (set: RX, get: TX) */
 			u16 key_len;
-			u8 key[0];
+			u8 key[];
 		} crypt;
 	} u;
 };
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index d6236f5b069d..c11d7e2d2347 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -172,7 +172,7 @@ struct ieee_param {
 		struct {
 			u32 len;
 			u8 reserved[32];
-			u8 data[0];
+			u8 data[];
 		} wpa_ie;
 	        struct{
 			int command;
@@ -185,7 +185,7 @@ struct ieee_param {
 			u8 idx;
 			u8 seq[8]; /* sequence counter (set: RX, get: TX) */
 			u16 key_len;
-			u8 key[0];
+			u8 key[];
 		} crypt;
 		struct {
 			u16 aid;
@@ -196,7 +196,7 @@ struct ieee_param {
 		} add_sta;
 		struct {
 			u8 reserved[2];/* for set max_num_sta */
-			u8 buf[0];
+			u8 buf[];
 		} bcn_ie;
 	} u;
 };
diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index a6730072d13a..195084289078 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -1101,7 +1101,7 @@ struct ieee80211_mgmt {
 			__le16 auth_transaction;
 			__le16 status_code;
 			/* possibly followed by Challenge text */
-			u8 variable[0];
+			u8 variable[];
 		} __packed auth;
 		struct {
 			__le16 reason_code;
@@ -1110,26 +1110,26 @@ struct ieee80211_mgmt {
 			__le16 capab_info;
 			__le16 listen_interval;
 			/* followed by SSID and Supported rates */
-			u8 variable[0];
+			u8 variable[];
 		} __packed assoc_req;
 		struct {
 			__le16 capab_info;
 			__le16 status_code;
 			__le16 aid;
 			/* followed by Supported rates */
-			u8 variable[0];
+			u8 variable[];
 		} __packed assoc_resp, reassoc_resp;
 		struct {
 			__le16 capab_info;
 			__le16 status_code;
-			u8 variable[0];
+			u8 variable[];
 		} __packed s1g_assoc_resp, s1g_reassoc_resp;
 		struct {
 			__le16 capab_info;
 			__le16 listen_interval;
 			u8 current_ap[ETH_ALEN];
 			/* followed by SSID and Supported rates */
-			u8 variable[0];
+			u8 variable[];
 		} __packed reassoc_req;
 		struct {
 			__le16 reason_code;
@@ -1140,19 +1140,17 @@ struct ieee80211_mgmt {
 			__le16 capab_info;
 			/* followed by some of SSID, Supported rates,
 			 * FH Params, DS Params, CF Params, IBSS Params, TIM */
-			u8 variable[0];
+			u8 variable[];
 		} __packed beacon;
-		struct {
-			/* only variable items: SSID, Supported rates */
-			u8 variable[0];
-		} __packed probe_req;
+		/* only variable items: SSID, Supported rates */
+		flex_array(u8 variable[]) __packed probe_req;
 		struct {
 			__le64 timestamp;
 			__le16 beacon_int;
 			__le16 capab_info;
 			/* followed by some of SSID, Supported rates,
 			 * FH Params, DS Params, CF Params, IBSS Params */
-			u8 variable[0];
+			u8 variable[];
 		} __packed probe_resp;
 		struct {
 			u8 category;
@@ -1161,16 +1159,16 @@ struct ieee80211_mgmt {
 					u8 action_code;
 					u8 dialog_token;
 					u8 status_code;
-					u8 variable[0];
+					u8 variable[];
 				} __packed wme_action;
 				struct{
 					u8 action_code;
-					u8 variable[0];
+					u8 variable[];
 				} __packed chan_switch;
 				struct{
 					u8 action_code;
 					struct ieee80211_ext_chansw_ie data;
-					u8 variable[0];
+					u8 variable[];
 				} __packed ext_chan_switch;
 				struct{
 					u8 action_code;
@@ -1186,7 +1184,7 @@ struct ieee80211_mgmt {
 					__le16 timeout;
 					__le16 start_seq_num;
 					/* followed by BA Extension */
-					u8 variable[0];
+					u8 variable[];
 				} __packed addba_req;
 				struct{
 					u8 action_code;
@@ -1202,11 +1200,11 @@ struct ieee80211_mgmt {
 				} __packed delba;
 				struct {
 					u8 action_code;
-					u8 variable[0];
+					u8 variable[];
 				} __packed self_prot;
 				struct{
 					u8 action_code;
-					u8 variable[0];
+					u8 variable[];
 				} __packed mesh_action;
 				struct {
 					u8 action;
@@ -1250,7 +1248,7 @@ struct ieee80211_mgmt {
 					u8 toa[6];
 					__le16 tod_error;
 					__le16 toa_error;
-					u8 variable[0];
+					u8 variable[];
 				} __packed ftm;
 			} u;
 		} __packed action;
diff --git a/include/uapi/linux/dlm_device.h b/include/uapi/linux/dlm_device.h
index f880d2831160..e83954c69fff 100644
--- a/include/uapi/linux/dlm_device.h
+++ b/include/uapi/linux/dlm_device.h
@@ -45,13 +45,13 @@ struct dlm_lock_params {
 	void __user *bastaddr;
 	struct dlm_lksb __user *lksb;
 	char lvb[DLM_USER_LVB_LEN];
-	char name[0];
+	char name[];
 };
 
 struct dlm_lspace_params {
 	__u32 flags;
 	__u32 minor;
-	char name[0];
+	char name[];
 };
 
 struct dlm_purge_params {
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
