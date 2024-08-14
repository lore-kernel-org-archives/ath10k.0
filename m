Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66405C52D7B
	for <ath10k@archiver.kernel.org>; Wed, 14 Aug 2024 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGHGrfhVZGCi7ebZvtlasyvLsOQ+wsjF4xpmwarBNSQ=; b=AIoj3/3ScwFPwOT5rje9R+Owvb
	aQn1EBuAtxIv/AIbohRBZicJuXGLPACSvpF7MtBWGojbYtDlVo5LwBJQf+AhgHvlllqnVn8idsO2Q
	kRB/cfWyVpcN/vIneHAoXKNi3jus9DtblAlSCstH+IOBEoHqOeva2K8tgUZIokBcbheiKQDmriVM7
	HwdUaKNmnLMpp0SQHmJeKdQwam6wEvWNEZU3WlzistOvvVi4N05rRcocA5hAK/ZSGlKXgIzrplfhU
	CGUxfaeFVWCUuAuVh+Juew3GSsyf/mwT1JUYI0mYlBtlaTPp7bU5k83ufYTOqnWQiodISRo+ezqKQ
	fmsCY7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seH8D-00000007iZ7-497I;
	Wed, 14 Aug 2024 16:45:53 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seH80-00000007iSy-0TB9
	for ath10k@lists.infradead.org;
	Wed, 14 Aug 2024 16:45:41 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-530e2287825so50431e87.1
        for <ath10k@lists.infradead.org>; Wed, 14 Aug 2024 09:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723653938; x=1724258738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGHGrfhVZGCi7ebZvtlasyvLsOQ+wsjF4xpmwarBNSQ=;
        b=Pz4W72cZ8+FxNaR9g7iyufP0n+sl9aj3Ejkj2Jk5Ubn09balOABz9I7jELzb09sjOr
         50RWZwRNLfYNLzhRB6+AIT4YszRhpnJjuKdouoALd2aEc70d5PLIXS6dg964PH6MLyZ6
         KsNQLPYjZM/SBd4iAT5o6y6mgxEEDXPTxFJiTujshRw8mrjM7q2EefR9gUf26wrfvbU0
         iBEVqvWcOqyZO+qa3tJTQM+SYbvRdRXVxmlQQRWFpdV+fiikrJxPdsiuzhp4ek2FgorP
         53LjleazWK+YgLDqExZ6qqGdYnWUjHOYreO5DL2XqCv5qK1KwfxQrmVRv4OiVt3XZexD
         KPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723653938; x=1724258738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGHGrfhVZGCi7ebZvtlasyvLsOQ+wsjF4xpmwarBNSQ=;
        b=uchW/HfJbPb/vYbGos+omPoA+kwcTJSX7n/AgcdFd0xBY4LsPSLjDNauH9QPOHSF02
         lk3IdTOMOhDDNxniLsCX+VvHg3tLBLnWWvHMG4BWrekIAzo8+tnX7yYfozv1KzU8KZuE
         8+6whC+XjbIimaB0jX2HMacirI6TrsLa7DYru/wKrpFOMY4gdd83RySkBNTkwCkLKe3t
         olM63WWR8YLJgXqrZx7vMa3V37vS62BBwCGcIhnNBnM9niX5AAHkPJ0d7UwU69cX62wW
         6gBJ1WbHgVKahUqAAWHtcNU9PH/PFQwExQzglX+nroAfNC0jdEPuG3osYgnJH+dVRThY
         cjug==
X-Gm-Message-State: AOJu0Yxojp5HYXdA/1lhmfKuzAACnrALnuBeSJUPVarvzENG2/+ztmPi
	nT+WnozevGctUZdGRv3K1tGmsiuTgOrlmSZqYFGQVFlwiT4qhokivEULSg==
X-Google-Smtp-Source: AGHT+IGVg6Z0mt0BxnC93MsDZoAr+SShVFVo+bU62HnJUJOcbpwqge9ERHZqtEV57lc9gM3wwjbHyA==
X-Received: by 2002:ac2:4e16:0:b0:52c:d80e:55a5 with SMTP id 2adb3069b0e04-532edbb301fmr2484707e87.41.1723653938262;
        Wed, 14 Aug 2024 09:45:38 -0700 (PDT)
Received: from LOCLAP699.vf-sint-niklaas.locus ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3f475ccsm196326166b.14.2024.08.14.09.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 09:45:37 -0700 (PDT)
From: James Prestwood <prestwoj@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	James Prestwood <prestwoj@gmail.com>
Subject: [RFC 1/1] wifi: ath10k: reduce timeout for disabling a key
Date: Wed, 14 Aug 2024 09:45:07 -0700
Message-Id: <20240814164507.996303-2-prestwoj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814164507.996303-1-prestwoj@gmail.com>
References: <20240814164507.996303-1-prestwoj@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_094540_176834_AFE118A3 
X-CRM114-Status: GOOD (  14.71  )
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

The QCA6174 experiences random cases of a key failing to be disabled.
The timeout for this currently is 3 seconds. This can happen on
roaming when removing the old key during the transition to the new
BSS. Though the roam will generally succeed (except with
some AP vendors, explained below) it means that it is delayed by 3
seconds until the timeout expires.

Certain AP vendors appear to have issues with this delay and either
ignore the subsequent reassociation, or reject it. This results in
a disconnect.

Since key removal is a non-fatal failure it feels somewhat safe to
reduce this timeout down in order to both reduce the potential
delay and play nice with APs that aren't able to handle the delay
between authentication and association.

Signed-off-by: James Prestwood <prestwoj@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index ec8d5b29bc72..fd20107abd0f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -301,6 +301,7 @@ static int ath10k_install_key(struct ath10k_vif *arvif,
 	struct ath10k *ar = arvif->ar;
 	int ret;
 	unsigned long time_left;
+	unsigned long timeout = (cmd == DISABLE_KEY) ? 1 : 3;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -313,7 +314,8 @@ static int ath10k_install_key(struct ath10k_vif *arvif,
 	if (ret)
 		return ret;
 
-	time_left = wait_for_completion_timeout(&ar->install_key_done, 3 * HZ);
+	time_left = wait_for_completion_timeout(&ar->install_key_done,
+						timeout * HZ);
 	if (time_left == 0)
 		return -ETIMEDOUT;
 
-- 
2.34.1


