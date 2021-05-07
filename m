Return-Path: <SRS0=EMvg=KC=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EF6C433ED
	for <ath10k@archiver.kernel.org>; Fri,  7 May 2021 20:56:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D789361401
	for <ath10k@archiver.kernel.org>; Fri,  7 May 2021 20:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D789361401
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dei.unipd.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Message-ID:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2EB1wvzydDblCgUE2z9W9MnHgFYctWvvuJHVjppXVgE=; b=ar4MbXQTuKydp8
	nEpa5qdgaVglI+CKD4oV5uZKCqrhkzpjn85Yt037twIJDINj33MKGpB/Mh5EyIs7UK4ZE5Ugv2XSR
	hwQw1D6kHQDHpHJ9kptnvwKQYZrellnTN1907XfvaBlMNh3j/Q5xl3q2E073R94e9YQT56xUThFJc
	ATK30lzXWyRjm9DXE98oWRnZ0NlmFDeRffyaxfUzfhbNZV5bohhrpRhf0OP9AKuwJY6I4K5SbDe7Y
	Lsetn82+uWxaYpgSfdITy9vqvnkFqdVnLd9+YPxLG7Ivt+UOyKkJz1tdi4GAav6NXQ++GbyqRcYQr
	S/1s24qRchQySqpAgw9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf7WU-0082lC-6e; Fri, 07 May 2021 20:56:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf7WJ-0082i2-Rw
 for ath10k@desiato.infradead.org; Fri, 07 May 2021 20:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:Subject:To:
 From:Message-ID:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=MSxx2ufcV7SfqMWz5/vF9Ii54yzutHdrSeSpPzEawfQ=; b=l9TCxYHAHiYQBnBWJEx39Dx5B/
 eb+g9ia0wrBUUGj2jqhtCzWyLtd/2tS4XL88gehq7WS3Fs0+4DE2psqqxEFglFfySwankDpz8HXAZ
 KdiMFCsNEygYwy5qf3wKGfB8RhrJrivaLbX9XPHdcfQKgIikYwgS2qAMht7m14Nx/15+fiiDAni0/
 AeJ3Hk4MHfRMAgdI8L7mqo25cuomSAW9JkgibMLsRWLpms7AxrVRXbjADC0YnDSODzyrh48SQ8EPH
 kmWAtkJRd8ltOsvdo+YTcsktkOnNFcqdq7eVtNiu1tkhxtmAOFQoFYBZwyzDxSbIUrivmoyAiHLYf
 0/6dQT+w==;
Received: from mail1.dei.unipd.it ([147.162.2.111] helo=mail.dei.unipd.it)
 by bombadil.infradead.org with smtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lf7WH-007BEY-Aw
 for ath10k@lists.infradead.org; Fri, 07 May 2021 20:56:22 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.dei.unipd.it (Postfix) with ESMTP id 320D641B31
 for <ath10k@lists.infradead.org>; Fri,  7 May 2021 22:56:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at dei.unipd.it
Received: from mail.dei.unipd.it ([127.0.0.1])
 by localhost (mail.dei.unipd.it [127.0.0.1]) (amavisd-new, port 10024)
 with SMTP id NxHvH5eneeyw for <ath10k@lists.infradead.org>;
 Fri,  7 May 2021 22:56:19 +0200 (CEST)
Received: from webmail1 (localhost.localdomain [127.0.0.1])
 by mail.dei.unipd.it (Postfix) with ESMTP id 9744341B2B
 for <ath10k@lists.infradead.org>; Fri,  7 May 2021 22:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.dei.unipd.it 9744341B2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dei.unipd.it;
 s=_dkim; t=1620420979;
 bh=MSxx2ufcV7SfqMWz5/vF9Ii54yzutHdrSeSpPzEawfQ=;
 h=Date:From:To:Subject:From;
 b=aNSpsNbky3Ijm/WoCxnCgOkvtp6b4CJ58Ur7cX4JXrwUO3bnu7hu4ntbi6iaKXNtk
 8UmBBz9Ot9OCq190LB8ekN25CbNM2aB1R9uyqhlsawOLJYP9C0a3EgPP8ZvdZ8l3+i
 qL9Kythe7imm1jm8CMxyyE2Q890vNmvdwHBwEGeokIePy3Psbd8nvXC2OM+6GIFlwX
 Q56sqCokByyt38UGlvUgW2mMWRhfLde8r3PmI3Y6UKOSwGjNAICi7UtDU3PMOt2XiK
 G3v2S2KE3uJtdHXxtIUWvIrW73o4DTl/Cl1X3oSIGPaLjAIuZcrAkUJjSBUFH48Zy3
 WHkXCs/B2DlHw==
Received: from net-93-70-82-4.cust.vodafonedsl.it
 (net-93-70-82-4.cust.vodafonedsl.it [93.70.82.4]) by mail.dei.unipd.it
 (Horde Framework) with HTTPS; Fri, 07 May 2021 22:56:19 +0200
Date: Fri, 07 May 2021 22:56:19 +0200
Message-ID: <20210507225619.Horde.G2egvYJv35ie7yz7yfuxMe0@mail.dei.unipd.it>
From: meneghello@dei.unipd.it
To: ath10k@lists.infradead.org
Subject: Radio module transmit power
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_135621_552712_5D35E35D 
X-CRM114-Status: UNSURE (   6.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="Yes"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello everybody,

I am working with a Gateworks GW6200 SBC and I have a problem when  
connecting a Compex WLE1216V5-23 radio module to the SBC through the  
PCIe connector.
The radio module works with ath10k and I am using OpenWRT on the SBC.

The module works correctly and I am able to configure it as an access point.
However, it seems that the transmission power is less than the one we  
set using hostapd.
In fact, placing a receiver at a distance of 10 cm from the access  
point, the power there is -80 dBm.

I was wondering whether this is a hardware problem, and thus I need to  
add a power amplifier, or it is simply related to some registers to be  
properly set for the ath10k firmware.

I hope you can help me solve this issue.
With best regards,
Francesca


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
