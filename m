Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9414C9830E
	for <ath10k@archiver.kernel.org>; Thu, 24 Sep 2026 13:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:
	From:Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kFpyIM0+JpOSMto08ZABVfDp8Af4KU3Fqp5Uzx6h1b0=; b=DCDXrJrvPC+XJ2tiVm+TGaH2MA
	VF2608DtHD0p8idwaL/1YSu64a/qeSQxtKK8wdGvnNSQQq2YSi6bXt90BwYDd3ViH8SFfk1nM34oP
	8Zslhz9JCyE6Ioc5y3pE7gUnC23fqQxQFmRUAkaXBd8krgVO2MI7R9JPmiYHYW4zGfkWPbr1c//Jx
	DcVu19+8WC0JGnUIOL7vOWwnTyMC4jUw/m9qBWfJwDe4UCX7888k97C3Cs6Ao+f1I5LpbtheNxs/O
	tOpoy2KolQYsxVNZYbA8EXkN6KIvh6DeQBbvOnoAnvDwQUjcOeyU9hpegF/iWM/JKrxtzwMOMQjoi
	Zcad9Rmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jWW-0000000B5hn-0bcj;
	Thu, 24 Sep 2026 13:30:04 +0000
Received: from out-29.mta1.migadu.com ([95.215.58.29] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jWS-0000000B5gp-1mWx
	for ath10k@lists.infradead.org;
	Thu, 24 Sep 2026 13:30:02 +0000
X-Envelope-To: ath10k@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Q7yicSputjqRAaiSihpg7uwoEulKD0sbMOpWliDD7xU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790256598; v=1; x=1790861398;
 b=Qbuyc4H392b8HeErCDtSJJgQWIXyXyc2iJ0VPsIa4YveN9IQmeTArwuLq8n4bNKkzcobtAGg
 tyAqFUTc7CiF5PVmAMKh/2Er/qhMt/Iq4iG3DUlKcwcamv7eYzow8KNkD6ZTkC4XC3I+IL+tw7Z
 7uU8RzfJzc+6zjV/4Z7Sj5DQ=
X-Envelope-To: ath10k@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f5b068c74c8d52c8;
	Thu, 24 Sep 2026 13:29:58 +0000
X-Mizu-Trace-ID: f5b068c74c8d52c8
X-Migadu-Flow: FLOW_OUT
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 13:29:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <441ed914aa1db14a140e6263243579f952d5805b@linux.dev>
TLS-Required: No
Subject: [PATCH] wifi: ath10k: fix OOB write from unbounded SDIO RX bundle
 count
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 jjohnson@kernel.org
Cc: alagusankar@silex-india.com, quic_wgong@quicinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_063000_616381_C74B413B 
X-CRM114-Status: GOOD (  13.03  )
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

From: Tianchu Chen <flynnnchen@tencent.com>

An RX event here is one invocation of
ath10k_sdio_mbox_rxmsg_pending_handler(), triggered by the mailbox
"RX pending" interrupt.  During such an event the device announces
pending packets through lookaheads, the first one read from the
HTC register table, the following ones carried in the trailers of
the packets just fetched.  ath10k_sdio_mbox_rx_alloc()
pre-allocates one rx_pkts[] slot per announced packet, after which
the device transfers exactly that many packets over SDIO.

A lookahead whose HTC header carries a bundle count K stands for
K+1 packets.  However, only the raw lookahead count is checked
against ATH10K_SDIO_MAX_RX_MSGS; the expanded total pkt_cnt is
never compared against the size of ar_sdio->rx_pkts[] (64 entries),
the index is simply advanced and written to.  With up to 32
lookaheads per round (the trailer record limit) each claiming
K=3D32, the loop stores up to 32 * 33 =3D 1056 struct
ath10k_sdio_rx_data entries into the 64-entry array, i.e. 992
entries (~31KB) past its end, overwriting the members that follow
it in struct ath10k_sdio.

Add the missing comparison: the current lookahead and its bundled
packets must fit into the remaining rx_pkts[] slots before any of
them is allocated.

This is expected to keep behavior unchanged on most cases: The new
check drops exactly when the old code would have written past
the array and corrupt the driver state.

Discovered by Atuin - Automated Vulnerability Discovery Engine.

Fixes: 8d985555ddaa ("ath10k: enable RX bundle receive for sdio")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireles=
s/ath/ath10k/sdio.c
index 65e941b527517..5dc2ad432b099 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -540,7 +540,7 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *a=
r,
 {
 	struct ath10k_sdio *ar_sdio =3D ath10k_sdio_priv(ar);
 	struct ath10k_htc_hdr *htc_hdr;
-	size_t full_len, act_len;
+	size_t full_len, act_len, bndl_cnt;
 	bool last_in_bundle;
 	int ret, i;
 	int pkt_cnt =3D 0;
@@ -579,14 +579,23 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k =
*ar,
 			goto err;
 		}
=20
-=09	if (ath10k_htc_get_bundle_count(
-			ar->htc.max_msgs_per_htc_bundle, htc_hdr->flags)) {
+		bndl_cnt =3D ath10k_htc_get_bundle_count(
+			ar->htc.max_msgs_per_htc_bundle, htc_hdr->flags);
+
+		/* One rx_pkts[] slot per lookahead plus one per bundled packet */
+		if (bndl_cnt + 1 > ATH10K_SDIO_MAX_RX_MSGS - pkt_cnt) {
+			ath10k_warn(ar,
+				    "rx bundle count %zu exceeds remaining pkt slots\n",
+				    bndl_cnt);
+			ret =3D -ENOMEM;
+			goto err;
+		}
+
+		if (bndl_cnt) {
 			/* HTC header indicates that every packet to follow
 			 * has the same padded length so that it can be
 			 * optimally fetched as a full bundle.
 			 */
-			size_t bndl_cnt;
-
 			ret =3D ath10k_sdio_mbox_alloc_bundle(ar,
 							    &ar_sdio->rx_pkts[pkt_cnt],
 							    htc_hdr,
--=20
2.51.0

