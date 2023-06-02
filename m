Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1406C7EE2E
	for <ath10k@archiver.kernel.org>; Fri,  2 Jun 2023 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GmDRkKOjSEM3Zxk7Sao9GGtDFjiRcJ5zW57VFp4U0M=; b=oi65mPIIEnyNmv
	U8C/8PWdhz6Js/a8U+mFQOAQOn1DFzWTDSpRWdzw6BGSR6T4PXX0pq32T+zel44SU+9wn+d749O0M
	XoLuWVOblzmQrg1EkbP29giJTDZXuFlLUEKpQRljHBTzmcaRRma5ACmTguJm/j20j7+u0RXcSDc7h
	E3DBG1CaMmYc6IwxdvHw0q/CSOTFPsZAvGWgC6FrAQkaBfrSRMarfijeSDINkiWtunh3Tj4sozN9y
	T6m2RGrv0BDIYL86KGfRwOO6/vxci5N4OHe1/Ym0fdlsN8I99eh64Y6koMh9miMpV3Emqtt9rwgpD
	osVJ7BhPFXHCAkpDy5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q53HB-006nh5-0E;
	Fri, 02 Jun 2023 11:49:01 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q53H8-006ng4-0E
	for ath10k@lists.infradead.org;
	Fri, 02 Jun 2023 11:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685706538; x=1717242538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dBosWhrvI2xKSJwVt6rV8Xi3asJ1Qc/KI8E1WYfbsR4=;
  b=RIWdthCwMyNhdt7kafs8DB4oa5fINXCPNlXeYuTIcGSxVjyCZr0lQDGQ
   Ey9mMo/NOzQPaFu06HjxmTS3OnKFOwl1dZGUTnfcARpz1gLz1RVsyvRk3
   b4JS56hj1IZEhug6TLH2yBE69+kFgCXxGh3vQRYNfQWjOzhWxxYpeev5A
   i0HK/9Lr+T27Ims/n49iOrrK7Dan8KQKd3N6fmjEjbd5AlNxWVXChqYUJ
   6v5zOrb94sVjB8glYkZY7dIPCwrlHRChzp4aAiIs9B7hEIQEz3UB80TB0
   1KhJamuYnQX0oMhZq3oiqgB0lg+fr1in6QuSOS5MvUuU91pDqH+P4TLCS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358279746"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="358279746"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707819519"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="707819519"
Received: from rspatil-mobl3.gar.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.251.208.112])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:48:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
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
Subject: [RFC PATCH v1 09/13] wifi: ath10k: Use pci_disable/enable_link_state()
Date: Fri,  2 Jun 2023 14:47:46 +0300
Message-Id: <20230602114751.19671-10-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230602114751.19671-1-ilpo.jarvinen@linux.intel.com>
References: <20230602114751.19671-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_044858_197794_33C0E63B 
X-CRM114-Status: GOOD (  12.05  )
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

YXRoMTBrIGRyaXZlciBhZGp1c3RzIEFTUE0gc3RhdGUgaXRzZWxmIHdoaWNoIGxlYXZlcyBBU1BN
IHNlcnZpY2UKZHJpdmVyIGluIFBDSSBjb3JlIHVuYXdhcmUgb2YgdGhlIGxpbmsgc3RhdGUgY2hh
bmdlcyB0aGUgZHJpdmVyCmltcGxlbWVudGVkLgoKQ2FsbCBwY2lfZGlzYWJsZV9saW5rX3N0YXRl
KCkgYW5kIHBjaV9lbmFibGVfbGlua19zdGF0ZSgpIGluc3RlYWQgb2YKYWRqdXN0aW5nIEFTUE1D
IGZpZWxkIGluIExOS0NUTCBkaXJlY3RseSBpbiB0aGUgZHJpdmVyIGFuZCBsZXQgUENJIGNvcmUK
aGFuZGxlIHRoZSBBU1BNIHN0YXRlIG1hbmFnZW1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBJbHBvIErD
pHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYyB8IDggKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MGsvcGNpLmMKaW5kZXggOTI3NWE2NzJmOTBjLi5lYzJiMTdlNzNiMGUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMKKysrIGIvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway9wY2kuYwpAQCAtMTk2Myw5ICsxOTYzLDggQEAgc3RhdGljIGludCBh
dGgxMGtfcGNpX2hpZl9zdGFydChzdHJ1Y3QgYXRoMTBrICphcikKIAlhdGgxMGtfcGNpX2lycV9l
bmFibGUoYXIpOwogCWF0aDEwa19wY2lfcnhfcG9zdChhcik7CiAKLQlwY2llX2NhcGFiaWxpdHlf
Y2xlYXJfYW5kX3NldF93b3JkKGFyX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCi0JCQkJCSAg
IFBDSV9FWFBfTE5LQ1RMX0FTUE1DLAotCQkJCQkgICBhcl9wY2ktPmxpbmtfY3RsICYgUENJX0VY
UF9MTktDVExfQVNQTUMpOworCXBjaV9lbmFibGVfbGlua19zdGF0ZShhcl9wY2ktPnBkZXYsIGFy
X3BjaS0+bGlua19jdGwgJgorCQkJICAgICAgKFBDSUVfTElOS19TVEFURV9MMFMgfCBQQ0lFX0xJ
TktfU1RBVEVfTDEpKTsKIAogCXJldHVybiAwOwogfQpAQCAtMjgyMiw4ICsyODIxLDcgQEAgc3Rh
dGljIGludCBhdGgxMGtfcGNpX2hpZl9wb3dlcl91cChzdHJ1Y3QgYXRoMTBrICphciwKIAogCXBj
aWVfY2FwYWJpbGl0eV9yZWFkX3dvcmQoYXJfcGNpLT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKIAkJ
CQkgICZhcl9wY2ktPmxpbmtfY3RsKTsKLQlwY2llX2NhcGFiaWxpdHlfY2xlYXJfd29yZChhcl9w
Y2ktPnBkZXYsIFBDSV9FWFBfTE5LQ1RMLAotCQkJCSAgIFBDSV9FWFBfTE5LQ1RMX0FTUE1DKTsK
KwlwY2lfZGlzYWJsZV9saW5rX3N0YXRlKGFyX3BjaS0+cGRldiwgUENJRV9MSU5LX1NUQVRFX0ww
UyB8IFBDSUVfTElOS19TVEFURV9MMSk7CiAKIAkvKgogCSAqIEJyaW5nIHRoZSB0YXJnZXQgdXAg
Y2xlYW5seS4KLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
