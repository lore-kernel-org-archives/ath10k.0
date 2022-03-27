Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156B8C433F5
	for <ath10k@archiver.kernel.org>; Sun, 27 Mar 2022 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iYmwW64IDFnf5Z9dypHPFQaUo536ljdjkJoGZPF+rSM=; b=uMx3ZnPF6nSl/I
	IX3x5ZhTkUdhK2HLfm/dHNKGRqB5hmFf4MKnPrLZPPxZ5VkX4blJOqNbPiytUiWBRm3ERUs8T8Zc3
	eV6N7TohxOfoYHNaqoUbii8AEABN1WxLaQqatnEwflyuzLlyJ9o/t4ERtp/NDHeG/B0iK5bzlNExk
	eCADXoZNpPbhSM9lzf7sCp8qMdFkzGyje7L9CKW2XQKhYSkQjnoGk1QXIRO34vyYl4WdTxZjbIafa
	Kc9sW0nd+QpDkFt9e63qFKB01E9mQE11m+p1VA0Uoo7Ry4i4HVmAB4dT4P8Ea6cToOqMLVSyGqpoz
	dqcbPPheXp9VJnUmkNew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYWSs-005n4n-5s; Sun, 27 Mar 2022 17:14:06 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYWSp-005n43-MF
 for ath10k@lists.infradead.org; Sun, 27 Mar 2022 17:14:04 +0000
Received: by mail-ej1-x634.google.com with SMTP id dr20so24251835ejc.6
 for <ath10k@lists.infradead.org>; Sun, 27 Mar 2022 10:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uJiZgtMpnnKZghJq9M/2REIUrPjoQgvKIygn28S38dc=;
 b=lZ2FfcaQ/aIDDfkz687qiDg4ajAlSGHHaFC2y7CgBFbcAUHE8ZwMsnHxhAfOOKP9z2
 owO40n0lSj68X47qdcdor+2PyB9Eslr7qVeYMji8uYGKQPZbHGq+JJh1+mxk/T4Y1sXy
 AaXYJV2D7hDAonZD2WXiXJAV9WMeko9FnAHOJ0hjuT9VUF7VOeMC5B+vw/JVCbomvhLp
 ZJ+tGUnNvjsYSCZ3Q43bW2Xad53rzufhDzRwir6Pd4pkgGsstUdYCxsqGodjK5ecbDVH
 Mi8RJjSH7wF8YYizBKzs0mBIgCbLKKI4yT+xmq5M+XOfLnZY6L+orwIjDAeTF7JKUq/Q
 KFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uJiZgtMpnnKZghJq9M/2REIUrPjoQgvKIygn28S38dc=;
 b=gIVSKN2dfyud1DSLg+3sFPNonOH762HkmUvQexoqZv+BcnG2rfyKKxezBv5esgfC/C
 qu4JqfyIFraDj1IMrGqn5gECGLachJwwejf7FmYNxgZMk9Z27VHECCW2mkE/WjeHTM1d
 OLKUpCWC1+xWsUcYWJGUeAXpVZHslpAKLjnSTmi2G8h+SYvp6C+e/1H+zEcRZPMIK8WD
 hJwQKhMIHP0x8brGzRvGUHUsR4BFKnosAJMj8S3O/XyeNKNXLdTIi4kSKfI9Ck8ussYE
 MoqQzMlVlFcOyVVx3nFDGrwPsBW9UadYwRb6kjmc5zAp4mKaJel3N6VkKevPWkfAAGvD
 6D6g==
X-Gm-Message-State: AOAM531TH265ajrG8AtCn1MkCShDugK/O55MsBCunm2RE6PN3asihYk8
 cLsFy+M/o8+1BefxU6t49kwIxFx4pQZto3Ru
X-Google-Smtp-Source: ABdhPJyr1tkcVLcBTPM00pRI6ySmJhP6cRynmCVqOHg8FVP8QfVpI8Hoiu6/GWIw8VFdVUM6wXsBFg==
X-Received: by 2002:a17:906:dc90:b0:6e0:1ef7:638f with SMTP id
 cs16-20020a170906dc9000b006e01ef7638fmr23154612ejc.234.1648401241220; 
 Sun, 27 Mar 2022 10:14:01 -0700 (PDT)
Received: from localhost.localdomain (81-233-89-221-no75.tbcn.telia.com.
 [81.233.89.221]) by smtp.gmail.com with ESMTPSA id
 o5-20020a170906974500b006dfc781498dsm4866769ejy.37.2022.03.27.10.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 10:14:00 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
To: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, davem@davemloft.net, kuba@kernel.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 1/2] ath10k: add support for MSDU IDs for USB devices
Date: Sun, 27 Mar 2022 19:13:39 +0200
Message-Id: <20220327171340.7893-1-erik.stromdahl@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_101403_763738_197EE6F8 
X-CRM114-Status: UNSURE (   9.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

commit 93bbdec6683e1c8ba2cc4e6 ("ath10k: htt: support MSDU ids with
SDIO") introduced MSDU ID allocation in the htt TX path for high latency
devices. This feature needs to be enabled for USB as well in order to
have a functional TX path.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 3d98f19c6ec8..7ed2022ac3c2 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1013,6 +1013,7 @@ static int ath10k_usb_probe(struct usb_interface *interface,
 	bus_params.dev_type = ATH10K_DEV_TYPE_HL;
 	/* TODO: don't know yet how to get chip_id with USB */
 	bus_params.chip_id = 0;
+	bus_params.hl_msdu_ids = true;
 	ret = ath10k_core_register(ar, &bus_params);
 	if (ret) {
 		ath10k_warn(ar, "failed to register driver core: %d\n", ret);
-- 
2.35.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
