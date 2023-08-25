Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A606EE49A5
	for <ath10k@archiver.kernel.org>; Fri, 25 Aug 2023 20:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8+Kgd3FledgIv430Q3AmLtzTjQyay/V9gpaVFG/+cgc=; b=VbPSjCZTgVpdYL
	QrLwxXGgEqyBiz9kzI8RYx1hJez+aenvy/qDZI+IaBY90CRHNeRTs4AoRoTPluidt8VU9a6YylEqF
	TgTnqov8G75RrcruobMSFRlPDgwOcDHu2uXDuFzUqJF/CcFVQkjUChENR8ibiKIoVF20ECpiMJjQ0
	d8yVh2ACPIQvhpgaAMhGrUW8p99IdvopnDdOtxvLWr6ApZj1dJgZjddN2hXizaRN2O5lKM5TKeUyj
	UOMWc+rx2waTpnKJK3c+q7BDxN9a1QaFHOvLkAuCCyYb4PMyDMCqJI900XSZMrTBaQZUNOUh7vqq1
	V5xjoQ99a9dqimZoTKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZdNt-005zgx-2V;
	Fri, 25 Aug 2023 20:26:21 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZdNr-005zgY-09
	for ath10k@lists.infradead.org;
	Fri, 25 Aug 2023 20:26:20 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4ff882397ecso1958188e87.3
        for <ath10k@lists.infradead.org>; Fri, 25 Aug 2023 13:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692995173; x=1693599973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xaM+n+aR2UDKZm7iUT7Gwvf5Tkj3K+ENTupiFy9EIRM=;
        b=d+6hXyfJgp8FYokh0gN/o+8H/Ee5pknYUTber0r6DT528COCq9eOW9kcWGXq+nzMhp
         Ww/cKDdjj5io9Q+Y9ycxvOXRDW4tIOwHe5CzrKtvSJKhmiM5s7JDe4b1LU+UnnL/x0wf
         7iRGGWJHUrE9aEQjBu+nivWQQH2UioGGvqlxFeyaYPtQXEg386jCSgOzz0FpgiXNeXu7
         uLRF49iYzhYRPOZ9dAaWo/OulR7XPo+EoSHzzbeouFZi/wa1VGuD29WB3JyX/EitOaVU
         20+XJ5R+/9p0874Wsao8RxXhCrBsF/rAaIeXtYoTl5zFGCB2vBntt1Frtml9Ai+Heqfh
         k2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692995173; x=1693599973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xaM+n+aR2UDKZm7iUT7Gwvf5Tkj3K+ENTupiFy9EIRM=;
        b=f7zODYpK8bVB0a7r1Fe207hIkohksRmSYHAGj3JeRH+8NSmJb3fcbtO3UdjhbhSgcj
         S/0l+D2YnBgdLZuU4/Nb7A01tN8jWCUApXPvmlvCgR04ERFNYaptPSIo9Yi2n5qZ9BQv
         u36kvW5Pxo2X8AM0Zo27KEOqkrnrENc3By4lrmVsjCr3qcrq4x1qfoAT1PnqZ2AEPUAD
         boxKPcjvK5Z5Z8K1HMLzdTRMHbD0oML23rJ+o4PZ6mcnSC7s9MgpVcBTl5wclTUNOYKH
         yPgkMsfr//7YY4GjiMvSW/+Bw1v1dV/Jhdrj58Lglc/yPGEV6X3NoRWXCTV7RTFd87kJ
         VjDw==
X-Gm-Message-State: AOJu0Yy2SYwqnJFk94t4qgpFPlYcl7T+i+3jlnd26UjoXmSvjkgQLmdP
	V6zToZhGTwufxdqSQXaFj8tYuP40X5UnrJ0o4dw=
X-Google-Smtp-Source: AGHT+IHZWQsa/eM+b5ORUmm3jdem8a1l1zQoP4lM0kndRlNsDKQy0J1qYugkxq0XETuiLLIQcirrIw==
X-Received: by 2002:a05:6512:10d6:b0:4fb:744e:17db with SMTP id k22-20020a05651210d600b004fb744e17dbmr16923065lfg.1.1692995172974;
        Fri, 25 Aug 2023 13:26:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id eq8-20020a056512488800b004fe4aef5b18sm410359lfb.164.2023.08.25.13.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 13:26:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] wifi: ath10k: Default to board.bin for legacy board data file
Date: Fri, 25 Aug 2023 23:26:10 +0300
Message-Id: <20230825202610.1580132-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_132619_124178_F600527D 
X-CRM114-Status: UNSURE (   9.58  )
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

Default to 'board.bin' for the legacy board data file, in case the
hw_params array doesn't list hw-specific board data file name (e.g. for
WCN3990).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6cdb225b7eac..806e5968e0ef 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1271,11 +1271,6 @@ static int ath10k_core_fetch_board_data_api_1(struct ath10k *ar, int bd_ie_type)
 	char boardname[100];
 
 	if (bd_ie_type == ATH10K_BD_IE_BOARD) {
-		if (!ar->hw_params.fw.board) {
-			ath10k_err(ar, "failed to find board file fw entry\n");
-			return -EINVAL;
-		}
-
 		scnprintf(boardname, sizeof(boardname), "board-%s-%s.bin",
 			  ath10k_bus_str(ar->hif.bus), dev_name(ar->dev));
 
@@ -1285,7 +1280,8 @@ static int ath10k_core_fetch_board_data_api_1(struct ath10k *ar, int bd_ie_type)
 		if (IS_ERR(ar->normal_mode_fw.board)) {
 			fw = ath10k_fetch_fw_file(ar,
 						  ar->hw_params.fw.dir,
-						  ar->hw_params.fw.board);
+						  ar->hw_params.fw.board ?:
+						  "board.bin");
 			ar->normal_mode_fw.board = fw;
 		}
 
-- 
2.39.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
