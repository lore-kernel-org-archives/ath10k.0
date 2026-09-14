Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D53C88E50
	for <ath10k@archiver.kernel.org>; Mon, 14 Sep 2026 13:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IIrbGOfIQRouXedn+IFe+NVdpQt1cwK8/ve6LQAjMBQ=; b=ulO0JxT8hPICORkkyBoji1hVIz
	+USPs0+WmfizqjnJX0WaXxSenWa0o12q8eh4JlHVxoiSt9Am96KexOshuCX3Y9B0F95KHcx+aqnT+
	ELVw7DzfKAJGyYxiBGs3/SjgcIT53Gi5ixoTHq9btgq+zXp+DUSY9mCuuKTjlQwEqV2ACpJk3aN/l
	LRWrT7PrZ+xUYHr4vNB5Zd4vTdnDcHU9hB6kEIijRfc/iCSK5bkymWzAet5DNn90o1LyCoZuDI9RB
	N7iWg8E6YzQinpYB+r36cXFeOwMkxLO4osmKYonOTLPnGmnsTaErZC2q3gsoDzAVo681hWBZDLmhi
	4lPOEIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66NR-00000003gxh-2KbR;
	Mon, 14 Sep 2026 13:05:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66NO-00000003gx3-3yFP
	for ath10k@lists.infradead.org;
	Mon, 14 Sep 2026 13:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789391137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IIrbGOfIQRouXedn+IFe+NVdpQt1cwK8/ve6LQAjMBQ=;
	b=LG41rEDqiySmF6sTvZlQc7nQ/J5QcPd2HjFTm1Fz9EZ4B7MeOW3OFB4iZKVtoNBkp92Ved
	IuUa7gvtSOg28jySTnT3HpuItVj4uS9E5fsYXGQ3y6ukc6+H8OkVh9rhp2IdqBs3OKUTsC
	Gw48JP12u9J0Q6fvKuBSt4/j985A8BI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-349-v8tbygsCPh-78Yel-q_hfQ-1; Mon,
 14 Sep 2026 09:05:32 -0400
X-MC-Unique: v8tbygsCPh-78Yel-q_hfQ-1
X-Mimecast-MFC-AGG-ID: v8tbygsCPh-78Yel-q_hfQ_1789391129
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E27241955F21;
	Mon, 14 Sep 2026 13:05:28 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B1325180056E;
	Mon, 14 Sep 2026 13:05:26 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 14 Sep 2026 15:05:19 +0200
Subject: [PATCH] ath10k: clear QMI if failed during init
MIME-Version: 1.0
Message-Id: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAwEvyI5G2iLtuhXxIPaaINSpRURxL8bP
 A47Ow9kSkwZ2uKBRBdn3qOALguYwhAXQvbCYJSxqtEVznzjcAatVvSybxwX1LV11lfGTeMI8jw
 SifZXu/59P0FKLW1lAAAA
X-Change-ID: 20260914-fix-ath10k-dangling-15676d427cbb
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Govind Singh <govinds@codeaurora.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Niklas Cassel <niklas.cassel@linaro.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Albert Esteve <aesteve@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789391126; l=928;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=q5o+CKn0Co/R2u4gXcpA7aZ6Z7WqyCo44To0XEIGF3E=;
 b=FllOoEx11IsQvIExPmEjc7zvCB6JpPPqftbJxleq4hs7bjcJpONSe3ItkwpiRa8GzlfV6YUZP
 pudK/qMvdQqD9SIS5BBH9KG+C+0GFb2O/eUwRnriEebFaJVq7f7pazd
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: XJTsYiKCsPZpq-6YJ-LFy-En4X3pE3oquEg7zP9Hggs_1789391129
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_060539_131048_A1E3B79C 
X-CRM114-Status: UNSURE (   8.10  )
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

A failed ath10k_qmi_init() left a dangling
pointer (ar_snoc->qmi) in the cleanup path.
Clear the pointer on the way out for hygiene
and consistency with deinit().

Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 0d74548a5f34..08a64f737fb4 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1128,6 +1128,7 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
 
 err:
 	kfree(qmi);
+	ar_snoc->qmi = NULL;
 	return ret;
 }
 

---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260914-fix-ath10k-dangling-15676d427cbb

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>


