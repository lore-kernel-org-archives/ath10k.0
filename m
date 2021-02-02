Return-Path: <SRS0=CwSx=HE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7450DC433E0
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 08:59:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E4C664F58
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 08:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E4C664F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dd-wrt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IQx47RGNFyaK+0vhApsZjoNRTP4oEwsymW7jBrKVj34=; b=xvAsKDHXfrRBO6phsBGBZYhkX
	vl1pf14HuXdRD1J6yUEBFvSwUpd2/r3TRy4jaXdS+Bkq9uSTRgtC8p3Nkf0RildxoMdHbd9F+APCY
	GktRgOi3cXRUJH2uQgNRsv9DFy8j05SruTQYkbX3/ykTof39KLIc7STVMYxfIaKYMsPor6+Ai3N7G
	4EtoT0Ex6DkZzmrMpZRoXp99E8Yypm7nEQH3qSTqYn4j83u/Umg1qnKwHD6NgToe2MsihyMI+tIdT
	EWYYYNz8HTpl0RlGPzyJ7vHqbztdtMG9Td/UWlRpbsZxgGG+elHlMq+qlz1lKEQBB61PuUq4Ft4yY
	ykIduwlmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6rWP-0006XN-Q7; Tue, 02 Feb 2021 08:58:53 +0000
Received: from mail.as201155.net ([185.84.6.188])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6rWM-0006Wo-MP
 for ath10k@lists.infradead.org; Tue, 02 Feb 2021 08:58:52 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:34804
 helo=webmail.newmedia-net.de)
 by mail.as201155.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1l6rWI-0006RZ-0Q; Tue, 02 Feb 2021 09:58:46 +0100
X-CTCH-RefID: str=0001.0A782F23.60191446.0041, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com;
 s=mikd; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID;
 bh=UO9ZSJpym1SKoiqN/8k+7fq1DFCzmXhprf6+p337HNQ=; 
 b=JCkoeHXxTVWY/qnrh7Q3Ta8/n/4h7V0Av9Nh11zpKFxjOcsIoKErvYORKHwgRQ77LZnfEkFkYAesKAg7Sd4YFNY6btBVz1R9nT51FN1BiuYwd6Svc6lwfq//PtR+KCXca2IfGhq+WaElS+Hez1xmsC6WW1hqKls2gEQFxavx3ow=;
Message-ID: <93607622-3fef-a203-6ca0-3daa54dff07c@dd-wrt.com>
Date: Tue, 2 Feb 2021 09:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0) Gecko/20100101
 Thunderbird/86.0
Subject: Re: EAP AP/VLAN: multicast not send to client
To: Sven Eckelmann <sven@narfation.org>, ath10k@lists.infradead.org,
 Ben Greear <greearb@candelatech.com>
References: <268706864.fOQeQAt3TZ@ripper>
 <7759ef6a-2853-5c13-12d9-5cc966b10833@dd-wrt.com> <6253766.kEHZKgWlQx@ripper>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <6253766.kEHZKgWlQx@ripper>
X-Received: from [81.201.155.134] (helo=[172.29.0.186])
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1l6rWH-0008P0-RE; Tue, 02 Feb 2021 09:58:45 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_035850_877245_C8CB37ED 
X-CRM114-Status: GOOD (  14.96  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
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

CkFtIDAyLjAyLjIwMjEgdW0gMDk6MjMgc2NocmllYiBTdmVuIEVja2VsbWFubjoKPiBPbiBUdWVz
ZGF5LCAyIEZlYnJ1YXJ5IDIwMjEgMDg6MDQ6NTYgQ0VUIFNlYmFzdGlhbiBHb3R0c2NoYWxsIHdy
b3RlOgo+PiB0aGUgc3RhbmRhcmQgYXRoMTBrIGZpcm13YXJlIGbDvHIgcWNhOTg4eCBjaGlwc2V0
cyBkb2VzIGZpbHRlciB2bGFucy4KPiBKdXN0IHRvIGJlIHN1cmUgdGhhdCB3ZSBhcmUgdGFsa2lu
ZyBhYm91dCB0aGUgc2FtZSB0aGluZzogSSBhbSAob3IgYWN0dWFsbHkKPiBob3N0YXBkIGlzKSB1
c2luZyBOTDgwMjExX0lGVFlQRV9BUF9WTEFOIGhlcmUgLSBub3QgODAyLjFRLgp0aGVuIGl0IG1p
Z2h0IGJlIHNvbWV0aGluZyBkaWZmZXJlbnQuIGknbSBub3Qgc3VyZSBhdCB0aGF0IHBvaW50LiBi
dXQgCmNvbnNpZGVyIHRoYXQgQVBfVkxBTiBpcyBhbHNvIHVzZWQgZm9yIFdEUyBTVEEvV0RTIEFQ
IGltcGxlbWVudGF0aW9ucy4Kc28gZWFjaCB3ZHMgc3RhdGlvbiBiZWNvbWVzIGEgaW5kaXZpZHVh
bCBpbnRlcmZhY2Ugb24gYXAgc2lkZSBmb3IgCmJyaWRnaW5nLiB0aGF0IG1pZ2h0IG9mIGNvdXJz
ZSBoYXZlIGEgaW5mbHVlbmNlIHRvIGJyb2FkY2FzdC9tdWx0aWNhc3QgCmZyYW1lcwppbiBhZGRp
dGlvbiB0aGUgMTAuNCBmaXJtd2FyZSBzZXJpZXMgaGFzIGEgc3BlY2lhbCB3bWkgZmxhZyB3aGlj
aCBpcyBub3QgCnVzZWQgYnkgYXRoMTBrLCBidXQgc29sdmVkIGFsb3Qgb2YgcHJvYmxlbXMgZm9y
IG1lIChpbiBteSBjYXNlIHdpdGggCnJlYXV0aGVudGljYXRpb24pCldNSV9WREVWX0RJU0FCTEVf
NF9BRERSX1NSQ19MUk4KdGhpcyBtaWdodCBiZSB1bnJlbGF0ZWQgdG8geW91ciBpc3N1ZS4gYnV0
IHRoaXMgZmxhZyBtdXN0IGJlIHNldCBhbnl3YXkgCmZvciBwcm9wZXIgd29yay4gYnV0IGl0IGlz
bnQgYnkgZGVmYXVsdCBpbiBhbGwgMTAuNCBmaXJtd2FyZXMuCgoKPgo+PiB0aGUgb25seSBvcHRp
b24gZm9yIHlvdSBpcyB1c2luZyB0aGUgQ1QgZmlybXdhcmUgYnkgY2FuZGVsYXRlY2gsIHdoaWNo
Cj4+IGRvZXMgbm90IHN1ZmZlciBmcm9tIHRoaXMgaXNzdWUuCj4gVGhhbmtzIGZvciB0aGUgaW50
ZXJlc3RpbmcgaGludCAtIGJ1dCB0aGVyZSBpcyBhIHR3aXN0IDopCj4KPiBJJ3ZlIGluaXRpYWxs
eSB0cmllZCBhdGgxMGstY3Qgd2l0aCB0aGUgY2FuZGVsYXRlY2ggZmlybXdhcmUuCj4gNS40Ljkz
KzIwMjEtMDEtMTEtOWZlMWRmN2QtMSB3aXRoIDEwLjRiLWN0LTQwMTktZlctMTMtNWFlMzM3YmIx
IHRvIGJlIG1vcmUKPiBwcmVjaXNlLiBBbmQgbGF0ZXIgYWxzbyBzd2l0Y2hlZCB0byB0aGUgYXRo
MTBrIGJhY2twb3J0IGZyb20gNS44LjE4KC0xLTUpLgo+IFNvcnJ5IGZvciBmb3JnZXR0aW5nIHRv
IG1lbnRpb24gc3VjaCBkZXRhaWxzIGluIHRoZSBmaXJzdCBtYWlsLgo+Cj4gQW5kIEkndmUganVz
dCBub3RpY2VkIHRoYXQgSSB3YXMgYWx3YXlzIHRlc3Rpbmcgd2l0aCB0aGUgYXRoMTBrLWN0IGZp
cm13YXJlCj4gKHdoaWNoIGlzIHRoZSBkZWZhdWx0IGluIE9wZW5XcnQgYnV0IG5ldmVyIHdpdGgg
dGhlIG9mZmljaWFsIG9uZSBmcm9tIEthbGxlJ3MKPiBhdGgxMGstZmlybXdhcmUgdHJlZS4gU28g
SSd2ZSBqdXN0IHN3aXRjaGVkIHRvIFFDQTQwMTkgaHcxLjAgMTAuNC0zLjYtMDAxNDAKPiBmcm9t
IHRoZSBvZmZpY2lhbCB0cmVlIGFuZCB0aGUgcHJvYmxlbSB3ZW50IGF3YXkuCj4KPiBGb3IgQmVu
IEdyZWVhcidzIGZpcm13YXJlLCB0aGUgb25seSB3b3JrYXJvdW5kIHdoaWNoIEkgZm91bmQgdW50
aWwgbm93IHdhcyB0bwo+IHNldCBOTDgwMjExX0FUVFJfTVVMVElDQVNUX1RPX1VOSUNBU1RfRU5B
QkxFRCB0byAxIHRvIGZvcmNlIG1hYzgwMjExIHRvIHNlbmQKPiBtdWx0aWNhc3QgYXMgdW5pY2Fz
dC4Kc28gaWYgaXRzIGEgcHVyZSBtdWx0aWNhc3QvdW5pY2FzdCBpc3N1ZSBpdCBjb3VsZCBiZSBh
bHNvIGEgYmFzaWMgcmF0ZSAKaXNzdWUgZm9yIGN0IGZpcm13YXJlcy4KbGV0cyBzZWUgd2hhdCBi
ZW4gaGFzIHRvIHNheSBoZXJlLgo+Cj4gS2luZCByZWdhcmRzLAo+IAlTdmVuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0
CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
