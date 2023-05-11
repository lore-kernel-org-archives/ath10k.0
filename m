Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64851C7EE22
	for <ath10k@archiver.kernel.org>; Thu, 11 May 2023 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGX0Lq5mXjjPcWG6obJafMY3ZDdlDQEpX1CTAcap+w4=; b=1SDeyWYOUrm4qA
	m4z32mjpY2IwbWrCh+HI/p3BbXAATSbvPdRiRuNA9uO2p5cFqQWT8IKZH9C9wvc9VBPlcZpjTGZog
	iq5IraYDdiQzVbelVq3ObC7ouivq+8nNUpB7Pri9Bg+liKQ2KLOfuZ03QU7BPJyS5a2LyWrVEvIGv
	ihZm7NACOPl2qxfu9Ox8LrNePK7NxEPymI7EyucRfFU8+4DCfn+T/Y/8HlzDnsnRZVjqjOgqdbjzm
	hTmKFjPmJG6VZWzLBdyCHyrwKOtPsuPi5tI2NeJC1IdXLGJVlSPiDDtwTVKlWUOErcIjrUHOte3Cm
	dPHyGzy3sECKxcwn13PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px69S-008q9i-1o;
	Thu, 11 May 2023 13:16:10 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px69P-008q4F-2Y
	for ath10k@lists.infradead.org;
	Thu, 11 May 2023 13:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683810967; x=1715346967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OrrhJ317Kw06HAPoI/hZey2W13pWMJL3yvTYoQlLmp4=;
  b=KK0QN27UerfkqtbOpsoxkv1cqcqyQZwzBBKM/MGL5O1lYHpKvPBa1BSn
   KpzDl/t1NZpfNSciNzOvXXSZCiQJftiKoXuMrpR+e7jwnPTHdfqob+zCs
   303lGNq6H9i9Pu2LxDFiLfa4MPiYKj9c3EgQ50bV2k325QZEqKmvQG413
   d+DjksTGzm97w3q1smwMy3R9FdH3OQawvsZ7fZBKROIxpKxOZdsPUO5LB
   1rTVznje/iCHCMHkWsEMJ+f3WRV6dh5T07qVLkPaBubWLk9kdR8RTTlxU
   ZmItO+QuNyvXoaIVv/RoGPBftVmKhl9JOjsFBnDr077FJyTm6qh7zOaOg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="378619824"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="378619824"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 06:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="650170218"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="650170218"
Received: from jsanche3-mobl1.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.252.39.112])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 06:16:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 17/17] wifi: ath10k: Use pcie_lnkctl_clear_and_set() for changing LNKCTL
Date: Thu, 11 May 2023 16:14:41 +0300
Message-Id: <20230511131441.45704-18-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511131441.45704-1-ilpo.jarvinen@linux.intel.com>
References: <20230511131441.45704-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_061607_851022_C86AB88B 
X-CRM114-Status: GOOD (  13.68  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

RG9uJ3QgYXNzdW1lIHRoYXQgb25seSB0aGUgZHJpdmVyIHdvdWxkIGJlIGFjY2Vzc2luZyBMTktD
VEwuIEFTUE0KcG9saWN5IGNoYW5nZXMgY2FuIHRyaWdnZXIgd3JpdGUgdG8gTE5LQ1RMIG91dHNp
ZGUgb2YgZHJpdmVyJ3MgY29udHJvbC4KClVzZSBwY2llX2xua2N0bF9jbGVhcl9hbmRfc2V0KCkg
d2hpY2ggZG9lcyBwcm9wZXIgbG9ja2luZyB0byBhdm9pZApsb3NpbmcgY29uY3VycmVudCB1cGRh
dGVzIHRvIHRoZSByZWdpc3RlciB2YWx1ZS4gQ29udmVydCBvbmUgb2YgdGhlCndyaXRlcyB0byBv
bmx5IHRvdWNoIFBDSV9FWFBfTE5LQ1RMX0FTUE1DIGZpZWxkIHdoaWNoIHRoZSBkcml2ZXIgaXRz
ZWxmCmhhcyBiZWVuIGNoYW5naW5nLCBsZWF2ZSB0aGUgb3RoZXIgZmllbGRzIHVudG91Y2hlZC4K
ClN1Z2dlc3RlZC1ieTogTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+ClNpZ25lZC1vZmYt
Ynk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4KLS0tCiBk
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jIHwgOCArKysrLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jIGIvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDEway9wY2kuYwppbmRleCBhN2Y0NGY2MzM1ZmIuLmQxOGRmYjQ5NTE5NCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYworKysgYi9kcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jCkBAIC0xOTYzLDggKzE5NjMsOCBAQCBz
dGF0aWMgaW50IGF0aDEwa19wY2lfaGlmX3N0YXJ0KHN0cnVjdCBhdGgxMGsgKmFyKQogCWF0aDEw
a19wY2lfaXJxX2VuYWJsZShhcik7CiAJYXRoMTBrX3BjaV9yeF9wb3N0KGFyKTsKIAotCXBjaWVf
Y2FwYWJpbGl0eV93cml0ZV93b3JkKGFyX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCi0JCQkJ
ICAgYXJfcGNpLT5saW5rX2N0bCk7CisJcGNpZV9sbmtjdGxfY2xlYXJfYW5kX3NldChhcl9wY2kt
PnBkZXYsIDAsCisJCQkJICBhcl9wY2ktPmxpbmtfY3RsICYgUENJX0VYUF9MTktDVExfQVNQTUMp
OwogCiAJcmV0dXJuIDA7CiB9CkBAIC0yODIxLDggKzI4MjEsOCBAQCBzdGF0aWMgaW50IGF0aDEw
a19wY2lfaGlmX3Bvd2VyX3VwKHN0cnVjdCBhdGgxMGsgKmFyLAogCiAJcGNpZV9jYXBhYmlsaXR5
X3JlYWRfd29yZChhcl9wY2ktPnBkZXYsIFBDSV9FWFBfTE5LQ1RMLAogCQkJCSAgJmFyX3BjaS0+
bGlua19jdGwpOwotCXBjaWVfY2FwYWJpbGl0eV93cml0ZV93b3JkKGFyX3BjaS0+cGRldiwgUENJ
X0VYUF9MTktDVEwsCi0JCQkJICAgYXJfcGNpLT5saW5rX2N0bCAmIH5QQ0lfRVhQX0xOS0NUTF9B
U1BNQyk7CisJcGNpZV9sbmtjdGxfY2xlYXJfYW5kX3NldChhcl9wY2ktPnBkZXYsCisJCQkJICBh
cl9wY2ktPmxpbmtfY3RsICYgUENJX0VYUF9MTktDVExfQVNQTUMsIDApOwogCiAJLyoKIAkgKiBC
cmluZyB0aGUgdGFyZ2V0IHVwIGNsZWFubHkuCi0tIAoyLjMwLjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==
