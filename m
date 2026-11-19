Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD86606A326
	for <ath10k@archiver.kernel.org>; Thu, 19 Nov 2026 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TyYJr7bJ;
	dkim=pass (2048-bit key, unprotected) header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=kKrWubLb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kbCdt3KgEjN/2CiYy/Fd6/ugSIyTJAlsDpb++fhQDhI=; b=TyYJr7bJj/tVQlCiJACyIWpWmG
	ms83sx9c65FmEw3yV9rvXNvNFOUrtPSOEhXPasEVvymgMMycPDB1eLZ8TcDx/9jXZ9OmSiLX0WYwq
	CIMruC5fVkdsZOw6pSUxLo1YoPMm1rfoxr1sG6zFCkrPfCLuyfyMZVh0OkK7cjkUA2o6ERvZxmEi5
	331bfWwHZiAvLKe1rWf48vhWhsp0PmZKq8hcsCpWqnPyxd5km1vVhy2UPtDrMeqsALIw5zw+P0djA
	P5htwzX0E8W0uoszX5U97ZXq7ovUZ1Dks4ukMUwcSwkXFD2Q4KDHUFhMcinSL5aCPHG0RjUqgXtTk
	l4fXiV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTySM-0000000BOqm-01jk;
	Thu, 19 Nov 2026 09:29:26 +0000
Received: from mail-10627.protonmail.ch ([79.135.106.27])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTySH-0000000BOpt-11dF
	for ath10k@lists.infradead.org;
	Thu, 19 Nov 2026 09:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=becholey.ch;
	s=protonmail; t=1795080556; x=1795339756;
	bh=kbCdt3KgEjN/2CiYy/Fd6/ugSIyTJAlsDpb++fhQDhI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kKrWubLbWCKe8/tI9uaVAF2lP0WWBT6yfKPdjHvD2upv1c5htTNCXwbEFItvrssPA
	 XDoFcU769dnOEJodFjqWD/5LAX5U7FR3EF6INBInaSp96gcFJ7a2MOdEKJ10D2Ueik
	 aVVgbPt0Cn19q+2E7+goAz7NdWq49SHspq92088pY/nhkvPJxmvAcS381lvotxWF8O
	 KmrVQumTPUI6ty+oMZElzW3ZGUX36rNBm/8XQ6WxmUnT0rBbZKjFV409N8LdhRhKjn
	 HLCO2mKN8kJAovUmLkUCKvNFwLTW38tGcclL+ESMF5DqrFW1C1d7HoYRdYnEoRTcZA
	 fp8itE/Pr7/LA==
Date: Thu, 19 Nov 2026 09:29:11 +0000
To: Jeff Johnson <jjohnson@kernel.org>, Erik Stromdahl <erik.stromdahl@gmail.com>, Kalle Valo <kvalo@qca.qualcomm.com>
From: Alexandre Becholey <alex@becholey.ch>
Cc: Alexandre Becholey <alex@becholey.ch>, stable@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Subject: [PATCH] wifi: ath10k: usb: validate HTC header in ath10k_usb_rx_complete()
Message-ID: <20261119092848.554901-1-alex@becholey.ch>
Feedback-ID: 60743817:user:proton
X-Pm-Message-ID: 186a44acddd7b71ce5f8f57788e12ac831867b18
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_012921_890888_6D0F4ED9 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath10k_usb_rx_complete() uses the endpoint id from the first byte of
each received frame as an index into ar->htc.endpoint[] without
checking it, then reads ep->service_id and calls
ep->ep_ops.ep_rx_complete() through that entry. The header length is
not checked against the received length either.

A USB device can make the driver read out of bounds and call through a
function pointer read from outside the array. This is reachable even
after a failed probe, as the driver stays bound and
ath10k_usb_pm_resume() posts the RX URBs on every resume.

Drop frames shorter than the HTC header, with an endpoint id >=3D
ATH10K_HTC_EP_COUNT, or with a payload longer than the received data,
as ath10k_htc_rx_completion_handler() does for the other buses.

The bug was found, and the reproducer and this fix were written, by AI
agents (Claude Mythos and Claude Opus models). The analysis and the
patch were reviewed by a human.

Fixes: 4db66499df91 ("ath10k: add initial USB support")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Becholey <alex@becholey.ch>
---
An emulated 13b1:0042 device sending HTC frames with endpoint ids
9..255 after one runtime suspend/resume triggers it (UBSAN
array-index-out-of-bounds at usb.c:304, KASAN or a bad indirect call,
depending on the id) on v7.3.1 and master 9d66f26fefac. No reports with
the fix. The two length checks were reviewed but not exercised at
runtime (no endpoint is connected in that state). Not tested on real
hardware. Reproducer available on request.
Applies to master 4405c18c95d2 (usb.c unchanged since the tests).

 drivers/net/wireless/ath/ath10k/usb.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/a=
th/ath10k/usb.c
index 987d57a01ddf..0c900351ba8c 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -299,8 +299,18 @@ static void ath10k_usb_rx_complete(struct ath10k *ar, =
struct sk_buff *skb)
 =09u8 *trailer;
 =09int ret;
=20
+=09if (skb->len < sizeof(*htc_hdr)) {
+=09=09ath10k_warn(ar, "short frame received: %u\n", skb->len);
+=09=09goto out_free_skb;
+=09}
+
 =09htc_hdr =3D (struct ath10k_htc_hdr *)skb->data;
 =09eid =3D eid_from_htc_hdr(htc_hdr);
+=09if (eid >=3D ATH10K_HTC_EP_COUNT) {
+=09=09ath10k_warn(ar, "invalid eid %d\n", eid);
+=09=09goto out_free_skb;
+=09}
+
 =09ep =3D &ar->htc.endpoint[eid];
=20
 =09if (ep->service_id =3D=3D 0) {
@@ -314,6 +324,12 @@ static void ath10k_usb_rx_complete(struct ath10k *ar, =
struct sk_buff *skb)
 =09=09goto out_free_skb;
 =09}
=20
+=09if (payload_len > skb->len - sizeof(*htc_hdr)) {
+=09=09ath10k_warn(ar, "truncated frame received: payload %u len %u\n",
+=09=09=09    payload_len, skb->len);
+=09=09goto out_free_skb;
+=09}
+
 =09if (payload_len < htc_hdr->trailer_len) {
 =09=09ath10k_warn(ar, "malformed frame received, firmware crashed?\n");
 =09=09goto out_free_skb;
--=20
2.53.0



