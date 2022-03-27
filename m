Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D424FC433EF
	for <ath10k@archiver.kernel.org>; Sun, 27 Mar 2022 17:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZftMJ3VPHHOXb5SuYVHhTCK+NUsSCn3KA8NXXg7z/8=; b=zNsPXk/FL8HaUg
	yaR9u2XVUnX33rG31JfyDbxi37P1PIuGvdABg+4ILXF5c1S8GdiePBWTSJOq00fobWEE0FQ0gwVvV
	RfPm15lYSGui7gN7Mp+kMOnULVo8XwkOJ9R5mnFf2uIbyTNhxiS49Cjg5+fmHiWtZ4B6cHT0Y6p/j
	Pm0peKmQaCRowHA+gXeuuKobnpud6uhSu4X+LKP7fb3wGiqRCjU0SrSbzpGhESWgQywf0Coh/3ik9
	3q+4VKM8g0SctvHD5NMdtDIcgF7UsEE8FvPtYU+WUiYJIUp12hdbmfBXkV4H+tVwP9KG6f4VMHJMs
	zmQogY7y4ZYyovv/cSGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYWSt-005n4w-WA; Sun, 27 Mar 2022 17:14:08 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYWSp-005n45-R1
 for ath10k@lists.infradead.org; Sun, 27 Mar 2022 17:14:05 +0000
Received: by mail-ej1-x62f.google.com with SMTP id qa43so24228914ejc.12
 for <ath10k@lists.infradead.org>; Sun, 27 Mar 2022 10:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+O4s6ak/A5yinAv1VSo+xOscSi9+hU2/upvm8fRSKuM=;
 b=JSAYRtdM5YAkvcZnvrRyg7U/vqwjYG5lGK6c+tkEc3eL2fPCbrkPQ/TXdnf9ec3Tan
 ThPstqd4cZLmx9vgrgqH90IkWO8P7PiaJzpx/Ys5PRot23YqHx7c24YIulpHS7Fdbup6
 rB6JdDKIpgP2IpMZJkB5sZ9VcSCx1XbPPW61aeWlId8RDlZy//0ztLmrEd1N3XaTY3Rx
 tHgw0s47LXGzBD2mnpG1rNFmnRuM/bM4Y4u5cH436wbOFiHQm7aefVEhVbxhXTt28SBz
 smXUcDmL5V0MPK8uOLmJNFO2mADDHuuuaS4OFLlFT3QZjf5dEVAJM48wRVlRH4hqmeBQ
 Wm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+O4s6ak/A5yinAv1VSo+xOscSi9+hU2/upvm8fRSKuM=;
 b=Gx7wIy4+s0UtJ1MHvzYVRigQauUnOp33IOqAjKcFe9XIOe0s2hySJ2iz9qJkjnIwAP
 juSP8vE2S2SXpFurtkHsO1MxbSOUVaQ09pdF8QhnX7wyDKx7iCv0H6jJXBy/S1wRLcuF
 x6gXdQ6jrO6M7wuP8fr+I+Zihy/jCh3pCnGeL9awnw1/IP25cah/zlS/hiS77QUNf1Wm
 sg9puVbYXdd9c6diQGcFjUfjQKO5zSjc5NcuTNnbMYnK8A/5B/9XEYP5Q81nTL4yu42h
 JDjwgqTlLlDdTj64FcSYr1A6jYi/yJLfDV+fUeBScetrfJNiUAP2LYq0z8vbQKMjmsec
 UJLw==
X-Gm-Message-State: AOAM531pJhzzdAOKPluvxfWyJyo5DuwH2gR/JqYD5splorVXCdDgs7sR
 r//gnkbq4MFGHJ7ZDoSfCNg=
X-Google-Smtp-Source: ABdhPJz1yaBSXEbXGTItoOO5HcREi+w4C4NYq6bkDOjQ5jxqQAa9DHqXULxKBntzwXKnUUUEGMa9Yw==
X-Received: by 2002:a17:906:d555:b0:6db:148e:5cc with SMTP id
 cr21-20020a170906d55500b006db148e05ccmr22393408ejc.63.1648401242061; 
 Sun, 27 Mar 2022 10:14:02 -0700 (PDT)
Received: from localhost.localdomain (81-233-89-221-no75.tbcn.telia.com.
 [81.233.89.221]) by smtp.gmail.com with ESMTPSA id
 o5-20020a170906974500b006dfc781498dsm4866769ejy.37.2022.03.27.10.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 10:14:01 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
To: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, davem@davemloft.net, kuba@kernel.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 2/2] ath10k: enable napi on RX path for usb
Date: Sun, 27 Mar 2022 19:13:40 +0200
Message-Id: <20220327171340.7893-2-erik.stromdahl@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327171340.7893-1-erik.stromdahl@gmail.com>
References: <20220327171340.7893-1-erik.stromdahl@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_101403_903196_C1B2D354 
X-CRM114-Status: GOOD (  11.42  )
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

commit cfee8793a74dc3afabb08fc9 ("ath10k: enable napi on RX path for
sdio") introduced napi for SDIO and updated the htt interface for high
latency devices.

These changes breaks USB, so USB code must be updated to use napi as
well in order to have a working RX path.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/usb.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 7ed2022ac3c2..10df6ca303a1 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -345,6 +345,12 @@ static void ath10k_usb_rx_complete(struct ath10k *ar, struct sk_buff *skb)
 	ep->ep_ops.ep_rx_complete(ar, skb);
 	/* The RX complete handler now owns the skb... */
 
+	if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags)) {
+		local_bh_disable();
+		napi_schedule(&ar->napi);
+		local_bh_enable();
+	}
+
 	return;
 
 out_free_skb:
@@ -387,6 +393,7 @@ static int ath10k_usb_hif_start(struct ath10k *ar)
 	int i;
 	struct ath10k_usb *ar_usb = ath10k_usb_priv(ar);
 
+	ath10k_core_napi_enable(ar);
 	ath10k_usb_start_recv_pipes(ar);
 
 	/* set the TX resource avail threshold for each TX pipe */
@@ -462,6 +469,7 @@ static int ath10k_usb_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 static void ath10k_usb_hif_stop(struct ath10k *ar)
 {
 	ath10k_usb_flush_all(ar);
+	ath10k_core_napi_sync_disable(ar);
 }
 
 static u16 ath10k_usb_hif_get_free_queue_number(struct ath10k *ar, u8 pipe_id)
@@ -966,6 +974,20 @@ static int ath10k_usb_create(struct ath10k *ar,
 	return ret;
 }
 
+static int ath10k_usb_napi_poll(struct napi_struct *ctx, int budget)
+{
+	struct ath10k *ar = container_of(ctx, struct ath10k, napi);
+	int done;
+
+	done = ath10k_htt_rx_hl_indication(ar, budget);
+	ath10k_dbg(ar, ATH10K_DBG_USB, "napi poll: done: %d, budget:%d\n", done, budget);
+
+	if (done < budget)
+		napi_complete_done(ctx, done);
+
+	return done;
+}
+
 /* ath10k usb driver registered functions */
 static int ath10k_usb_probe(struct usb_interface *interface,
 			    const struct usb_device_id *id)
@@ -992,6 +1014,9 @@ static int ath10k_usb_probe(struct usb_interface *interface,
 		return -ENOMEM;
 	}
 
+	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_usb_napi_poll,
+		       ATH10K_NAPI_BUDGET);
+
 	usb_get_dev(dev);
 	vendor_id = le16_to_cpu(dev->descriptor.idVendor);
 	product_id = le16_to_cpu(dev->descriptor.idProduct);
@@ -1045,6 +1070,7 @@ static void ath10k_usb_remove(struct usb_interface *interface)
 		return;
 
 	ath10k_core_unregister(ar_usb->ar);
+	netif_napi_del(&ar_usb->ar->napi);
 	ath10k_usb_destroy(ar_usb->ar);
 	usb_put_dev(interface_to_usbdev(interface));
 	ath10k_core_destroy(ar_usb->ar);
-- 
2.35.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
