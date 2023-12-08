Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8E8C4167B
	for <ath10k@archiver.kernel.org>; Fri,  8 Dec 2023 04:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MzdoGtdHZLEcq5pMBvJRDZhfXWWnoZDZDt/RPy/Z6xs=; b=g3XaMLudIflMtkhOcNsLFLW+rG
	ncZt4LTPJGyXr8IqifnGyL8RBuBlnvHudoVyXxkXOL5Xfcz3MvOuxRYLO2kzKH7dqI/3YRO/kpqPq
	vLwydEY/POpOKSoUxkgo0yLc+jSvxZm0sIzYkA/6DunkN5aOQPjL9n08gFJpJzAEFgaN8eqjtDADO
	+d1lW56DlGtPF1hKMqccfMtRyOvU1HHm1ks83JfUTYp8I22wMj5LGm1t1kvtmGkJ0YGMbTpOUJY2u
	qGYrqLX5LMwpbBN1N4jTEZ2TlW88jKvyvd5JFNf6SBGeaRpADjhQIHMDS/UEmOifu6GPosWhHs8Fk
	gwyjCJqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBSZZ-00EgXp-0G;
	Fri, 08 Dec 2023 04:34:45 +0000
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBSZV-00EgXQ-2c
	for ath10k@lists.infradead.org;
	Fri, 08 Dec 2023 04:34:43 +0000
Received: by mail-oo1-xc44.google.com with SMTP id 006d021491bc7-58d08497aa1so839895eaf.0
        for <ath10k@lists.infradead.org>; Thu, 07 Dec 2023 20:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702010080; x=1702614880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzdoGtdHZLEcq5pMBvJRDZhfXWWnoZDZDt/RPy/Z6xs=;
        b=RhzUFfmSMFFhwNOCEn2IO0CJKlIIqoSaNPsFQOLTsSK4vL5tnucGtiKLCkVGdjT8Hv
         kl9drqXp3ab5eF9TEos7YGw9NrkM+9ZOzXfyAewatkOCETUuec56rlMaMi4ILhBrJR8G
         +ptOaKrh+8OhbRH50atXfqNlFKONOBDJYLL5CJ0UAGptAsMZG4Grdf4aVuphvC0jfd9c
         6yNvK1IwK4w5C3AaknG263Nr+xmWzMZzrg+aN2vIh8bkFLHuMynVgDtkd2Cy/CR45qr+
         rfOkZulqgvQCkr12i/SbAk62x/V9xN9uUxxiRg+kor2OVOgB2tQgom0teD5KrMBz2/VV
         3cgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702010080; x=1702614880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzdoGtdHZLEcq5pMBvJRDZhfXWWnoZDZDt/RPy/Z6xs=;
        b=G2OUCoJQA5n1TTSlKLxws9X4HcKLm/6i2jyN3DdMTlAdnloDGcPmuWfLX1NzNzzkUK
         tIBouiR+7gG19gSBC1tsNVc4K9j4dDbzJoQ/YHD0cGH5lOR42eCII3kzQXZmtZGiE6Om
         nKyfXbC0E1LMCSmdS3I2qzUFWAZeMJRyRZXSczw5ukgRb8OLIUJlhY+7WZFyzb3bCsYa
         UTDB5tToATiol47vEGARJ0jMr5jNytwgbS43bpxOQFFJ5TyiidDgoYFQIyj7MpuJX9/S
         eKExz/6nSlNTx7ZwfXL0+gAFzeOf3vTL1egTDidJr8bRIwytyVrCdNd4hD6pKFA7ijgK
         TYlQ==
X-Gm-Message-State: AOJu0YxUK6reRDlgLiUyd5jCkExsd7DVRUbu9nFBk9ujy6Z02KASbwWx
	JfULzKX16dO5ARuVvN877pU=
X-Google-Smtp-Source: AGHT+IHwbZG0kRlAsNtdu+0sGh4J/wEBGtXiM5SFj7ehSi0/JEn2pS/DRM/JW/QkcFKYJdOOCfAmRg==
X-Received: by 2002:a05:6358:60c1:b0:170:8da:1f50 with SMTP id i1-20020a05635860c100b0017008da1f50mr4060520rwi.20.1702010080287;
        Thu, 07 Dec 2023 20:34:40 -0800 (PST)
Received: from localhost ([113.88.15.172])
        by smtp.gmail.com with ESMTPSA id ff16-20020a056a002f5000b006ce65bf5376sm613293pfb.75.2023.12.07.20.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 20:34:39 -0800 (PST)
From: Xingyuan Mo <hdthky0@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER)
Cc: linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS)),
	Xingyuan Mo <hdthky0@gmail.com>
Subject: [PATCH v2] wifi: ath10k: fix NULL pointer dereference in ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev()
Date: Fri,  8 Dec 2023 12:34:33 +0800
Message-Id: <20231208043433.271449-1-hdthky0@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_203441_845998_006EC8FB 
X-CRM114-Status: UNSURE (   7.01  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

We should check whether the WMI_TLV_TAG_STRUCT_MGMT_TX_COMPL_EVENT tlv is
present before accessing it, otherwise a null pointer deference error will
occur.

Fixes: dc405152bb64 ("ath10k: handle mgmt tx completion event")
Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
---
Compared with the previous version, Signed-off-by and Fixes tags are added.

 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 6b6aa3c36744..0ce08e9a0a3d 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -851,6 +851,10 @@ ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev(struct ath10k *ar, struct sk_buff *skb,
 	}
 
 	ev = tb[WMI_TLV_TAG_STRUCT_MGMT_TX_COMPL_EVENT];
+	if (!ev) {
+		kfree(tb);
+		return -EPROTO;
+	}
 
 	arg->desc_id = ev->desc_id;
 	arg->status = ev->status;
-- 
2.34.1


