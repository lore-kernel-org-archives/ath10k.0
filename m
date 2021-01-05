Return-Path: <SRS0=hYFH=GI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA78C433E0
	for <ath10k@archiver.kernel.org>; Tue,  5 Jan 2021 01:02:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25F8622573
	for <ath10k@archiver.kernel.org>; Tue,  5 Jan 2021 01:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25F8622573
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sRmHI5fWjDidysOVv7vo/8dDjH1SnaqWlwhpC+EirP4=; b=E6tBuAT7eLJCKgNrYN9uCjYGv
	tFAMUGDy3wzivM0BDpUQ+8JJoi1ZeeakAbLWyDaEdR+MYPSsYO1I69EcqNoAVL2EukCOw9p+eE63U
	6w9RuvFubRUlx7FKcddpOnNpvYrFw/Z9GyOP/zea1744X7/sSKpOLnOsyaLgOELj6bxFGtblD/Qgz
	HS715JMG9oARA6jbzHGTBZMOlkUtZQ/dMEDYb001n37eclRv3z0KnWIqE12cUYP362bMzogs6NsfO
	QTwgcNa+99fcGlosrgzATC6iPnciN6xzrN4kAFwV0kbs8GJ3YkEBkjSn/dw1dZk9Ezt/PraTilX0j
	K98ckZ+pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwaiy-0006Ma-U9; Tue, 05 Jan 2021 01:01:24 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwait-0006Ic-C3
 for ath10k@lists.infradead.org; Tue, 05 Jan 2021 01:01:21 +0000
Received: from [192.168.254.6] (unknown [50.46.152.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 2F25C13C359;
 Mon,  4 Jan 2021 17:01:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 2F25C13C359
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1609808476;
 bh=8uouPfJmxEzF/g181Ay37CCyCQ6IK3/S1E5TKxAqrpo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Wu+ze/7Il2zlJBgYcmviW4eD9ZmwFa3y9u94msE0Q3YCwV6Z8P8sNsPK8dpy0z7Li
 p0jdgGcL1cvgQMQnH/eEAi8YY9gU5YLEzuPdmyWi6iwe39PilYMB3OI1Ujxpb1B640
 wzqieTFlFuMJ6u3Px/CTtPYcuadIp/eQ3OrmSYdQ=
Subject: Re: RX rate is wrong in 5.10? (bisected to: mac80211: receive and
 process S1G beacons)
To: Thomas Pedersen <thomas@adapt-ip.com>
References: <584816e2-ed18-3d5e-651e-293637222148@candelatech.com>
 <5dc86950-1672-6900-dad4-3b437f4959c5@candelatech.com>
 <772a3a0517eb4d4cc6cee975e5fde100@adapt-ip.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <fcb62a2f-a008-2bb6-d5b1-272a4f58febf@candelatech.com>
Date: Mon, 4 Jan 2021 17:01:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <772a3a0517eb4d4cc6cee975e5fde100@adapt-ip.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_200119_567954_334916A1 
X-CRM114-Status: GOOD (  19.93  )
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
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

T24gMS80LzIxIDQ6MjUgUE0sIFRob21hcyBQZWRlcnNlbiB3cm90ZToKPiBIaSBCZW4sCj4gCj4g
T24gMjAyMS0wMS0wNCAxNjoxOCwgQmVuIEdyZWVhciB3cm90ZToKPj4gT24gMS80LzIxIDg6MTgg
QU0sIEJlbiBHcmVlYXIgd3JvdGU6Cj4+PiBIZWxsbywKPj4+Cj4+PiBJIG5vdGljZWQgdGhhdCBS
WCByYXRlIGlzIGFsd2F5cyA2TWJwcyB3aGVuIEkgdXNlIC1jdCBmaXJtd2FyZSBhbmQgLWN0IGRy
aXZlciBpbgo+Pj4gNS4xMCwgYW5kIG9uIHN0b2NrIDUuMTAuMCBkcml2ZXIgYW5kIHN0b2NrIGZp
cm13YXJlLCByeC1yYXRlIGRvZXMgbm90IHNob3cgdXAgYXQKPj4+IGFsbCBpbiAnaXcgZGV2IHds
YW4xIHN0YXRpb24gZHVtcCcuCj4+Pgo+Pj4gSSdtIHVzaW5nIDk5ODQgTklDLi4uCj4+Pgo+Pj4g
QW55b25lIGVsc2Ugc2VlIHRoaXM/Cj4+Cj4+IEFmdGVyIGEgYmlzZWN0LCB0aGUgZmlyc3QgYmFk
IGNvbW1pdCBzaG93cyB0aGlzOgo+Pgo+PiBjb21taXQgMDlhNzQwY2UzNTJlMWExZDE2Yjk5ODQx
MTU1MTRiYTlhNGY0NzA0YiAocmVmcy9iaXNlY3QvYmFkKQo+PiBBdXRob3I6IFRob21hcyBQZWRl
cnNlbiA8dGhvbWFzQGFkYXB0LWlwLmNvbT4KPj4gRGF0ZTrCoMKgIE1vbiBTZXAgMjEgMTk6Mjg6
MTQgMjAyMCAtMDcwMAo+Pgo+PiDCoMKgwqAgbWFjODAyMTE6IHJlY2VpdmUgYW5kIHByb2Nlc3Mg
UzFHIGJlYWNvbnMKPj4KPj4gwqDCoMKgIFMxRyBiZWFjb25zIGFyZSA4MDIuMTEgRXh0ZW5zaW9u
IEZyYW1lcywgc28gdGhlIGZpeGVkCj4+IMKgwqDCoCBoZWFkZXIgcGFydCBkaWZmZXJzIGZyb20g
cmVndWxhciBiZWFjb25zLgo+Pgo+PiDCoMKgwqAgQWRkIGEgaGFuZGxlciB0byBwcm9jZXNzIFMx
RyBiZWFjb25zIGFuZCBhYnN0cmFjdCBvdXQgdGhlCj4+IMKgwqDCoCBmZXRjaGluZyBvZiBCU1NJ
RCBhbmQgZWxlbWVudCBzdGFydCBsb2NhdGlvbnMgaW4gdGhlCj4+IMKgwqDCoCBiZWFjb24gYm9k
eSBoYW5kbGVyLgo+Pgo+PiDCoMKgwqAgU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBlZGVyc2VuIDx0
aG9tYXNAYWRhcHQtaXAuY29tPgo+PiDCoMKgwqAgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDIwMDkyMjAyMjgxOC4xNTg1NS0xNC10aG9tYXNAYWRhcHQtaXAuY29tCj4+IMKgwqDC
oCBbZG9uJ3QgcmVuYW1lLCBzbWFsbCBjb2Rpbmcgc3R5bGUgY2xlYW51cHNdCj4+IMKgwqDCoCBT
aWduZWQtb2ZmLWJ5OiBKb2hhbm5lcyBCZXJnIDxqb2hhbm5lcy5iZXJnQGludGVsLmNvbT4KPj4K
Pj4gRnJvbSBhIGdsYW5jZSB0aHJvdWdoIHRoZSBkaWZmLCBJJ20gYXQgYSBsb3NzIGFzIHRvIHdo
eSBpdCBjYXVzZXMgdGhlCj4+IHN5bXB0b20uwqAgSSBtYW51YWxseQo+PiBkb3VibGUtY2hlY2tl
ZCB0aGUgYmlzZWN0LCBhbiBpdCBhcHBlYXJzIGNvcnJlY3QuCj4+Cj4+IFdoYXQgSSBzZWUgaXMg
dGhhdCBpbiB0aGUgY29tbWl0IGJlZm9yZSB0aGlzLCBJIHNlZSBhIHVzZWZ1bCByeCByYXRlCj4+
ICgxLjNHYnBzIGZvciBpbnN0YW5jZSkKPj4gaW4gJ2l3IGRldiB3bGFuMSBzdGF0aW9uIGR1bXAn
LCBidXQgaW4gdGhpcyBiYWQgY29tbWl0LCBib3RoIHNob3cKPj4gNk1icHMgcmF0ZS7CoCAoVHgg
cmF0ZQo+PiBpbiBhdGgxMGsgaXMgcHJvYmFibHkgYnJva2VuIGZvciBvdGhlciByZWFzb25zLCBz
byBJIG9ubHkgYmlzZWN0ZWQgdGhlCj4+IHJ4IHNpZGUgaXNzdWUuKQo+Pgo+PiBJJ20gdXNpbmcg
YXRoMTBrIDk5ODQgcmFkaW8gd2l0aCBmaXJtd2FyZSAxMC40LTMuOS4wLjItMDAwNzAgaW4gc3Rh
dGlvbiBtb2RlLgo+Pgo+PiBBUCBpcyBhbiBhdGgxMWsgSGF3a2V5ZS4uLgo+Pgo+PiBJJ20gdXNp
bmcgYSAxTWJwcyBVRFAgcGFja2V0ICdkb3dubG9hZCcgc3RyZWFtIHRvIG1ha2Ugc3VyZSBJJ20g
c2VlaW5nCj4+IHJhdGVzIGZvciBkYXRhIGZyYW1lcwo+PiBhbmQgbm90IGp1c3QgbWFuYWdlbWVu
dCBmcmFtZXMuCj4gCj4gU29ycnkgYWJvdXQgdGhhdC4KPiAKPj4gQW55IGlkZWEgd2hhdCBtaWdo
dCBiZSB0aGUgaXNzdWU/Cj4gCj4gSXQgbWF5IGJlIGZpeGVkIGJ5IGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9wYXRjaC8xNjA3NDgzMTg5LTM4OTEt
MS1naXQtc2VuZC1lbWFpbC13Z29uZ0Bjb2RlYXVyb3JhLm9yZy8KClllcywgdGhhdCBmaXhlcyBp
dC4gIExvb2tzIGxpa2UgaXQgaXMgYWxyZWFkeSBpbiA1LjEwLjQgc3RhYmxlLCBzbyBJJ2xsIHVw
Z3JhZGUgdG8gdGhhdC4KClRoYW5rcyBmb3IgdGhlIHF1aWNrIGhpbnQuCgpUaGFua3MsCkJlbgoK
LS0gCkJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgpDYW5kZWxhIFRlY2hub2xv
Z2llcyBJbmMgIGh0dHA6Ly93d3cuY2FuZGVsYXRlY2guY29tCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTBrCg==
