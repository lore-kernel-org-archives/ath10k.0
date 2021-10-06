Return-Path: <SRS0=0INN=O2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D742C433EF
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:54:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A2C0611C1
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A2C0611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNJpHW9d8x1yUkAwVjCo9P2l3yPhBkMNzFFSil11q7Y=; b=H5m/ol/xjDEfS3
	ugIET+iKri+ztVadDv09D3yXdSZiCZ3hoNrScdyBpRCfLvIDChh3PabAPeNCIQv6xnYn23W06G7nX
	R6Df1s1YgbKnOQ72+u2ISoEP+F4ufFLHvLeclzZPfT7pwxc33Kc6SxML21R3TxZ6ePZ3kkvS4oh2b
	og0KeQX2V2DvR2yASlHnK1aIF7/U4DXkw5zXon1HssTzh+pKkc2Rjh1Tx4+WQhDLb4y2hM7T8uPVu
	y7xNvKP5rEEl0ot9XMgnGxMqF1ov7ahgz4s+pc1HBh8mqX2IWy3GRVgtkAFBUneqNOd52rkSfHFTb
	+8AA+BFxcYxBvD5ctPtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXy0i-00Ci3o-NV; Wed, 06 Oct 2021 03:54:28 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXy0W-00Chw0-Uz
 for ath10k@lists.infradead.org; Wed, 06 Oct 2021 03:54:20 +0000
Received: by mail-lf1-x129.google.com with SMTP id t9so4632287lfd.1
 for <ath10k@lists.infradead.org>; Tue, 05 Oct 2021 20:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xiLuOKz2kvk1cz4G50uNXXciKxmoQzaWMMylpBwCLy8=;
 b=polX0w89CVBCN2mcuowNKfbRPyuzDIzwQxcUMvp3pSgIs1y7JVQpWtngRvq+waMU7b
 YNbLlO3w4Xb2/8f6XEubs/qJUOtQznrQBL7S2ecUcLV70S99fUjf2ZLGhnphtztogFJD
 w2ISSBLMGCOuMxGu1HjknOvyTtLj1b6S+cTqqBQr2EFtcwZaBnukHF8D0cMZM0tnx0nI
 uCV3MQ398im1coHH4Usy3IV2fXVi0Fbt1Xaj7AZyBH+aVkmKGsxd3nbtmF9TFr7DYgvV
 K4jnBP31CLG9cegrjQl9fWMYbNN4TUdiby8W9Rl0yr8BmdtlXAb9MIJWsfalRQ0iUxqQ
 XBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xiLuOKz2kvk1cz4G50uNXXciKxmoQzaWMMylpBwCLy8=;
 b=pjJXnzuqn+mSFGpPn4+AjpGl6kGveZqYkPGbpBY0FsMyEFp+/vvLtpyXsNIMOHBKBY
 xH0B5UtFGq1e+jaOfEeM/iU9JEphs9S+odF6laQyCxbY0caQLKAjkSPTvgptTB+nRD6K
 MlFx/ZtWqs4PFZuKZu8PQLA30AiiT/gNIFb2o8MWTraxScDrE/vvBidAVGgbRg0xFO3/
 pGjW42dSoKbQEEG8AOaOtjadbiIYf70oFVDu6qgPDhR/nS1I+tYBcsiBsRn9qXrQwfCM
 GeR8tvE8EtxLqMftSmAnaFZ1j+GAjrhipDjI8iIAugOrY3yacfVGM6d1LsXP9NBPymFR
 pUZw==
X-Gm-Message-State: AOAM533tPdWv6M8hh7GQkgbe4mAMFCQ6bVALHTTwAXPwV/8g53gB4VPi
 26qKF9mY402tE1IcVwspCHpbyw==
X-Google-Smtp-Source: ABdhPJzlegaIltE1SIs8lAxvicfs57o+JcqU51cspIdlK5w/V62EiVjwgLcERznirqVXN7f7frEROg==
X-Received: by 2002:ac2:4e0d:: with SMTP id e13mr7012924lfr.560.1633492455635; 
 Tue, 05 Oct 2021 20:54:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s4sm2142967lfd.103.2021.10.05.20.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 20:54:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v1 05/15] pwrseq: implement onecell helper
Date: Wed,  6 Oct 2021 06:53:57 +0300
Message-Id: <20211006035407.1147909-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_205417_043109_68D92948 
X-CRM114-Status: GOOD (  12.85  )
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

Provide of_pwrseq_xlate_onecell() - a helper easing implementation of
power sequencers using one cell to determine pwrseq instance to return.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/power/pwrseq/core.c   | 26 ++++++++++++++++++++++++++
 include/linux/pwrseq/driver.h | 12 ++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/power/pwrseq/core.c b/drivers/power/pwrseq/core.c
index 0aaba4e79a44..3dffa52f65ee 100644
--- a/drivers/power/pwrseq/core.c
+++ b/drivers/power/pwrseq/core.c
@@ -449,6 +449,32 @@ struct pwrseq_provider *__devm_of_pwrseq_provider_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(__devm_of_pwrseq_provider_register);
 
+/**
+ * of_pwrseq_xlate_single() - returns the pwrseq instance from pwrseq provider using single index
+ * @data: the pwrseq provider data, struct pwrseq_onecell_data
+ * @args: of_phandle_args containing single integer index
+ *
+ * Intended to be used by pwrseq provider for the common case where
+ * #pwrseq-cells is 1. It will return corresponding pwrseq instance.
+ */
+struct pwrseq *of_pwrseq_xlate_onecell(void *data, struct of_phandle_args *args)
+{
+	struct pwrseq_onecell_data *pwrseq_data = data;
+	unsigned int idx;
+
+	if (args->args_count != 1)
+		return ERR_PTR(-EINVAL);
+
+	idx = args->args[0];
+	if (idx >= pwrseq_data->num) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return pwrseq_data->pwrseqs[idx];
+}
+EXPORT_SYMBOL_GPL(of_pwrseq_xlate_onecell);
+
 static int __init pwrseq_core_init(void)
 {
 	return class_register(&pwrseq_class);
diff --git a/include/linux/pwrseq/driver.h b/include/linux/pwrseq/driver.h
index 0ca1d0311ab6..8d46940981bf 100644
--- a/include/linux/pwrseq/driver.h
+++ b/include/linux/pwrseq/driver.h
@@ -157,4 +157,16 @@ static inline struct pwrseq *of_pwrseq_xlate_single(void *data,
 	return data;
 }
 
+/**
+ * struct pwrseq_onecell_data - pwrseq data for of_pwrseq_xlate_onecell
+ * @num: amount of instances in @owrseqs
+ * @pwrseqs: array of pwrseq instances
+ */
+struct pwrseq_onecell_data {
+	unsigned int num;
+	struct pwrseq *pwrseqs[];
+};
+
+struct pwrseq *of_pwrseq_xlate_onecell(void *data, struct of_phandle_args *args);
+
 #endif /* __LINUX_PWRSEQ_DRIVER_H__ */
-- 
2.33.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
