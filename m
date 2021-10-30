Return-Path: <SRS0=GKjs=PS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E26C433FE
	for <ath10k@archiver.kernel.org>; Sat, 30 Oct 2021 17:41:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A4961040
	for <ath10k@archiver.kernel.org>; Sat, 30 Oct 2021 17:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50A4961040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qRGS4lw3edKX/MlwWuECmohOerr4FjTCVLv69akWk3o=; b=MrGoPiA4DDvfPE
	y3SnG0+WVf1ITG1y5rIjX+6vJQRaP+seFEsOx/6k/BDDXVLdFcETi3k7EiJm6qVuo2wOGYQwAvQYy
	7m3pWfd+RkzteqP231HcEOFyOFdKgbAtQ/6N4eMinHIhISp7EbkYHJvsFzMeKIIlPYVsTTSnNGCQH
	nqmojbaU3w602UifO4M+Ou81V5Ea4ifmciF2w1Fa4u2Jv/yiCENoBdXssnDY2w0okTrVFYzepZprX
	rEpCZCcQrXaRUbVh7lOKJk1qYvhDVggcokY9e5Wi5eFfP0EcHUZBdNu0Yisozsy1STg0fVcOpuQXK
	v0MF0vvJSHTh2FABIgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgsM0-00DJ9u-45; Sat, 30 Oct 2021 17:41:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgsLy-00DJ9G-9E
 for ath10k@lists.infradead.org; Sat, 30 Oct 2021 17:41:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id d5so6424174wrc.1
 for <ath10k@lists.infradead.org>; Sat, 30 Oct 2021 10:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eu1iSxTwRsLRLsgJoPAuIgttiEmBvdky8CdJQqw7CWM=;
 b=gdgSK30LOSfVUGzzocLUT7jd+cwOhjqLoxi7H8dpqgaalI+3fw7o4Tn715iyv06FHF
 /yPDY4seZH/R7cQy5XyyWy2GKwI8ezSJCt+W5nEzVnvOtD3J+6LVKwyNic8zNp3RU8lL
 f9JFgUEPRGXrjK9YstZqMpcS+DoWZx73q+iCEGXAndZwdcb78QmShPH8lwKt6JV9SX84
 grFZvV0Di886F9BM5NF0IZoR/wnI/v8LnNf2BKFuCCJOVbm+lIhf7dxvHBNwkEcPmQtj
 utf+owvMEfXLvHRNWk6oQJ4ABq+opoQjxKL2LJOI702Cj6MfgFBuN+mmP2uLMdnwVJex
 7lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eu1iSxTwRsLRLsgJoPAuIgttiEmBvdky8CdJQqw7CWM=;
 b=OsdD6nhRS9LdGavbiB5N0LMb4moT8xR6zs9UWJ/dRHt0nShkLeG9aanVNM2ovQzL8D
 n+GsUk3McyzpkfBd4S/Xdscd+F7X9AClu/4LjOfAmig2b6nXr1wb/FPMFhJQ9tU2a8ak
 a7bRj0021nHsDmbtSfDdJQo9VVl8uj4CVeV9rj0eGpD8wFGXqpqfykly8KvOEBYEcu6X
 FeKG6FWIF3HgV+xeSLccA30vanwfnXhYdDJWPyrfGeWz3lwstp46g+hRhh1XQTKCBslw
 fDRLqJIjPGB+zzaisBwOhDRsMpWA0slnRT2Ry88OdZbITkn1EqoL50knBQztaj0y76/2
 y7KA==
X-Gm-Message-State: AOAM533ipXAyU6ttqmnFFihs6ioezc+bsNtw3k3fwyG/XDkOoHyNv4Ps
 LuyzGOv4hekYOhYg1KNb56U=
X-Google-Smtp-Source: ABdhPJwteW9Gltx7viCtDKg6VAfQ/Ssaz6GcgW8wMGZfPvYZySJ6XnzED4rE8e3Zyf1HIBDcpPKHfw==
X-Received: by 2002:a5d:6843:: with SMTP id o3mr12747163wrw.174.1635615672623; 
 Sat, 30 Oct 2021 10:41:12 -0700 (PDT)
Received: from debian64.daheim (p5b0d7cd8.dip0.t-ipconnect.de. [91.13.124.216])
 by smtp.gmail.com with ESMTPSA id z6sm354992wrm.93.2021.10.30.10.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:41:12 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1mgsLv-0060he-Rl;
 Sat, 30 Oct 2021 19:41:11 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: netdev@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Len Brown <lenb@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Michael Walle <michael@walle.cc>, Arnd Bergmann <arnd@arndb.de>
Subject: [RFC net-next/wireless-next v1 1/2] ethernet: check nvmem cells for
 mac-address
Date: Sat, 30 Oct 2021 19:41:10 +0200
Message-Id: <20211030174111.1432663-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_104114_352477_927D9439 
X-CRM114-Status: GOOD (  15.52  )
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

of_get_mac_address() gained this function with
commit d01f449c008a ("of_net: add NVMEM support to of_get_mac_address")
with the following justification:
"Many embedded devices have information such as MAC addresses stored
inside NVMEMs like EEPROMs and so on. [...]

Adding support for NVMEM into every other driver would mean adding a lot
of repetitive code. This patch allows us to configure MAC addresses in
various devices like ethernet and wireless adapters directly [...]."

the common device_/fwnode_get_mac_address could use the
same functionality by just a few adjustments.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 net/ethernet/eth.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index c7d9e08107cb..5e55b08577b1 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -602,7 +602,9 @@ static int fwnode_get_mac_addr(struct fwnode_handle *fwnode,
  * checked first, because that is supposed to contain to "most recent" MAC
  * address. If that isn't set, then 'local-mac-address' is checked next,
  * because that is the default address.  If that isn't set, then the obsolete
- * 'address' is checked, just in case we're using an old device tree.
+ * 'address' is checked, just in case we're using an old device tree. If any
+ * of the above isn't set, then try to get MAC address from nvmem cell named
+ * 'mac-address'.
  *
  * Note that the 'address' property is supposed to contain a virtual address of
  * the register set, but some DTS files have redefined that property to be the
@@ -622,7 +624,7 @@ int fwnode_get_mac_address(struct fwnode_handle *fwnode, char *addr)
 	    !fwnode_get_mac_addr(fwnode, "address", addr))
 		return 0;
 
-	return -ENOENT;
+	return nvmem_get_mac_address(fwnode->dev, addr);
 }
 EXPORT_SYMBOL(fwnode_get_mac_address);
 
-- 
2.33.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
