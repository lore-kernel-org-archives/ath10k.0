Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0DBC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+RyA2bbH/BUniFQW/+eSGdDaBG5chdZXZZyL4B/mdY=; b=fWrxC902EI52B4
	k2U8xOjpwAwR1Up8vnF2x9bbxkNcXlBklK4A4p9OPs/sJpwRNJlVzNzWpY5/yyy2TE90H2daq5kBk
	nX+WMJEjdyKa0TXmSsXNtIVIFLVR89TdaSda0aB4bcEromTvED75mcLhB1pgu7WliCIshUOYB6FTu
	kGruizZBYz+FJ1XkJgZ9z9ZvFtU/HFc7RV5kGiIhiF/X4FRds+KD/bGN/ajgD6HFnUcP0lJKaJYjk
	r0YN787at/u7wNAG9kJoe4wH1BOtuqxw/dx0OXpbpclDTvtpOyD/jN/nv7U1XzI6KpifRqsE1jJNt
	wDlyn72F0ulW3kOs/yOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuIV-00FE7i-7i; Fri, 21 Jan 2022 13:49:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuIR-00FE6R-PV
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:49:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C95AB81FBB;
 Fri, 21 Jan 2022 13:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C46C340E1;
 Fri, 21 Jan 2022 13:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642772981;
 bh=lBnK5NENX2kdVj2ftwfn5gqm0eDWKdMM8kh4AJVsQ/M=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=mfObbtzHsjhBPlhAaaO+2s7LK/Qga/iytVlEy5nupqbjzs2Dbx781FPiMfxk5ljjY
 t/R669eQ4OT9ljMpFVNe/in9DXtn7H66wuV55wQmrcdCN5on/1pm3P1iS5iUkHNKhn
 J8iLU9oDkcPXP6SpfxzrlUB5LZJ4NkTipXpYSr+yOyKIxoOkjDJfmNWbLk60obBmgI
 PWcQ2gPRU2XCUJP1Az8nJ6nMlgcFQqK73FIETuz3mNEWZlAu7qhgw4EuOOBA7KR6jh
 Qp6dcisMpWFQ16VjT/k2CV9y5s1q6KW/oxsVDk5oAijKy7xAJy3su7DLqfe1B5PoXh
 APlrbxLBXgkyQ==
From: Kalle Valo <kvalo@kernel.org>
To: Hans Geiblinger <cybrnook2002@yahoo.com>
Cc: "ath10k\@lists.infradead.org" <ath10k@lists.infradead.org>,
 "chunkeey\@gmail.com" <chunkeey@gmail.com>
Subject: Re: [v2] ath10k-firmware: QCA4019 hw1.0: Add Linksys MR8300 V1.0
 specific BDFs
References: <467316799.4234826.1600533501314.ref@mail.yahoo.com>
 <467316799.4234826.1600533501314@mail.yahoo.com>
Date: Fri, 21 Jan 2022 15:49:38 +0200
In-Reply-To: <467316799.4234826.1600533501314@mail.yahoo.com> (Hans
 Geiblinger's message of "Sat, 19 Sep 2020 16:38:21 +0000 (UTC)")
Message-ID: <87k0etci6l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_054943_991054_57ABEB14 
X-CRM114-Status: GOOD (  13.82  )
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
IGhhcmR3YXJlIHRoaXMgaXM6Cj4gwqAgwqAtIGl0IGlzIGEgSVBRNDAxOSBiYXNlZCBib2FyZAo+
IMKgIMKgIMKgLSBvbmUgUUNBNDB4eCByYWRpbyBpcyB1c2VkIGFzIDIuNEdIeiByYWRpbwo+IMKg
IMKgIMKgLSBvbmUgUUNBNDB4eCByYWRpbyBpcyB1c2VkIGFzIDVHSHogcmFkaW8KPgo+Cj4gKiBv
cmlnaW4gb2YgdGhlIGJvYXJkIGZpbGUKPiDCoCDCoC0gYm9hcmRkYXRhIGZpbGVzIHdlcmUgdGFr
ZW4gZnJvbSBPRU0gTGlua3N5cyBGV19NUjgzMDBfMS4xLjcuMjAxMjgxX3Byb2QuaW1nCj4KPgo+
ICogaWRzIHRvIGJlIHVzZWQgd2l0aCB0aGUgYm9hcmQgZmlsZQo+IMKgIMKgLSBRQ0E0MDE5IGh3
MS4wCj4gwqAgwqAgwqArIGJ1cz1haGIsYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MjAsdmFy
aWFudD1saW5rc3lzLW1yODMwMC12MC1mY2MKPiDCoCDCoCDCoE1ENTogMWUwYmU3NjcyYmQ4M2Nj
YWQyNGNmOGU5OThiOGQxZWYKPiDCoCDCoCDCoAo+IMKgIMKgIMKgKyBidXM9YWhiLGJtaS1jaGlw
LWlkPTAsYm1pLWJvYXJkLWlkPTIxLHZhcmlhbnQ9bGlua3N5cy1tcjgzMDAtdjAtZmNjCj4gwqAg
wqAgwqBNRDU6IDVhNjVjMmQ3OWY4MzhhNmUwZDlkMDViNzc2NDkxYWM4Cj4KPgo+ICogYXR0YWNo
IHRoZSBhY3R1YWwgYm9hcmQgZmlsZQo+IMKgIMKgLSBUaGUgbmFtZSBvZiB0aGUgZmlsZXMgYXJl
IGVxdWFsIHRvIHRoZSBpZCBzdHJpbmcgaW4gdGhlCj4gYm9hcmQtMi5iaW4gKG1pbnVzIHRoZSAi
LmJpbiIpCgpUaGFua3MsIGFkZGVkIHRvIFFDQTQwMTkvaHcxLjAvYm9hcmQtMi5iaW46CgpOZXc6
CmJ1cz1haGIsYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MjAsdmFyaWFudD1saW5rc3lzLW1y
ODMwMC12MC1mY2MKYnVzPWFoYixibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0yMSx2YXJpYW50
PWxpbmtzeXMtbXI4MzAwLXYwLWZjYwoKQ2hhbmdlZDoKCgpEZWxldGVkOgoKMiBib2FyZCBpbWFn
ZShzKSBhZGRlZCwgMCBjaGFuZ2VkLCAwIGRlbGV0ZWQsIDgwIGluIHRvdGFsCgpodHRwczovL2dp
dGh1Yi5jb20va3ZhbG8vYXRoMTBrLWZpcm13YXJlL2NvbW1pdC9mYWYzMzhjN2I0ZmU4MGM2YjZi
ZDg0Yzk0YWUzOGE3YzczYWEwNDQ1CgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVs
Lm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
