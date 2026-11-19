Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CD760A260B
	for <ath10k@archiver.kernel.org>; Thu, 19 Nov 2026 00:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B84blx9s;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ij3A3j1s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/aJxpNGDocOFUdmsrM2zfm3uFoQrrqPBVAxJfScRpLA=; b=B84blx9sD7xlJz
	9wnFwTEnrHcoodjPQN8mj0vEMHpDGM3aP6QYtv6ZCkP/avejV+vm4cFmrfE7ctP3OA44LgWTQ8Fnq
	fjvhM/oOu4LLF55f6/gxQgOD7xzXtPRIokYhafTSa457zE00p1TMXQkmrAPTCztwu8cQaqCvKNK8W
	fQFsJY17hPNbMkpyz4J0yXG8/ZcktM76tDxFBQpAj46yzoRldagTFWUl8vLZtS7YGapQXxhe3XjRn
	6rfQyhA9/WGjzr/ARFlXJvTWpNcojxwG+Dbfr/ckjJj8QzZJbuA6HDEOaDh67JOh9AF9l5iLJjudd
	LoEFXz/2oQbEktg5QPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTq1V-0000000AZlr-3j9W;
	Thu, 19 Nov 2026 00:29:09 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTq1T-0000000AZk1-2s1G
	for ath10k@lists.infradead.org;
	Thu, 19 Nov 2026 00:29:08 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso19333746d6.1
        for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 16:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048146; x=1795652946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aJxpNGDocOFUdmsrM2zfm3uFoQrrqPBVAxJfScRpLA=;
        b=Ij3A3j1sCYBj6jgUxLFkfheSGK/N/DM3GD4xH28mvCu9vC5XeQ4Ev9DNw0TyXDZXlV
         3LxTm9uOCIDNhrz1smLmH8lUxTQcd4aN1Yk7g/rFET/8fuoo0CvbYD3tTxTXXM3ZVuk1
         kWNgBsezOkLx1AHGZy28TGmA7M9ju8wFNBacbfoWVCPPqUtVLBU7FSiaLRIeFob+nluu
         Tmdlxk44rV5zn+bnv9cQ/oxbvDhCrpTQrJagxYagzwOnYaUG32CjiY8T7DzfQciMBg73
         PiR9oULu0oAPk26Nh42ewc8jg7iQlDV2EI6/E8XhfnwvfdB+13ATgSPcwaGYAouDWuMF
         IqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048146; x=1795652946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/aJxpNGDocOFUdmsrM2zfm3uFoQrrqPBVAxJfScRpLA=;
        b=Jq6oacnChBZpXZwADJaDi8RKLjGkcgfS+sjNjWpht6lC36IiaaCkwH5YsdTJFvtaNG
         bskHwVT9n7QxN4rxdziafMZor2Ji5i1WhVHbWiZalmtex+F7OHLkbRI9+XidXotLRlwM
         ygf7Cri4/x7wjPNcZRGUs0ueZNlBN0kIyLUehzHCngrGZiK11pCNrtteNWQXxhs1Nbnf
         +oI5ds3WYpu7/KVB/sEeQeRrIpXR38ogyX++2XsgZ1uCL5Zln4yB40GsUd99FbnuGnYp
         JL/7KUMnuTAre/dvbEaCIGnzoxXiGOexN2VTOxK/DCLogybUCNakzdNu94iN7i20gt+7
         UKCQ==
X-Forwarded-Encrypted: i=1; AL+hErHEziBgLzOr05kkZrFL3WJhWeIYQPiZhXCvYF70GPOTR5AMZIVzRmDFBe4tAKbx6JRc/flI+Vk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8qK4SKAgko7y5edpZt5VlEFKDi3dqTSP6vmUzn37AegvA/unBC
	7U8iy3geWNZK1IURxhv/uRxFFjkUglZeem7oGqPv+sHAPan4KSOpyF84
X-Gm-Gg: AZFdTZdPSVCEbMDk28gbGOb4TGQ+P9JdhqKifcEtCyYcP72GBnDuiFX0VkIRzqEy4hJ
	S7dPbOgfQ0j++AawJ8gih6/KxKTQ5MCsnWte237vjeAtvBJUNLvIfWluoFKrwviODVk2mdRO0i4
	lVo0MgmPrzPndz1R+A2plaBOqkXYgFSQJ9ADJZMXXi2GUP5CjAf8nNcNqzI8pWtWi3f92hLeo2K
	PDqaOCMy0wQ3h5PAjb0v3NAnLlbkMt7DMJjWTbULs2qzVbmQuPG5itGCwRCtBAeAyHNRr9vEm2y
	cbXmTP8n/IFjukrWdQu3unpO0V4rQUjFDeM7yQOOtEsHywbzspaq7JTLYR2zAZm0D22KlXSmOFH
	t45RIB2yZI/SGbeNb/IJ3uw3UljeXN2p+yl8ZFCDtihLY2jgsdx3IJggvY759xvcfd6KQ2eeP1y
	ck5PSacMEobH95tb0FflkFeFFkbosF/C+ZPOazcd7CGHUnpbqH6zGvD3bR3SmH3Z8REd6Xtf57H
	pmmsrDAfVx/EN7vneMzi/sIkbezvZdwwvLYaX4dfyXpB07/J5INmQ8urzZNRC+hLvpZyIV3K2D2
	F6sNoA8x3ir/BnVmOQ9IyIN+DC0C8l7hT3I/dtFiHlrvTnz4hUx/y3ptNnp6crDtedijwU4tg9K
	d/LQkgpoS9+KfKbufkQaS
X-Received: by 2002:a05:6214:460e:b0:91c:8fa6:1789 with SMTP id 6a1803df08f44-92114f8e9b8mr64253386d6.28.1795048146119;
        Wed, 18 Nov 2026 16:29:06 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d16bafsm34925086d6.7.2026.11.18.16.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:29:05 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH ath-current v2 1/2] wifi: ath10k: free msdu_id when HL TX fails
Date: Wed, 18 Nov 2026 19:28:57 -0500
Message-ID: <20261119002858.425666-2-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119002858.425666-1-lcy8047@gmail.com>
References: <20261119002858.425666-1-lcy8047@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_162907_733734_C47A7E91 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Free the msdu_id if ath10k_htc_send_hl() fails. Repeated failures can
otherwise exhaust the IDs and block further data transmissions.

Fixes: 8ea51e409eb0 ("ath10k: htt: support MSDU ids with SDIO")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index efaea150025b..298e6a092101 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1378,6 +1378,11 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	tx_desc->peerid = __cpu_to_le32(HTT_INVALID_PEERID);
 
 	res = ath10k_htc_send_hl(&htt->ar->htc, htt->eid, msdu);
+	if (res && ar->bus_param.hl_msdu_ids) {
+		spin_lock_bh(&htt->tx_lock);
+		ath10k_htt_tx_free_msdu_id(htt, msdu_id);
+		spin_unlock_bh(&htt->tx_lock);
+	}
 
 out:
 	return res;
-- 
2.43.0


