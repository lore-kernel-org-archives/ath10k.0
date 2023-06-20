Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBF5EB64D7
	for <ath10k@archiver.kernel.org>; Tue, 20 Jun 2023 13:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oj1blX0TzVa6fvw2majMYp1xHl02H6jeDA2MzcueR7s=; b=RXXmyONc5aUW+Z
	z0AKLCXdi1raS3ArQufpsB4OMO1wYaafOqOt/8LeQ0leYgJCWPmRgBU9Qy8wkGgLQQpjxMOXUW7uY
	ImhG1nS0nzdibIZYT8K/oL//UduaDb2tSW2f9GU5b3ltCbq3yVDV+bOYzoPrO1UE78IjQB6F+kmvk
	rGQwsey8gXvuc53zuk3XdcWgmKgMTcCHOKomGGceEMkOqYF7UvJ5kJEMbhW4yWKQcz7uf9MJXZaD9
	Ex9RyhddRGxZIor5fV8rQrnRnNm7wCFVAnlXM4W1IsiBNxZQAh7PD3L8ubdbId3+koczRNkkPKaJU
	8vCZHVsv6oXTKn0qg2rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbiI-00BRlR-0F;
	Tue, 20 Jun 2023 13:48:06 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbiF-00BRhf-2d
	for ath10k@lists.infradead.org;
	Tue, 20 Jun 2023 13:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687268883; x=1718804883;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=79FdQPD9G1hTbxV3ILKzfRizWx5CAXGS/BZgPUaFIfc=;
  b=dCQlTNI4dvsEdaIqGyHWzBOZM8xo7QDY3MDDUMk911OR9DdM2aejx7gj
   SK33XeJlgz6n98V26Rd04Ba4lFdAojpgA1VZ+CXrDvjMCxXQiEfkpsqFW
   ds2+b/O7o6oHhDPhhPyrMFthWO+TCkVS/WdL9cF6q4Q3PIn0hs1+XJwwX
   Oh5OJWJG0Wys+LaR/7hK8rUe68qbgQsNT8ksWw+sMtuLFGnvTdbGvbcWf
   uwS/DKXUc2RvOws/z9xfblIfLSioTTT0hXXB776df1DDi7nDGc2cyt3by
   vD9nyxkcyzPvEND7k2U43Ck/9uxwInlWICsKOHviKT/GJ4loVfET4qoQI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="362401671"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="362401671"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="827007148"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="827007148"
Received: from eshaanan-mobl.ger.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.61.137])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:47:57 -0700
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
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Janusz Dziedzic <janusz.dziedzic@tieto.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dean Luick <dean.luick@cornelisnetworks.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 10/10] wifi: ath10k: Use RMW accessors for changing LNKCTL
Date: Tue, 20 Jun 2023 16:46:24 +0300
Message-Id: <20230620134624.99688-11-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230620134624.99688-1-ilpo.jarvinen@linux.intel.com>
References: <20230620134624.99688-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_064803_939031_03975002 
X-CRM114-Status: GOOD (  11.72  )
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
OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+CkFja2VkLWJ5
OiBLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3JnPgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
ZwotLS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMgfCA5ICsrKysrLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jIGIvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYwppbmRleCBhN2Y0NGY2MzM1ZmIuLjkyNzVhNjcy
ZjkwYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYwor
KysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jCkBAIC0xOTYzLDggKzE5
NjMsOSBAQCBzdGF0aWMgaW50IGF0aDEwa19wY2lfaGlmX3N0YXJ0KHN0cnVjdCBhdGgxMGsgKmFy
KQogCWF0aDEwa19wY2lfaXJxX2VuYWJsZShhcik7CiAJYXRoMTBrX3BjaV9yeF9wb3N0KGFyKTsK
IAotCXBjaWVfY2FwYWJpbGl0eV93cml0ZV93b3JkKGFyX3BjaS0+cGRldiwgUENJX0VYUF9MTktD
VEwsCi0JCQkJICAgYXJfcGNpLT5saW5rX2N0bCk7CisJcGNpZV9jYXBhYmlsaXR5X2NsZWFyX2Fu
ZF9zZXRfd29yZChhcl9wY2ktPnBkZXYsIFBDSV9FWFBfTE5LQ1RMLAorCQkJCQkgICBQQ0lfRVhQ
X0xOS0NUTF9BU1BNQywKKwkJCQkJICAgYXJfcGNpLT5saW5rX2N0bCAmIFBDSV9FWFBfTE5LQ1RM
X0FTUE1DKTsKIAogCXJldHVybiAwOwogfQpAQCAtMjgyMSw4ICsyODIyLDggQEAgc3RhdGljIGlu
dCBhdGgxMGtfcGNpX2hpZl9wb3dlcl91cChzdHJ1Y3QgYXRoMTBrICphciwKIAogCXBjaWVfY2Fw
YWJpbGl0eV9yZWFkX3dvcmQoYXJfcGNpLT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKIAkJCQkgICZh
cl9wY2ktPmxpbmtfY3RsKTsKLQlwY2llX2NhcGFiaWxpdHlfd3JpdGVfd29yZChhcl9wY2ktPnBk
ZXYsIFBDSV9FWFBfTE5LQ1RMLAotCQkJCSAgIGFyX3BjaS0+bGlua19jdGwgJiB+UENJX0VYUF9M
TktDVExfQVNQTUMpOworCXBjaWVfY2FwYWJpbGl0eV9jbGVhcl93b3JkKGFyX3BjaS0+cGRldiwg
UENJX0VYUF9MTktDVEwsCisJCQkJICAgUENJX0VYUF9MTktDVExfQVNQTUMpOwogCiAJLyoKIAkg
KiBCcmluZyB0aGUgdGFyZ2V0IHVwIGNsZWFubHkuCi0tIAoyLjMwLjIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0
aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTBrCg==
