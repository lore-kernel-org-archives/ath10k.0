Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4302DC7EE23
	for <ath10k@archiver.kernel.org>; Wed, 17 May 2023 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekvmHLqk1WQJ1TV6xi/BGM0UkZeva0IZIxC8x41vSrk=; b=j5KhODPjqDmRpx
	+RGEfvPEr5KCaWDFeK/kWWdPH/fljn90tXrXMMuPA42D+9whCetbJP4tYrQmJ0Di8oQ/X7dFkN1W6
	9dRfy/6ON2bfxkAsgXmnktrtyJgkh8B1gGZlKXFePbWtDEL8PxR8pwmmVUxvWApO8T1oXlJrCx12B
	byttlnmA59UKaktfEjQhWi2Wypn2kxSNbyHN/jgegpT02UOL5iWpkskW8wLvCYaGyeJJjVKnfnV85
	mc+MsBQLgdTR+DUiO5TuHJhh1NW+Kwd+Ul7dYWN568Hg4MWxMtky4khTDGgbvPuzJal80hMooa3yp
	XY29rlMSr+RmhWuaNTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEnQ-009V2w-0F;
	Wed, 17 May 2023 10:54:16 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEnN-009UzX-1B
	for ath10k@lists.infradead.org;
	Wed, 17 May 2023 10:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684320853; x=1715856853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FuFXzjOd8Jq9CElj4g5CQDGQFvJ4smZ3IyuF6JWPb+E=;
  b=NV4+RYGaj/+5uzM3kF9pQXrnWDBIWAMciGiqKUKIVjldRwZjue66DcFu
   AzY02Y+5qa5kp/5ZFExj4TmCSlJWylifG4C4hVcPfF41j2gldAzL52Y6/
   bPNaOyHpK2Nfxdxd3EP6ijcFEs81LG4x9F7QavWkisZsVilsf9J5OEyv2
   mJivFweWJTMzT4+ozA8y55qVSQiSZb+arzwduegSYFP4zwQfPShPhpUrF
   +zSPiv5QvJdwK+TBtvSUYas4Ifj23IndS2QD4MbD84Bi/rrTouuME8UmM
   dfp0O32gqDh+ZUdFU+AHBJ8zwOM7sl9w8hyh5FCyy+ZFuTWp+cZcAKv6p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="438071917"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="438071917"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 03:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="734651392"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="734651392"
Received: from lnstern-mobl1.amr.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.251.221.185])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 03:53:59 -0700
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
Subject: [PATCH v2 9/9] wifi: ath10k: Use RMW accessors for changing LNKCTL
Date: Wed, 17 May 2023 13:52:35 +0300
Message-Id: <20230517105235.29176-10-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230517105235.29176-1-ilpo.jarvinen@linux.intel.com>
References: <20230517105235.29176-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_035413_417585_44A4C502 
X-CRM114-Status: GOOD (  11.36  )
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
OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+CkNjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9w
Y2kuYyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsv
cGNpLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jCmluZGV4IGE3ZjQ0
ZjYzMzVmYi4uOTI3NWE2NzJmOTBjIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTBrL3BjaS5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNp
LmMKQEAgLTE5NjMsOCArMTk2Myw5IEBAIHN0YXRpYyBpbnQgYXRoMTBrX3BjaV9oaWZfc3RhcnQo
c3RydWN0IGF0aDEwayAqYXIpCiAJYXRoMTBrX3BjaV9pcnFfZW5hYmxlKGFyKTsKIAlhdGgxMGtf
cGNpX3J4X3Bvc3QoYXIpOwogCi0JcGNpZV9jYXBhYmlsaXR5X3dyaXRlX3dvcmQoYXJfcGNpLT5w
ZGV2LCBQQ0lfRVhQX0xOS0NUTCwKLQkJCQkgICBhcl9wY2ktPmxpbmtfY3RsKTsKKwlwY2llX2Nh
cGFiaWxpdHlfY2xlYXJfYW5kX3NldF93b3JkKGFyX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEws
CisJCQkJCSAgIFBDSV9FWFBfTE5LQ1RMX0FTUE1DLAorCQkJCQkgICBhcl9wY2ktPmxpbmtfY3Rs
ICYgUENJX0VYUF9MTktDVExfQVNQTUMpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0yODIxLDggKzI4
MjIsOCBAQCBzdGF0aWMgaW50IGF0aDEwa19wY2lfaGlmX3Bvd2VyX3VwKHN0cnVjdCBhdGgxMGsg
KmFyLAogCiAJcGNpZV9jYXBhYmlsaXR5X3JlYWRfd29yZChhcl9wY2ktPnBkZXYsIFBDSV9FWFBf
TE5LQ1RMLAogCQkJCSAgJmFyX3BjaS0+bGlua19jdGwpOwotCXBjaWVfY2FwYWJpbGl0eV93cml0
ZV93b3JkKGFyX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCi0JCQkJICAgYXJfcGNpLT5saW5r
X2N0bCAmIH5QQ0lfRVhQX0xOS0NUTF9BU1BNQyk7CisJcGNpZV9jYXBhYmlsaXR5X2NsZWFyX3dv
cmQoYXJfcGNpLT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKKwkJCQkgICBQQ0lfRVhQX0xOS0NUTF9B
U1BNQyk7CiAKIAkvKgogCSAqIEJyaW5nIHRoZSB0YXJnZXQgdXAgY2xlYW5seS4KLS0gCjIuMzAu
MgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEw
ayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
