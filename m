Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4963CC54EBD
	for <ath10k@archiver.kernel.org>; Mon,  9 Jan 2023 21:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:
	Message-ID:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G2krcbdlyllZZlhM2b7yOiu6qo7LOL0ixrMiYl2seDc=; b=tX3O06uutM8N2t
	qD1n01HHhsGWF19To4M+opye1c282Wco4Fh6B5rpVLOfH0dgHqcLdEEEx5CzA+8zQAdP6RfQd3bY1
	wUWr9Y2MCV0CdQDBAV9fjTafsJTuQDMAcwrmj/umnLN4rzE3AQdHoj9oaKx7+6fWMs31vNPwNijmR
	U/k01vxcWUe0tRqQmyNeIEuXjg64DJexRBHaEfrGnl/wbQpT+Lw5xmf3Lbs8XWQxKKmv4k2/6WxNc
	ZpmpFLVQYvv9rpDZbcPzkRacH8ydb0HA3LrVCqQRWZEbT3uc8D+TIVUP9nMyZMkzQeePQ4MPIxsmx
	5TA2OtIPwo7XTpZOLM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEzq0-004GwN-Da; Mon, 09 Jan 2023 21:37:48 +0000
Received: from mx.mtailounie.net ([2607:5300:60:3211::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEzg1-004DDx-EP
	for ath10k@lists.infradead.org; Mon, 09 Jan 2023 21:27:31 +0000
Received: from localhost (localhost [127.0.0.1])
	by mx.mtailounie.net (SYPOSTER) with ESMTP id E54C3840A2A
	for <ath10k@lists.infradead.org>; Mon,  9 Jan 2023 15:25:00 -0500 (EST)
X-Virus-Scanned: amavisd-new at mtailounie.net.softiternity.com
Received: from mx.mtailounie.net ([127.0.0.1])
	by localhost (mx.mtailounie.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kCynAWDdAp1J for <ath10k@lists.infradead.org>;
	Mon,  9 Jan 2023 15:24:59 -0500 (EST)
Received: from [10.9.9.10] (ip-088-153-114-186.um27.pools.vodafone-ip.de [88.153.114.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx.mtailounie.net (SYPOSTER) with ESMTPSA id 9893E840A27
	for <ath10k@lists.infradead.org>; Mon,  9 Jan 2023 15:24:58 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx.mtailounie.net 9893E840A27
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mtailounie.net;
	s=symt; t=1673295899;
	bh=jfQff9hrZ2xhlNMhA6urRfMqPpL9cMcHgNUMMgyp4tU=;
	h=Date:Reply-To:To:From:Subject:From;
	b=JBFVVjEaQtlEFNmv5xzkp6FPiFZZE/iiFaeZeOKhf0/XK7adTaOGrmevsYLsjYsdG
	 P4Gw4Ct9nrHASd9GWO0AZAQLQufVBkGju9wrvUzNbouxzxIvDpCLlRAFsD31oFVzHF
	 6fSoNsmc9r8Tw1W2Vw7lnTtwcEQ/q5ytqz/vfz+WjYupeGUobEu4j02DhblUwFEBas
	 6NMaVHzs9SVIquhB1i15i7FrWIA4boIhoa3ZNAlCCkxfrfo6iQi4YIY2989jboPvbK
	 4Z1bKEpoBkDg3p+GB74R+EwG4ekFybuDvqYpezG3LQRMa76xErQk2pjmjzOcK0lJjC
	 JWaakmLDJJoCg==
Message-ID: <b51f5efc-b3a4-9c64-1fa2-0243ab951193@mtailounie.net>
Date: Mon, 9 Jan 2023 21:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-CA
To: ath10k@lists.infradead.org
From: Linuxero Moxero <mageia@mtailounie.net>
Subject: First email - ATH10K
Organization: Opensource
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_132729_887687_1AA7CBE2 
X-CRM114-Status: UNSURE (   8.17  )
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
Reply-To: mageia@mtailounie.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

SGk7CgpJIGFtIG5ldyB0byBCU0QgYW5kIEkgaGF2ZSBqdXN0IG1hbmFnZWQgdG8gaW5zdGFsbCB0
aGUgbGF0ZXN0IEZyZWVCU0TCoCAKb24gbXkgRGVsbCBJbnNwaXJvbiAxNSA1MDAwIHNlcmllcy4K
CkkgY2Fubm90IGdldCBteSBXSUZJIGNhcmQgdG8gd29yay4gVGhlIHZlbmRvciBJRCBpcyAweDE2
OGMgYW5kIHRoZSAKZGV2aWNlIElEIGlzIDB4MDAzZS4gVGhpcyBpcyBhIFFDQTYxNzQgODAyLjEx
YWMgUENJIEV4cHJlc3MgY2FyZC4KCkkgaGF2ZSB0cmllZCB0byBkb3dubG9hZCBkaWZmZXJlbnQg
ZmlybXdhcmUgYW5kIHRyaWVkIHRvIGxvYWQgdGhlbSB3aXRoIAprbGRsb2FkLiBJIGRvIG5vdCB3
aXNoIHRvIG1lc3MgdXAgd2l0aCBteSBzeXN0ZW0gYSBsb3QgYmVjYXVzZSwgYXMgSSAKbWVudGlv
bmVkLCBJIGFtIHN0aWxsIG5ldyB0byBCU0QuIFNvIEkgYW0gdHJ5aW5nIHQga2VlcCBsb2FkZXIu
Y29uZiBjbGVhbi4KCkkgYXBwcmVjaWF0ZSBhbnkgaGVscCBvciBsZWFkIHRvIGdldCBteSB3aWZp
IHJ1bm5pbmcuCgpUaGFuayB5b3UgaW4gYWR2YW5jZSwKCk11aGFtbWFkCgotLSAKQmUgZ29vZCwg
YmUgaGFwcHkgYW5kIG5ldmVyIGxldCB0aGUgbG92ZWx5IHNtaWxlIG9uIHlvdXIgbmljZSBsaXBz
IGZhZGUgYXdheQpCZWF0aXR1ZGUgU2hhbTsgVGhlcmUgYXJlIHRoZSBhbmdlbHMgb2YgR29kIHdp
dGggdGhlaXIgd2luZ3Mgc3ByZWFkIHdpZGUgb3BlbiBhbGwgb3ZlciBTaGFtLgpJbmRlZWQ7IHdo
ZW4gd2hlZWRsaW5nIGJsYW5kaXNobWVudHMgcHJldmFpbCwgZmFpdGggZHdlbGxzIGluIFNoYW0u
Ck9oIEdvZDsgYmVzdG93IG91ciBTaGFtIHdpdGggWW91ciBibGVzc2luZ3MuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
