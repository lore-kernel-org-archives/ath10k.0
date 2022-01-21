Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD38C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWe7eaQ+pOV3a22rAw/T3I3pjsUf7gjQ1zF2Huk206g=; b=1bpaaInpIM8iVA
	PRS1djAzFqs/VTsYbMYBSNW3y9keo4yfFv3b6mNugPzpjEzfVR3/sSa2oE2wGmEZhp6SXGc9F9jgw
	vM7I4tnJWBPdRq4ZEsiJg25epS0ISPm7TF8CirtXtWhIeOHI0uXwwXjRt8sW4grrvyNM0mJRlU6mq
	EJmvJGYCX82U/7LBtcZqrEPxN4vACegyJn6b44FLvXSrw6tmJYoHLWMv+tyZFzwRe92Mxj7ekPUgG
	8trfZfyN45d0tQAQfD0/ly+C6uo6Ha53MbE1Iad6mx495abVyWmyyAWzt7NoSvlColrCYYrH1NzfB
	rYgxqYiC+bjeFbw5FlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAubL-00FKTQ-K5; Fri, 21 Jan 2022 14:09:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAubH-00FKRk-Bq
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:09:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA7A161327;
 Fri, 21 Jan 2022 14:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920DCC340E1;
 Fri, 21 Jan 2022 14:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642774150;
 bh=snsz4t/y5S4btbKFYd2BWMnF3klugvn/GT0/DzoCVYs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ITsvFpQnQmZ7yc8JLWTeSjaPUYlMgMNOWx7H9LJrXLkA2H4i9AZDfdZqOTRck/QML
 avCdNaKLQpSMKbMz6D49CVNTL2vqAbbY/NydCd6y82bC2DBMUbRrpcCpnsOn7FqbZv
 1QNqITtx2tf9v8p2L9PID8C7SqexwS31fS0XGdbgsNeIMH6vpHTtx1CQlONVdPm8h8
 1PGJSq/B3FkcnZfuaLHGL4cZq1rEnF3Ch1/79RquAnUTQg4le4U4AjeYfGc9xaFJ1q
 fInq+9lEPmWnu1gQ2P+EAJTSej4fBD/vqwJWp1pHUDG9AZ5Dc3BCVZNuiGmMaypDlL
 jdVrgRpxqCfww==
From: Kalle Valo <kvalo@kernel.org>
To: Hans Geiblinger <cybrnook2002@yahoo.com>
Cc: "ath10k\@lists.infradead.org" <ath10k@lists.infradead.org>,
 "chunkeey\@gmail.com" <chunkeey@gmail.com>
Subject: Re: [v2] ath10k-firmware: QCA9888 hw1.0: Add Linksys MR8300 V1.0
 specific BDFs
References: <836543238.4244780.1600533511769.ref@mail.yahoo.com>
 <836543238.4244780.1600533511769@mail.yahoo.com>
Date: Fri, 21 Jan 2022 16:09:07 +0200
In-Reply-To: <836543238.4244780.1600533511769@mail.yahoo.com> (Hans
 Geiblinger's message of "Sat, 19 Sep 2020 16:38:31 +0000 (UTC)")
Message-ID: <87mtjp9o58.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060911_465721_5611227E 
X-CRM114-Status: GOOD (  13.04  )
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

SGFucyBHZWlibGluZ2VyIDxjeWJybm9vazIwMDJAeWFob28uY29tPiB3cml0ZXM6Cgo+IFRoZSBz
dXBwb3J0IGZvciB0aGlzIGRldmljZSBpcyBjdXJyZW50bHkgYmVpbmcgYWRkZWQgaW50byBPcGVu
V3J0LiBUaGlzIEFQIHJlcXVpcmVzwqAKPiB0d28gc3BlY2lhbCBCREZzIHRvIGdldCB0aGUgV2kt
RmkgUEhZcyB3b3JraW5nIChjb3JyZWN0bHkpLgo+Cj4KPiAqIGRlc2NyaXB0aW9uIGZvciB3aGF0
IGhhcmR3YXJlIHRoaXMgaXM6Cj4gwqAgwqAtIGl0IGlzIGEgUUNBOTg4OCBiYXNlZCByYWRpbyB1
c2VkIGZvciA1R2h6Cj4KPgo+ICogb3JpZ2luIG9mIHRoZSBib2FyZCBmaWxlCj4gwqAgwqAtIGJv
YXJkZGF0YSBmaWxlcyB3ZXJlIHRha2VuIGZyb20gT0VNIExpbmtzeXMgRldfTVI4MzAwXzEuMS43
LjIwMTI4MV9wcm9kLmltZwo+Cj4KPiAqIGlkcyB0byBiZSB1c2VkIHdpdGggdGhlIGJvYXJkIGZp
bGUKPiDCoCDCoC0gUUNBOTg4OCBodzEuMAo+IMKgIMKgIMKgK8KgYnVzPXBjaSxibWktY2hpcC1p
ZD0wLGJtaS1ib2FyZC1pZD0yMyx2YXJpYW50PWxpbmtzeXMtbXI4MzAwLXYwLWZjYwo+IMKgIMKg
IMKgTUQ1OsKgMWYyNjNjNTJlNzg2MmJjY2FiNmZkNjU1MTA5MjA3N2MKPgo+Cj4gKiBhdHRhY2gg
dGhlIGFjdHVhbCBib2FyZCBmaWxlCj4gwqAgwqAtIFRoZSBuYW1lIG9mIHRoZSBmaWxlcyBhcmUg
ZXF1YWwgdG8gdGhlIGlkIHN0cmluZyBpbiB0aGUKPiBib2FyZC0yLmJpbiAobWludXMgdGhlICIu
YmluIikKClRoYW5rcywgYWRkZWQgdG8gUUNBOTk4NC9odzEuMC9ib2FyZC0yLmJpbjoKCk5ldzoK
YnVzPXBjaSxibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0yMyx2YXJpYW50PWxpbmtzeXMtbXI4
MzAwLXYwLWZjYwoKQ2hhbmdlZDoKCgpEZWxldGVkOgoKMSBib2FyZCBpbWFnZShzKSBhZGRlZCwg
MCBjaGFuZ2VkLCAwIGRlbGV0ZWQsIDE5IGluIHRvdGFsCgpodHRwczovL2dpdGh1Yi5jb20va3Zh
bG8vYXRoMTBrLWZpcm13YXJlL2NvbW1pdC9jMGI2MTk2M2UzZWQ3OWNiM2Q5NWQ5MTVkYmRkZTFm
ZDIxZWYzY2Y5CgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZl
bG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMGsK
