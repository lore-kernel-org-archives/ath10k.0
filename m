Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939B9C433E6
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 00:43:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D40064E4F
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 00:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D40064E4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pYNsW0P4YxjSq5o1VIFLDbmNa/GAnE6H2oStIa25SO0=; b=DPA2nZahT8LY7WNssDuB2PWg8
	HCPgscE3EmJrhbb0Ntpnd20qjO10vXxm+zAtcyw8ST73qLcDnCDaohd9yn5TBp2mA0zO9hIiNiaRQ
	2soSiSc01zU4zFBBCDcIAqa1sIUxxtOmhBtGMPz2pzzXoa/q8YPXBPc85FnnkENMEMTPXDo7iDzdZ
	gM2XdxZMUxXiGJkMHMQllm3YkaJKjXPs0HB1D9hy2szPTuT4cVaM6bysZOIsOwn5DTpivOOhtqCXq
	Eqh7gx+rOBnMGQhhPgUgkgJn1LA9t1QQ2F4tMt1shvkt8YZ7rjt24frxyyoNBE9OhSjveCUTWdCpe
	XUA5QklVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9daZ-0001EI-Q1; Wed, 10 Feb 2021 00:42:39 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9daX-0001DV-0r
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 00:42:37 +0000
Received: by mail-ot1-x329.google.com with SMTP id c16so309833otp.0
 for <ath10k@lists.infradead.org>; Tue, 09 Feb 2021 16:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ZnFgpWZW/pibsdLxTLSbnISeByhzyHarQxXUqXKzeg=;
 b=hItZCUkUv3hVP0EKFKWGCHiq7LK6jTKvkwxQLRTVv+G2duyo63PGIc8YpI3DXE6v6Q
 93/TWf1dv1X8blaa5DeXeJ06ryE89D1TQkJDMHeu8+4PcwShh/BskEUrk4FnAjGukA1/
 b6mCu9NEcGcDsOJPB1nb3PYD86+w1ds5Zeedg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ZnFgpWZW/pibsdLxTLSbnISeByhzyHarQxXUqXKzeg=;
 b=fB4eUJY1tyoRBCcgnOYEO4yixrQjNUjCNqD33JFzpUZdc7VzF1IYKWdxXKd0Grv1lK
 caASVRk2L7+TBGSDmdpGuVndr7+6PJ3ySymLaJYjD6QzOsHMocZUxiH2cWGTgtAJS6oI
 xGuo09KovE/ACHrBKX0Lnj9UzMqmerY3kR6/J3oDKYC8OmGni1sDGUF2hPWu76/r62aZ
 pnlwhusJmZIN7cCHt0I/sYlQdiXnZGFMsRqycWHz97k1s4vWfD2Tcxb4ZJVSQ3V1vRcO
 EWcO4pTJc2PwSpQ80/jxuh/FElhETegSYak/WJ9UnRhr7ipOZfvdqZ/iD8MERWhUpEmk
 bEug==
X-Gm-Message-State: AOAM530grgGyfAI0vNrhTwvPbOBFT8AWXjwnGryekNUcjV+tEr16qUFa
 dRFfCSI+JDEigqPkCQrbEKCkQw==
X-Google-Smtp-Source: ABdhPJweKOk0U05wNNP7z8KOUn9C3PAmUn3jmo0QzHPBvGkR1giuIk30fNASdJrHyDRZtCLGpIiDCQ==
X-Received: by 2002:a9d:4e2:: with SMTP id 89mr259973otm.140.1612917755107;
 Tue, 09 Feb 2021 16:42:35 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id s123sm103060oos.3.2021.02.09.16.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:42:34 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH 3/5] ath10k: change ath10k_offchan_tx_work() peer present msg
 to a warn
Date: Tue,  9 Feb 2021 17:42:24 -0700
Message-Id: <3b1f71272d56ee1d7f567fbce13bdb56cc06d342.1612915444.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1612915444.git.skhan@linuxfoundation.org>
References: <cover.1612915444.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_194237_088561_35AD4D74 
X-CRM114-Status: GOOD (  11.28  )
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

Based on the comment block in this function and the FIXME for this, peer
being present for the offchannel tx is unlikely. Peer is deleted once tx
is complete. Change peer present msg to a warn to detect this condition.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e815aab412d7..53f92945006f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3954,9 +3954,8 @@ void ath10k_offchan_tx_work(struct work_struct *work)
 		spin_unlock_bh(&ar->data_lock);
 
 		if (peer)
-			/* FIXME: should this use ath10k_warn()? */
-			ath10k_dbg(ar, ATH10K_DBG_MAC, "peer %pM on vdev %d already present\n",
-				   peer_addr, vdev_id);
+			ath10k_warn(ar, "peer %pM on vdev %d already present\n",
+				    peer_addr, vdev_id);
 
 		if (!peer) {
 			ret = ath10k_peer_create(ar, NULL, NULL, vdev_id,
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
