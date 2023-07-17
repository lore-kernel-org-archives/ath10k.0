Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B35DEB64DC
	for <ath10k@archiver.kernel.org>; Mon, 17 Jul 2023 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmot3EF9Zh5BLDTRLp5GrCkdhQOE5YwLsE2mHu2N2zw=; b=CN5j/Ap+J06mfc
	++UYSMRnxeNiLBUVREscy6mmh74/CCva9j1iX3EGRizgxeup4NFKV1PY94Xb2SvqQvTRyy1G2/BS6
	cvfCjxOLZVLF3Rz5sQIdOOdAbfRJlKKyDoo/P3ZFiO4gGDx1gCSoqw7ifyACpRYOlf96DUzi8RtcX
	EghCUvTaaYYD+HsBDQlMAxeWqnU6eQRBrdH4MDr95P/WC20G9E4eoFz9oDky7xnT+G0ErVYq0FmiV
	47aGcVAACr4fZyItSmhpfZZuWOjJIiAu7igy9rSECClXdY44KFxkiv+/eAAnchBx5FgKdT0ZoOnHs
	hGLh2r38+MTu0GVRx5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLN0P-003wgs-1y;
	Mon, 17 Jul 2023 12:07:09 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLN0H-003wfH-2k
	for ath10k@lists.infradead.org;
	Mon, 17 Jul 2023 12:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689595621; x=1721131621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AAJmAZ+sXj0MECM7XPTmd1pa5VhGBIS57bxBnXZUE7M=;
  b=OzLJ3HPWHPfBvhxDyh9IvK/vLAEyMNM1LzdDyqgm5Ouspdkfqs9gIcvZ
   rmCy8RdQpnRi+7H5t5CwKiysVVHho0AcqBTKpS+ZHq8+RAjoESdTWBPYO
   wV4SGD368VSevEimjtjK4qD0lpaThHyZYhzaE2hLC+bAd//t9J5Ev+zXb
   ETxfyixfCs1J1Xg1z9a4Nz1vd9yJPpjEFI28paN5zHz7NA4sHBxrU28DW
   Je0R8WzgeEnhi+rG9NR+etq/yIaggU8OO1NNKMjTNlMF7c0b0Q6yYfbCq
   5+wJjMAMkPwiP1VrWw95H+GZLpEiEbjwKuQS6JP5gwzgw0SCH07SBKI0w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="432081925"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432081925"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 05:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="752876404"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="752876404"
Received: from dkravtso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.45.233])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 05:06:55 -0700
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	Michal Kazior <michal.kazior@tieto.com>,
	Janusz Dziedzic <janusz.dziedzic@tieto.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dean Luick <dean.luick@cornelisnetworks.com>,
	=?UTF-8?q?Jonas=20Dre=C3=9Fler?= <verdre@v0yd.nl>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Simon Horman <simon.horman@corigine.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 10/11] wifi: ath10k: Use RMW accessors for changing LNKCTL
Date: Mon, 17 Jul 2023 15:05:02 +0300
Message-Id: <20230717120503.15276-11-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230717120503.15276-1-ilpo.jarvinen@linux.intel.com>
References: <20230717120503.15276-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_050703_091920_CBD2E079 
X-CRM114-Status: UNSURE (   9.87  )
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
