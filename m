Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F95EE644C
	for <ath10k@archiver.kernel.org>; Fri, 15 Sep 2023 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rHx/mvkl5KAaH8akE9ztKiT+j+pAnBOsvw4pB7rTTtM=; b=eMCuz8HzI91Pf75E1OBgfRn3g+
	ThUfZF8AR/zJw0iBzNewT+LUDb7qMx21NTbUu8CmIPscHZpHihosdkLfs9/QLtfC7I1703usZICrK
	YX7/8cUNvP4E9j4dYBc+ThNQGVnIOetoDBQTM99zVZQR0J4g6UQEv8vgEJAhwL0CXQOPsY0Tx5E84
	1u6MtcEG/5F89Cxi6lEZtHJ90mbEPo5S+hWdl1YdpmiCx6WETNF9km2r2rOfiCl3IlVFu4SOWr3Vg
	oMX0lF3nAxejsn/I6/76cHka2OGAtHEZw/MSwssREzBYw/NpwQ078e1Xnjn3TIzbVTbbzumXMaCK1
	+/U5KA9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5Vo-00AKDM-24;
	Fri, 15 Sep 2023 09:53:20 +0000
Received: from [42.101.60.195] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5Vk-00AKCX-2I
	for ath10k@lists.infradead.org;
	Fri, 15 Sep 2023 09:53:18 +0000
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 5B5BF60AA49FE;
	Fri, 15 Sep 2023 17:53:07 +0800 (CST)
Message-ID: <bc26c08d-5bcd-59e0-2262-c6114cbe5afc@nfschina.com>
Date: Fri, 15 Sep 2023 17:53:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH wireless-next 6/9] wifi: ath10k: Remove unnecessary
 (void*) conversions
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, kvalo@kernel.org, toke@toke.dk
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: yunchuan <yunchuan@nfschina.com>
In-Reply-To: <7855cee1-c554-40b7-885f-d7f8d3d90979@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_025316_976069_0E672C8A 
X-CRM114-Status: UNSURE (   7.12  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

T24gMjAyMy85LzE0IDIyOjQ4LCBKZWZmIEpvaG5zb24gd3JvdGU6Cj4gT24gOS8xMy8yMDIzIDk6
MDUgUE0sIFd1IFl1bmNodWFuIHdyb3RlOgo+PiBObyBuZWVkIGNhc3QgKHZvaWQqKSB0byAoc3Ry
dWN0IGh0dF9yeF9yaW5nX3NldHVwX3JpbmczMiAqKSwKPj4gKHN0cnVjdCBodHRfcnhfcmluZ19z
ZXR1cF9yaW5nNjQgKiksIChzdHJ1Y3QgYXRoX3NvZnRjICopCj4+IG9yIChzdHJ1Y3QgYXRoX2h3
ICopLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBXdSBZdW5jaHVhbiA8eXVuY2h1YW5AbmZzY2hpbmEu
Y29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRfdHgu
YyB8IDYgKystLS0tCj4+IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg5ay9wY2kuY8Kg
wqDCoMKgIHwgNiArKystLS0KPgo+IGF0aDlrIGNoYW5nZSBzaG91bGQgYmUgaW4gYSBzZXBhcmF0
ZSBwYXRjaCBzaW5jZSBpdCBoYXMgYSBkaWZmZXJlbnQgCj4gbWFpbnRhaW5lciB0aGFuIGF0aDEw
awo+CkhpLAoKU29ycnkgZm9yIHRoaXMgY2FyZWxlc3MgbWlzdGFrZSwgSSB3aWxsIHNlbmQgdjIg
cGF0Y2ggbmV4dCB3ZWVrIHRvIGZpeCAKdGhpcyBtaXN0YWtlLgpUaGFua3MgZm9yIHlvdXIgcmVt
aW5kZXIhCgpXdSBZdW5jaHVhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
