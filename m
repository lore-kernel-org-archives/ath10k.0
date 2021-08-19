Return-Path: <SRS0=eXlr=NK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8BBC4338F
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 17:30:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A80F6023D
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 17:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A80F6023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GlAEx8oeP5G4ZbOFSYkSjLQMQilOEhHlX3Od8d+QYUk=; b=WmJAsTaIbXfzeI
	rxEMeRFcK4TmJlO69YUQQtAqsc6ARJxuvsFKE4pa5J/NaamLdV/tG3p+DYGaLcgJ+E8yYqbc3dH5t
	jyPlmNhE2RY94CEPnniIiJK7XLHYn27VwuqMjJ5IKicsJDMG8qtw9z90Ll57yUrQVsW35AxDRj5xI
	5XGp3nvf8JltUdq3U4A8suKMl2qLA0iLNOaIL03ByS8jEvmjaU9rTzaeXfgd6nZyyVNW54cW/emu2
	q74P42MucyxSNAhQ1g+bKoXQU6KyBystYf0prrX/722zB7k9hZXv4xIk5orEeCh4E4I/Tlo+QSVYs
	TgQ2tWmh2BFCgmLwn+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGlrV-0098iP-MZ; Thu, 19 Aug 2021 17:29:53 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGlrI-0098d0-1Q
 for ath10k@lists.infradead.org; Thu, 19 Aug 2021 17:29:41 +0000
Received: by mail-lf1-x136.google.com with SMTP id w20so14543970lfu.7
 for <ath10k@lists.infradead.org>; Thu, 19 Aug 2021 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=QgtLVsr+5oO9IxoWKSZoPjh8Ntw6W8OxwbmFL5GDnpk=;
 b=KCqhexsIFEgPY77b2ty8qN77px4qfGZukAnIdzjCR3KIJP3PBC/z5nNZbqZ8cWS0bv
 ibSX43Z9KIgmyTv5B+DbMqHdoBGMLh51nVfRWVLlPkDr+KJjUngNRITthjNwz8ObYGiD
 7aMSAHxZ6NBj5ouoep9TPjghrBxDwR15+pvIaTH7+1ITlWLIZJ09ZVyHf2h9E+XuZh1+
 Vc+49nAoi8TtWomufCLmkAECS9PWc6Vrk/wOGLg4t7YQqNBSBisxp1NUtBtzBlMKCbQ9
 pdOw5S7/llhJmMXNg/j/nBHayDMtb083U22CQ4nNoP9y1j2X7zyKubBhU8F+VbuRY5Qp
 1esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=QgtLVsr+5oO9IxoWKSZoPjh8Ntw6W8OxwbmFL5GDnpk=;
 b=K+XM0YhFcwbSMhaqcnbix3xYWa/Te2x5fk1JVyp0kXtjwWknKa2JprMQzTNJ8Y//J0
 QjKUyxH9x8WqAMS68MICOJddUVhq1lUy2dKWDuZiRR83EDJJ8VJQO6fkU+eOfOXSWaIM
 VuW9mePE7SWTCD86Pmo2nSTWqbTYPn7y1U1cEju5QymJNFCd3TZiap8ayg0YbQ2ls1Y0
 B1bUqjpMZglPFnD2akpg7Tqdo6QXXCAk0u86veTQ8h1HSXpGN/dpoRKxj4iEgut9JMU4
 UdjLTAPmAcxG/yzIb8oEYDrHbTJoDMl1Am1LIh/0sRQ7ur6SONhNLjpZvK/fH/jGC2WS
 y0WA==
X-Gm-Message-State: AOAM532chuTIxU0iStlKIXbndJy6UmU4jGmL/RP76GF86Xnp+C//hUzy
 03QHEZj2nxLv3Z3znx31+9Ij2VzJhwiI3eraU/pmp/R61z97KA==
X-Google-Smtp-Source: ABdhPJxT1q+pOP83PFCaUwAMGV5W/MyEdJz40L9jSbGFVrMwPsJO/3LmF4/056o1pBV8TMUAoT8Z6lqXPWNjQyhVoXg=
X-Received: by 2002:ac2:4143:: with SMTP id c3mr9098853lfi.295.1629394178212; 
 Thu, 19 Aug 2021 10:29:38 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 19 Aug 2021 14:29:26 -0300
Message-ID: <CAOMZO5CHuYX6heA-3+jJ+wHUOBFcLsiy43E9qOoOx3WuJ_kP_g@mail.gmail.com>
Subject: ath10k: Incorrect MTU size for SDIO
To: alagusankar@silex-india.com, erik.stromdahl@gmail.com
Cc: ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>, wgong@codeaurora.org, 
 Peter Oh <peter.oh@eero.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_102940_149601_9CC2688E 
X-CRM114-Status: UNSURE (   9.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

On a i.MX7-based board with QCA9377 chip, I received the following
report from a user running kernel 5.10.48:

"Doing scp or just pipe through files with >10 lines I get stalls and
error logs. The ath10k_sdio errors look like this:
[  196.822363] ath10k_sdio mmc2:0001:1: failed to transmit packet, dropping: -12
[  196.830109] ath10k_sdio mmc2:0001:1: failed to submit frame: -12
[  196.836279] ath10k_sdio mmc2:0001:1: failed to push frame: -12
[  196.925452] ath10k_sdio mmc2:0001:1: failed to transmit packet, dropping: -12
[  196.933090] ath10k_sdio mmc2:0001:1: failed to submit frame: -12
[  196.939334] ath10k_sdio mmc2:0001:1: failed to push frame: -12

I am able to reliably reproduce the issue by sending a lot of data
from the i.MX7 board to a host connected via the AP:
printf '=%.0s' {1..24000} | nc 192.168.0.2 1234

I was able to narrow the issue down to the mtu. If I set the mtu for
the wlan0 device to 1486 instead of 1500, the issue does not happen.

The size of frames that I see on Wireshark is exactly 1500 after
setting it to 1486."

Is this a known issue?

Alagu/Erik,

Have you ever observed such an issue?

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
