Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BEDEB64DD
	for <ath10k@archiver.kernel.org>; Thu, 13 Jul 2023 12:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmot3EF9Zh5BLDTRLp5GrCkdhQOE5YwLsE2mHu2N2zw=; b=WnefJL56LtbRAi
	vx8ki0HTYC5EpVdWsAd0kXbp/hsVxAhJ3V6Dfioe51gN6kiVp76lmhIF1hDURzfW/KMgrTDREAhBe
	VqPoDfuSKRWsq832/vV1iiAzJ8VCHI46BdrNurAWnDFT5jm5jNRoPaqptL0EAcLJ7WQnFOYAlpkeU
	/xiZOQoUYQS63OFzsqL03E31/uf6aVeiGe+COmUsG6u3RsqkH4mooUhgA37iPl5g58frbR0BlnsAS
	PfW64VEWoo70zR6J9dTmqRZKmHJju74TxfyByRneiAveHidm48EFJaEGDl3XfChUiKTXHMNH2i1Id
	nxBRiRquOzeCsTJeA4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJviW-003HJg-12;
	Thu, 13 Jul 2023 12:46:44 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJviT-003HIp-2k
	for ath10k@lists.infradead.org;
	Thu, 13 Jul 2023 12:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689252401; x=1720788401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AAJmAZ+sXj0MECM7XPTmd1pa5VhGBIS57bxBnXZUE7M=;
  b=PH5Ad7p3fo88fBgHDiBxPrpjkrOfL5yoPLxDgiRCf2GYi9Pfwh7RAtkW
   RlqqzXWYCN2hfF6qeWF+wlSzT5aSVZXhyMf4e8YazwZrg808E5TCZkQ74
   f6qzcJ/AytfZ/FKsNU2HJMhuBIuKa8lmb5N8UBSqkhB46LrWd7gxTimUO
   4gwAV9KE/wYdRBCl/cjBG0AyZegMSvSPoNAxvNRJzBja5YgZAFtZrrRzb
   CoA7Fyxq5Uy4aAMj8VizOcSfT2ETJjsYcQi4a6Fhg5RCvZZKBY+X3JAF0
   4uStrNGD9at5VCcq5ei6ESfXmCKO3JRmauvXh3nJ62FbQMskDtALCXzbY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367797048"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="367797048"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 05:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="757144512"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="757144512"
Received: from ijarvine-mobl2.ger.corp.intel.com ([10.251.222.39])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 05:46:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Kalle Valo <kvalo@kernel.org>,
	Michal Kazior <michal.kazior@tieto.com>,
	Janusz Dziedzic <janusz.dziedzic@tieto.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dean Luick <dean.luick@cornelisnetworks.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Jonas=20Dre=C3=9Fler?= <verdre@v0yd.nl>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Simon Horman <simon.horman@corigine.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 10/11] wifi: ath10k: Use RMW accessors for changing LNKCTL
Date: Thu, 13 Jul 2023 15:45:04 +0300
Message-Id: <20230713124505.94866-11-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230713124505.94866-1-ilpo.jarvinen@linux.intel.com>
References: <20230713124505.94866-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_054641_929069_C1FD2A0C 
X-CRM114-Status: GOOD (  11.71  )
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
ZGUgb2YgZHJpdmVyJ3MgY29udHJvbC4KClVzZSBSTVcgY2FwYWJpbGl0eSBhY2Nlc3NvcnMgd2hp
Y2ggZG9lcyBwcm9wZXIgbG9ja2luZyB0byBhdm9pZCBsb3NpbmcKY29uY3VycmVudCB1cGRhdGVz
IHRvIHRoZSByZWdpc3RlciB2YWx1ZS4gT24gcmVzdG9yZSwgY2xlYXIgdGhlIEFTUE1DCmZpZWxk
IHByb3Blcmx5LgoKRml4ZXM6IDc2ZDg3MGVkMDlhYiAoImF0aDEwazogZW5hYmxlIEFTUE0iKQpT
dWdnZXN0ZWQtYnk6IEx1a2FzIFd1bm5lciA8bHVrYXNAd3VubmVyLmRlPgpTaWduZWQtb2ZmLWJ5
OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+ClJldmlld2Vk
LWJ5OiBTaW1vbiBIb3JtYW4gPHNpbW9uLmhvcm1hbkBjb3JpZ2luZS5jb20+CkFja2VkLWJ5OiBL
YWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3JnPgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwot
LS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMgfCA5ICsrKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jIGIvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYwppbmRleCBhN2Y0NGY2MzM1ZmIuLjkyNzVhNjcyZjkw
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYworKysg
Yi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jCkBAIC0xOTYzLDggKzE5NjMs
OSBAQCBzdGF0aWMgaW50IGF0aDEwa19wY2lfaGlmX3N0YXJ0KHN0cnVjdCBhdGgxMGsgKmFyKQog
CWF0aDEwa19wY2lfaXJxX2VuYWJsZShhcik7CiAJYXRoMTBrX3BjaV9yeF9wb3N0KGFyKTsKIAot
CXBjaWVfY2FwYWJpbGl0eV93cml0ZV93b3JkKGFyX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEws
Ci0JCQkJICAgYXJfcGNpLT5saW5rX2N0bCk7CisJcGNpZV9jYXBhYmlsaXR5X2NsZWFyX2FuZF9z
ZXRfd29yZChhcl9wY2ktPnBkZXYsIFBDSV9FWFBfTE5LQ1RMLAorCQkJCQkgICBQQ0lfRVhQX0xO
S0NUTF9BU1BNQywKKwkJCQkJICAgYXJfcGNpLT5saW5rX2N0bCAmIFBDSV9FWFBfTE5LQ1RMX0FT
UE1DKTsKIAogCXJldHVybiAwOwogfQpAQCAtMjgyMSw4ICsyODIyLDggQEAgc3RhdGljIGludCBh
dGgxMGtfcGNpX2hpZl9wb3dlcl91cChzdHJ1Y3QgYXRoMTBrICphciwKIAogCXBjaWVfY2FwYWJp
bGl0eV9yZWFkX3dvcmQoYXJfcGNpLT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKIAkJCQkgICZhcl9w
Y2ktPmxpbmtfY3RsKTsKLQlwY2llX2NhcGFiaWxpdHlfd3JpdGVfd29yZChhcl9wY2ktPnBkZXYs
IFBDSV9FWFBfTE5LQ1RMLAotCQkJCSAgIGFyX3BjaS0+bGlua19jdGwgJiB+UENJX0VYUF9MTktD
VExfQVNQTUMpOworCXBjaWVfY2FwYWJpbGl0eV9jbGVhcl93b3JkKGFyX3BjaS0+cGRldiwgUENJ
X0VYUF9MTktDVEwsCisJCQkJICAgUENJX0VYUF9MTktDVExfQVNQTUMpOwogCiAJLyoKIAkgKiBC
cmluZyB0aGUgdGFyZ2V0IHVwIGNsZWFubHkuCi0tIAoyLjMwLjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==
