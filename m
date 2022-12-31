Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7BFC4332F
	for <ath10k@archiver.kernel.org>; Sat, 31 Dec 2022 04:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7SVOK0d0ZwwM4+/tdiVMdXbVFuUoSM7pjsFsCiE61s=; b=iyJVB6+SSytGyT
	HUWexROagRqA34KDP0xkJp+K0wgUbnmo87hSrQ88dFL+lk2Q6O+mPXe+5Wz2RJI+ZWfY0TQUOkCsj
	H4dZoJ7kYzNE0wlq90lSewF1xQjVBcQCDsO/l1+xnAVKkwyKJLhIgpxKusoUPpeVDiYcdJppzCBr7
	u01vrGCrunwQ7q3DiwMIKOuRg0Y217bhFkGTLrRNkvJfrf0GFU3KMXtW28msKfzennm1KuHa2D+tg
	u5a6j310A88SqgXPeyrkbdkxf0BtX+xTcB6WAu+v1/75GS4QckXYpd5KZ3HG/eH/dRkqjN5kVprJw
	CKTEE16Qbv/Z0k3zDyXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBTxv-000dIF-Ft; Sat, 31 Dec 2022 04:59:27 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBTxs-000dGJ-6w
	for ath10k@lists.infradead.org; Sat, 31 Dec 2022 04:59:25 +0000
Received: by mail-qt1-x82b.google.com with SMTP id c7so18520768qtw.8
        for <ath10k@lists.infradead.org>; Fri, 30 Dec 2022 20:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vtremblay.dev; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbOQusKuVPiXP1KXd3ZZH76G6QNSLv3OyLg4V5juMZQ=;
        b=HY2PqXo2Etq8UeGUFmgM7X+trVFVg4234RmX0MeH6YmFjj814x599SEq/00B1W7tbb
         9eKIdJ+UCBeyUl8I+cdl1cyY3pVuFNzhf00ENsY+UsI1j7OHqOIQdlXce4aMRxvJmH/+
         DIF/0JOzSjWn+TeLz3YvNoCyoQ+7LbO7eONGWBznFHWXIl4CfwCGJzvZq851HTjZT8MF
         uXZtygfR41QzRE/OaDARmQSunaeb6WaBuczl3uiuj/P4/egB0thYE15MFIlcW/Jig9rs
         1z3SNTd7YAokVrCrWhzR8umWtAfufjJzfBJglWXP6s/bZjcvr4C9I8F5Q14FDLAcfVGE
         +Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbOQusKuVPiXP1KXd3ZZH76G6QNSLv3OyLg4V5juMZQ=;
        b=WeVOvK7qIhPyQpYutcuRsvjy/GG0K+X4ltZuSTgygNJyGHS9XLBHYhSHbV8njYu5vs
         BSqEaJ1qVN2OGDqi1H+66+cjxisr+bh1N/3qjvO66o/EA/O6jDyAA7NKEHtjiIt8btpa
         pa4sQXsJq//Gk4fVvuppE2bAyuhOsZ5P6EGVY1EHoQ6i/QAju+f5bg6wbEUH8tNpFSk1
         NGAQ2pPA8RsNQSM2gFr6YfMjMh6E7lT72FbrzeuHDubtiEUpR9n2aqyug0kBsJqCHeke
         hJhlEOZHfhbmXfsWLq+kn8upPmKvWSJdBUGsbqMHSEVn1FsH6jaPWQokMISKSlKjmrW3
         gY6A==
X-Gm-Message-State: AFqh2krqfgiR932kbhxc62tubVqP/42yElrmExxmTZ0eWo2XekOvlf50
	tbh+JV6iL/JpT/3yLYRdTqgCZ+aAoIAK/LX1MFg=
X-Google-Smtp-Source: AMrXdXsUNOqsMUDftYYy3dxV5KkCnCgXiiLH3m8CSnqbSDLNLfQt5pc53pdBvTB/4nEpLjcYFzBhdA==
X-Received: by 2002:ac8:7395:0:b0:3a7:ed31:a618 with SMTP id t21-20020ac87395000000b003a7ed31a618mr46881349qtp.7.1672462762112;
        Fri, 30 Dec 2022 20:59:22 -0800 (PST)
Received: from vtremblay.. (modemcable190.194-177-173.mc.videotron.ca. [173.177.194.190])
        by smtp.gmail.com with ESMTPSA id cj8-20020a05622a258800b003ab7aee56a0sm11198272qtb.39.2022.12.30.20.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 20:59:21 -0800 (PST)
From: Vincent Tremblay <vincent@vtremblay.dev>
To: 
Cc: ath10k@lists.infradead.org,
	vincent@vtremblay.dev
Subject: [PATCH v2] dt-bindings: ath10k: fix qcom,coexist-support documentation
Date: Fri, 30 Dec 2022 23:58:41 -0500
Message-Id: <20221231045841.3381365-1-vincent@vtremblay.dev>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221231044752.3379895-1-vincent@vtremblay.dev>
References: <20221231044752.3379895-1-vincent@vtremblay.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_205924_326843_C9669A58 
X-CRM114-Status: GOOD (  12.47  )
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

The driver is reading the value using the function
"of_property_read_u8", which is expecting the data to be
represented on 8 bits.

By default, the value specified in the DT is saved using a 32 bits
format, which cause the driver to read "0" instead of "1".

To make the driver work properly, the DT should specify the right
data representation to use.

Signed-off-by: Vincent Tremblay <vincent@vtremblay.dev>
---
v2 changes:
 - Remove unrelated changes

 .../devicetree/bindings/net/wireless/qcom,ath10k.txt        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index b61c2d5a0ff7..4a66ceeb1e76 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -92,8 +92,8 @@ Optional properties:
 - qcom,msa-fixed-perm: Boolean context flag to disable SCM call for statically
 		       mapped msa region.
 
-- qcom,coexist-support : should contain eithr "0" or "1" to indicate coex
-			 support by the hardware.
+- qcom,coexist-support : should contain a 8 bits value representing either
+			 "0" or "1" to indicate coex support by the hardware.
 - qcom,coexist-gpio-pin : gpio pin number  information to support coex
 			  which will be used by wifi firmware.
 
@@ -176,7 +176,7 @@ wifi0: wifi@a000000 {
 	qcom,msi_addr = <0x0b006040>;
 	qcom,msi_base = <0x40>;
 	qcom,ath10k-pre-calibration-data = [ 01 02 03 ... ];
-	qcom,coexist-support = <1>;
+	qcom,coexist-support = /bits/ 8 <1>;
 	qcom,coexist-gpio-pin = <0x33>;
 };
 
-- 
2.37.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
