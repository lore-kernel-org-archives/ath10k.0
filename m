Return-Path: <SRS0=CwSx=HE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E2FC433E0
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 07:06:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B247164E8F
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 07:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B247164E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dd-wrt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l6HekGN6hxDQPsDYPrtl8nLdsyumRV2GnLE8GBCIqaU=; b=MGIM/0wuVmnycUQw2WRmmTQz9
	v3fG2QLTqFwrYLJ8iNK41ITi/UFpRjhTgyxxyWZ7YqSnlkGVbvkv4J288LEuzUYLwl77sB6V6j/Z6
	h+ygV/Pc7nhwMMhCD63FAr1K9Ns368I5y10SbZ9u1bZgcXhg3Ge+fdng+bLgKnThEfKRlafd2uRAj
	VoEOftdaKjzRzO+NHalPBenWfyo0v9xQIkssq6DaZwV8sibdRnVF869To3fO3Er+sxdOrlENCmc7N
	QeKJyNV/Xm//Nu6aLFHd+wwEEMH209OWxA+4V2MZmNz8pDQvBIcDhIY9luO7ScPocIVR8YUQEGGTU
	/nwQXwDJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6pkG-0003Dz-KK; Tue, 02 Feb 2021 07:05:04 +0000
Received: from mail.as201155.net ([185.84.6.188])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6pkD-0003DC-Tp
 for ath10k@lists.infradead.org; Tue, 02 Feb 2021 07:05:03 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:54702
 helo=webmail.newmedia-net.de)
 by mail.as201155.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1l6pkA-0003Ox-1q; Tue, 02 Feb 2021 08:04:58 +0100
X-CTCH-RefID: str=0001.0A782F1E.6018F99A.0072, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com;
 s=mikd; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID;
 bh=+XnFiayL3WqgWhVfmDyUmCOmBWPwamB3dmtXwy3AYf8=; 
 b=GRG5DI9tSpdVi39Zd2P8DT+p9B5hJUgJIxDz95nCe/B7LtYPE92jjLR02sCtqggfW9ZlSmTZmKLdKGIi2LioQT8s2kdbcrhYdK3hs+TiVhVYdQDlmCMKXZmLrmI/zehv5NZE8uoUi+zKGPHm1cELk8ELxbooThhlFLIUxFwP0Fc=;
Message-ID: <7759ef6a-2853-5c13-12d9-5cc966b10833@dd-wrt.com>
Date: Tue, 2 Feb 2021 08:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0) Gecko/20100101
 Thunderbird/86.0
Subject: Re: EAP AP/VLAN: multicast not send to client
To: Sven Eckelmann <sven@narfation.org>, ath10k@lists.infradead.org
References: <268706864.fOQeQAt3TZ@ripper>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <268706864.fOQeQAt3TZ@ripper>
X-Received: from [2003:c9:3f4c:a900:4886:e1e8:1ae1:7704]
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1l6pkA-0005rZ-BI; Tue, 02 Feb 2021 08:04:58 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_020502_124309_95E7A0E4 
X-CRM114-Status: GOOD (  17.18  )
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

dGhlIHN0YW5kYXJkIGF0aDEwayBmaXJtd2FyZSBmw7xyIHFjYTk4OHggY2hpcHNldHMgZG9lcyBm
aWx0ZXIgdmxhbnMuCnRoZSBvbmx5IG9wdGlvbiBmb3IgeW91IGlzIHVzaW5nIHRoZSBDVCBmaXJt
d2FyZSBieSBjYW5kZWxhdGVjaCwgd2hpY2gKZG9lcyBub3Qgc3VmZmVyIGZyb20gdGhpcyBpc3N1
ZS4KClNlYmFzdGlhbgoKQW0gMDEuMDIuMjAyMSB1bSAyMTo1NCBzY2hyaWViIFN2ZW4gRWNrZWxt
YW5uOgo+IEhpLAo+Cj4gSSB3YXMganVzdCB0ZXN0aW5nIEVBUCB3aXRoIGR5bmFtaWNfdmxhbj0y
IChhbmQgYSByYWRpdXMgc2VydmVyIHdoaWNoIHJldHVybnMKPiB0aGUgVkxBTklEIDExMiBmb3Ig
dGhpcyBjbGllbnQpLiBUaGlzIHdvcmtlZCBwZXJmZWN0bHkgZmluZSB3aXRoIGF0aDlrLiBCdXQK
PiBmb3Igc29tZSByZWFzb24sIHRoZSBjbGllbnQgd2FzIG5vdCBhYmxlIHRvIHJlY2VpdmUgYW55
IG11bHRpY2FzdC9icm9hZGNhc3QKPiBwYWNrZXRzIHdpdGggYXRoMTBrLgo+Cj4gVGhlIHVzZWQg
T3BlbldydCAxOS4wNyBjb25maWcgd2FzOgo+Cj4gICAgICBjb25maWcgd2lmaS1pZmFjZSAnZWFw
X3JhZGlvMCcKPiAgICAgICAgICBvcHRpb24gZGV2aWNlICdyYWRpbzAnCj4gICAgICAgICAgb3B0
aW9uIG1vZGUgJ2FwJwo+ICAgICAgICAgIG9wdGlvbiBzc2lkICdNeUVBUFNTSUQnCj4gICAgICAg
ICAgb3B0aW9uIGVuY3J5cHRpb24gJ3dwYTInCj4gICAgICAgICAgb3B0aW9uIGllZWU4MDIxMXIg
JzEnCj4gICAgICAgICAgb3B0aW9uIHNlcnZlciAnMTkyLjE2OC4xNzguMTIzJwo+ICAgICAgICAg
IG9wdGlvbiBrZXkgJ3Rlc3RpbmcxMjMnCj4gICAgICAgICAgb3B0aW9uIGR5bmFtaWNfdmxhbiAn
MicKPiAgICAgICAgICBvcHRpb24gdmxhbl9icmlkZ2UgJ2JyLWxhbicKPgo+IFdoaWNoIGNyZWF0
ZXMgZm9sbG93aW5nIGhvc3RhcGQgY29uZmlndXJhdGlvbjoKPgo+Cj4gICAgICBkcml2ZXI9bmw4
MDIxMQo+ICAgICAgbG9nZ2VyX3N5c2xvZz0xMjcKPiAgICAgIGxvZ2dlcl9zeXNsb2dfbGV2ZWw9
Mgo+ICAgICAgbG9nZ2VyX3N0ZG91dD0xMjcKPiAgICAgIGxvZ2dlcl9zdGRvdXRfbGV2ZWw9Mgo+
ICAgICAgY291bnRyeV9jb2RlPURFCj4gICAgICBpZWVlODAyMTFkPTEKPiAgICAgIGh3X21vZGU9
Zwo+ICAgICAgc3VwcG9ydGVkX3JhdGVzPTYwIDkwIDEyMCAxODAgMjQwIDM2MCA0ODAgNTQwCj4g
ICAgICBiYXNpY19yYXRlcz02MCAxMjAgMjQwCj4gICAgICBiZWFjb25faW50PTEwMDAKPiAgICAg
IGR0aW1fcGVyaW9kPTIKPiAgICAgIGNoYW5uZWw9YWNzX3N1cnZleQo+ICAgICAgY2hhbmxpc3Q9
MTEKPiAgICAgIAo+ICAgICAgCj4gICAgICBpZWVlODAyMTFuPTEKPiAgICAgIGh0X2NvZXg9MAo+
ICAgICAgaHRfY2FwYWI9W0xEUENdW1NIT1JULUdJLTIwXVtTSE9SVC1HSS00MF1bVFgtU1RCQ11b
UlgtU1RCQzFdW01BWC1BTVNEVS03OTM1XVtEU1NTX0NDSy00MF0KPiAgICAgIAo+ICAgICAgaW50
ZXJmYWNlPXdsYW4wCj4gICAgICBjdHJsX2ludGVyZmFjZT0vdmFyL3J1bi9ob3N0YXBkCj4gICAg
ICBic3NfbG9hZF91cGRhdGVfcGVyaW9kPTYwCj4gICAgICBjaGFuX3V0aWxfYXZnX3BlcmlvZD02
MDAKPiAgICAgIGRpc2Fzc29jX2xvd19hY2s9MQo+ICAgICAgc2tpcF9pbmFjdGl2aXR5X3BvbGw9
MAo+ICAgICAgcHJlYW1ibGU9MQo+ICAgICAgd21tX2VuYWJsZWQ9MQo+ICAgICAgaWdub3JlX2Jy
b2FkY2FzdF9zc2lkPTAKPiAgICAgIHVhcHNkX2FkdmVydGlzZW1lbnRfZW5hYmxlZD0xCj4gICAg
ICB1dGY4X3NzaWQ9MQo+ICAgICAgbXVsdGlfYXA9MAo+ICAgICAgYXV0aF9zZXJ2ZXJfYWRkcj0x
OTIuMTY4LjE3OC4xMjMKPiAgICAgIGF1dGhfc2VydmVyX3BvcnQ9MTgxMgo+ICAgICAgYXV0aF9z
ZXJ2ZXJfc2hhcmVkX3NlY3JldD10ZXN0aW5nMTIzCj4gICAgICBlYXBvbF9rZXlfaW5kZXhfd29y
a2Fyb3VuZD0xCj4gICAgICBpZWVlODAyMXg9MQo+ICAgICAgYXV0aF9hbGdzPTEKPiAgICAgIHdw
YT0yCj4gICAgICB3cGFfcGFpcndpc2U9Q0NNUAo+ICAgICAgc3NpZD1NeUVBUFNTSUQKPiAgICAg
IG1vYmlsaXR5X2RvbWFpbj0zYmYzCj4gICAgICBmdF9wc2tfZ2VuZXJhdGVfbG9jYWw9MAo+ICAg
ICAgZnRfb3Zlcl9kcz0xCj4gICAgICByZWFzc29jaWF0aW9uX2RlYWRsaW5lPTEwMDAKPiAgICAg
IG5hc19pZGVudGlmaWVyPWFjODY3NDlmNGRjMgo+ICAgICAgcjBfa2V5X2xpZmV0aW1lPTEwMDAw
Cj4gICAgICBwbWtfcjFfcHVzaD0wCj4gICAgICB3cGFfZGlzYWJsZV9lYXBvbF9rZXlfcmV0cmll
cz0wCj4gICAgICB3cGFfa2V5X21nbXQ9V1BBLUVBUCBGVC1FQVAKPiAgICAgIG9rYz0wCj4gICAg
ICBkaXNhYmxlX3Bta3NhX2NhY2hpbmc9MQo+ICAgICAgZHluYW1pY192bGFuPTIKPiAgICAgIHZs
YW5fbmFtaW5nPTEKPiAgICAgIHZsYW5fYnJpZGdlPWJyLWxhbgo+ICAgICAgdmxhbl9maWxlPS92
YXIvcnVuL2hvc3RhcGQtd2xhbjAudmxhbgo+ICAgICAgYnNzaWQ9YWM6ODY6NzQ6OWY6NGQ6YzIK
Pgo+Cj4gVGhlIGNsaWVudCBjb25uZWN0ZWQgYW5kIHRoZW4gZm9sbG93aW5nIHdhcyB0ZXN0ZWQg
dG8gc2VuZCBzb21lIGRhdGEgdG8gdGhlCj4gY2xpZW50ICh3aGljaCBoYWQgd2lyZXNoYXJrIHJ1
bm5pbmcgdG8gY2hlY2sgZm9yIGluY29taW5nIHBhY2tldHMpOgo+Cj4gICAgICBwaW5nIGZmMDI6
OjEld2xhbjAuMTEyCj4KPiBXaXRoIHRoZSBhdGg5ayBBUCwgSSBjb3VsZCBzZWUgdGhlIHBhY2tl
dHMuIFdpdGggYXRoMTBrLCBJIHdhc24ndCBhYmxlIHRvIHNlZQo+IGFueXRoaW5nIGluIHRoZSBh
aXIuIFNvIGZvciBzb21lIHJlYXNvbiBzb21ldGhpbmcgKGZpcm13YXJlPykgaXMgZHJvcHBpbmcg
dGhlCj4gcGFja2V0cy4gQnR3LiB1bmljYXN0IHNlZW1zIHRvIHdvcmsgZmluZSAtIGJ1dCBsaXR0
bGUgYml0IGhhcmQgdG8gdXNlIHdoZW4gQVJQCj4gb3IgSUNNUHY2IG11bHRpY2FzdCBwYWNrZXRz
IGFyZSBub3Qgd29ya2luZy4KPgo+IEFuZCB0aGVyZSB3ZXJlIHZhcmlvdXMgcmVwb3J0cyBhbHJl
YWR5IGluIHRoZSBwYXN0IHdoaWNoIHNlZW0gdG8gc3VnZ2VzdCB0aGF0Cj4gdGhpcyBhIHByb2Js
ZW0gc2luY2UgYSBsb25nIHRpbWU6Cj4KPiAqIGh0dHBzOi8vZm9ydW0ub3BlbndydC5vcmcvdC84
MDItMXgtd2l0aC1keW5hbWljLXZsYW5zLTVnaHotYW5kLW1kbnMtc3RyYW5nZS1iZWhhdmlvdXIv
NTAxODAKPiAqIGh0dHBzOi8vYnVncy5vcGVud3J0Lm9yZy9pbmRleC5waHA/ZG89ZGV0YWlscyZ0
YXNrX2lkPTMyNjYmcGFnZW51bT0zCj4gKiBodHRwczovL2ZvcnVtLm9wZW53cnQub3JnL3QvbXVs
dGljYXN0LW5vdC13b3JraW5nLW92ZXItYnJpZGdlZC1hcC82OTA1OQo+Cj4gSSBoYXZlIGFsc28g
YWRkZWQgdGhlIG91dHB1dCBvZgo+IGBwZXJmIGZ0cmFjZSBwaW5nIC1jIDEgLUkgd2xhbjAuMTEy
ICAyNTUuMjU1LjI1NS4yNTVgIGluIGNhc2Ugc29tZWJvZHkgd2FudHMgdG8KPiBjaGVjayB0aGUg
dHJhY2UKPgo+IEtpbmQgcmVnYXJkcywKPiAJU3Zlbgo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhdGgxMGsgbWFpbGluZyBsaXN0Cj4gYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEwawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
