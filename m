Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC56CD37A7
	for <ath10k@archiver.kernel.org>; Fri, 15 Sep 2023 20:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wzkAQk1+2gPNAeNX0XtDl1OeqVbvy+19yboKEvNZp8k=; b=JcyOqLSARW18Dh
	ZNYnJZLZzUpdgkTifAzQfOx9fkLMHshvnqzGb7TAPOXvH7/aonHV/5vt2n8/UZ2hnRCP0GCXef3Xm
	8L9oSM6F1s/KN5Tcbh6MjYw8o1m7YeVz6CQAz87JRufYlMM1Rp97Lbx3X1hOnyTyHrOkElXML5H1g
	68inqPZ0gRjY6XtHnON6pwUBDf94QimH+9XZoAhrmgz10ko9kBXdjs6nSNbYB73IbJN0B3GLet/YG
	OTWvsUobd/Gbz5EUjJqqhuD//HYtBo4aJuJKwSzEL5X3TM0j6zXyaoTmYq6mjlbE+fBzygcmOlzgf
	JcAXTEPUOQjjZSUPa90A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhF5N-00BI0P-2u;
	Fri, 15 Sep 2023 20:06:41 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhF5L-00BHzu-25
	for ath10k@lists.infradead.org;
	Fri, 15 Sep 2023 20:06:41 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6c0c6370e5eso1447805a34.3
        for <ath10k@lists.infradead.org>; Fri, 15 Sep 2023 13:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808398; x=1695413198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jatWasS204QwZuZ1cmt7SDqxcoxRSBD/dVPK2mjyGCY=;
        b=VGe76L2aHyyUU9TXh9U8AQJqZRklnZhdbL+oDv3urBV9BcGs4S3yDkMyxONAmMx1l4
         Kr/6z2st5p3ohppXdk8cgGWJ/ORmn7DuqF1UhaYsUrOrLar/n2flqNkddmjEEOqbSTN1
         +WdILnLjhn41A+KPQ84d3YyMmgmphZgGmLzGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808398; x=1695413198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jatWasS204QwZuZ1cmt7SDqxcoxRSBD/dVPK2mjyGCY=;
        b=bq5bs7+wlzWde6FjZ99YyKj/3Pk+JJJno9BYYRqw1JMcJnDChoA3n34xGoU0jW62YI
         oELc2qGgHBcYWHvm419e+SMIku9hmF7Swc29OdOPbCMRFVc03Erj+rHwALiD8ATJ7tFJ
         NgwSd0F/7LsAel6dglR+Tvv4UX+pff2MuA6Cb+80zVth4l7iAIDeDb2ui7e0Zn7tJcRk
         MfO2VMU0MrJ6iPDkEIti7F9OKdSwC+Yc/4sgnYl4HkDDBnjXL9GVA1mH2+53TW0updX8
         G4PwfvT7qcceiNqgApNz9vOb0tEBx3WdI0YFqZgSl0l0xTNo+REKC+D3s8sAtVrruYHE
         WleA==
X-Gm-Message-State: AOJu0YxS+E1OM3n4hI+9FzidoXjtK/sOC3fTUBdnbxS8FURqVi10ZrY7
	3p/iZnDWHXbVR0vfFUcMmWY19Q==
X-Google-Smtp-Source: AGHT+IGXQqiIq6S4bgOC/rczT8CEqgDpEzDp+av8eoitgJQpUO9EnGhGdKEsv8TA7BWoVjF1DIS9yQ==
X-Received: by 2002:a05:6358:2910:b0:134:c37f:4b64 with SMTP id y16-20020a056358291000b00134c37f4b64mr3429872rwb.30.1694808398331;
        Fri, 15 Sep 2023 13:06:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b127-20020a633485000000b005709b5aea02sm3039409pga.63.2023.09.15.13.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:06:37 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] wifi: ath10k: Annotate struct ath10k_ce_ring with __counted_by
Date: Fri, 15 Sep 2023 13:06:36 -0700
Message-Id: <20230915200636.never.762-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238; i=keescook@chromium.org;
 h=from:subject:message-id; bh=W0Z7FKEp2ozBJ5/t2fUugzUzm+3pU7NY9bmGkgl9TaQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLlMujYCGGfE+LkiGsu88vAuQpO/bsLI9ODrg
 7qJQcqRlzGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS5TAAKCRCJcvTf3G3A
 Jjo0D/0ZhZjM3umwDd4cScp/pX69G3PAuyE5MgO0WMxQPUuULMPhwefs2sxa4V3f11IiNVJnHtW
 soi02X7jMpU81gA0gZljCei7qMNuZza5nCUsLw/tZFEvOS7by/LWH8N8eKeC1HM/gX5nJzk87sJ
 524wLuAgNxeE0ZKs0kE17vg/QAtRZ6AlhVxJHN7W7oZ9vFiabMcnvDOvUvhnIuCmf8H3yyepMSJ
 d6PSUEAVtDnmd2z/r+XAp2jILEyXzM6oLz4v5N01BYz3qvzxRPyleV3r9ohrfGd6QO72+Mhqytj
 XRd8Uq2Ltx/5ewjaD0vkDWzbroV8Tqj72dqgpBMXz4328EyeVueyo6mlXGorpgbPwNZSpdZP3a1
 0454XWq12ei33x2sH7xkEJxQLtIOT2zKBbsHKbRwvZce2PQ8CJ4LxhI3H3epIf+UrS+uNI0uWhk
 jfhiAhauj9nXhsBYt0O13AerPQdVoH4ctqLYVVemaRiw/5hjYV4KGHuBBJDVUn764lRWVLTVrn9
 I1XmUF7VjpYkMj69QmvuVWq2SH9J86c7DoBPTsvhm+jnuIpGgHXpSAv4Lxn1jCzcqAnQtT1Wtsj
 nHP3/4jYzPx4uftHyuLbcVY2hdrDEZmCqB1MR+NSI/12asuT8+6iz3aZ1CejZmkYpC3UTRBOnfT
 uRisExq MWP+8iwA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_130639_681150_13577020 
X-CRM114-Status: GOOD (  10.56  )
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

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ath10k_ce_ring.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/ath/ath10k/ce.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index 666ce384a1d8..27367bd64e95 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -110,7 +110,7 @@ struct ath10k_ce_ring {
 	struct ce_desc_64 *shadow_base;
 
 	/* keep last */
-	void *per_transfer_context[];
+	void *per_transfer_context[] __counted_by(nentries);
 };
 
 struct ath10k_ce_pipe {
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
