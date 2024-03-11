Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230C4C5475B
	for <ath10k@archiver.kernel.org>; Mon, 11 Mar 2024 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KwHV1lakRgdoar2rayIzSQQ2aoPdH7AEPoLWacMr80=; b=tuopEVbfqhfu85FiOqgHbZ7LjF
	tWbDvDg5paqDZ/P2nkOj1oNOH6AYoAmzufTP/xlk+uQujmZ/4WhBhpn4gkDGL1VMO63D8tTyM/X2/
	FURCvGNqPFND9yu4E0AO7x30CJiM3wyk/PaGOM5/hVG4SaIBv0dX2rraP4BPEnQpABSj+5/vfINHz
	LWkwyqcXeSxO4Hd/fT8jx9JCu1OxcDDbXpAknsIhx1EPZDwOY2duvlBxvrUnMCsAe2t9lX5xpHKSe
	gZkht4ae1ulJnZn+L22tq9ddYDQXlQOJbOksrdrIGLd2d6Piesc6yf7Vs+5akOoWn94xpwZs1plhP
	XMh+t8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjcmQ-000000014cu-2BkT;
	Mon, 11 Mar 2024 10:21:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjcmO-000000014cN-0eqi
	for ath10k@lists.infradead.org;
	Mon, 11 Mar 2024 10:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8367860D42;
	Mon, 11 Mar 2024 10:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F75DC433F1;
	Mon, 11 Mar 2024 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710152470;
	bh=1npVSXSTw49oMcFt8zp8fWg5xGsRApwVhZDvn6RXbcw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QiQLVx1vGytj+cXGUY9rIV4OpZ6dQt1h2SA06QnnA2VJGtq5+NSEOYHIrjsm3eLgu
	 1cS6Kp6JfKw/4Y2TbAXahvoYEUh2nK96rSrZb/HEWWLRYLoWhUkGyYQ5WuFSmL5vGZ
	 KvDxpSCMHX1WvLuWLF6wLEHAh8CUo3jDtd+HiyIG7Z4h8AC67KwX9zlFlDk2BNhcj5
	 K1ZlrvyXdzikNXI8+jiHCjWNPyG370kQYC1dIpvUr4f19jJaykWp0jXCEOYS93Kxov
	 F3lLca90vdpTcgvCWJV+VOSc2B7t44qf/O+3nDeHlSipcgMJ1tWyFBMNbwCSL7LDA2
	 tXZE7UkQhKALQ==
From: Kalle Valo <kvalo@kernel.org>
To: Eric Park <me@ericswpark.com>
Cc: ath10k@lists.infradead.org
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
Date: Mon, 11 Mar 2024 12:21:07 +0200
In-Reply-To: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com> (Eric
	Park's message of "Sat, 9 Mar 2024 10:08:28 -0500")
Message-ID: <87r0ghf4rw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_032112_272185_806A9A8F 
X-CRM114-Status: GOOD (  16.06  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Eric Park <me@ericswpark.com> writes:

> Hello! I have a Samsung NT500R5H-Y53L with the QCA6174 card, and I
> noticed I was getting terrible performance (around 20-30 Mbps)
> compared to other devices on the network (600-700 Mbps), when running
> a speedtest.
>
> I tried modifying some settings and discovered that I can get around
> 500-600 Mbps on the speedtest if I limited the router settings to
> WPA2-PSK, but once I set the setting to allow for both WPA2 and WPA3,
> the card connects using WPA3-SAE but then has terrible performance as
> a result.
>
> Is this a driver bug, or a limitation of the hardware?

My first guess it's because of software encryption with these cipher
suites (from ath10k_set_key()):

	/* this one needs to be done in software */
	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256)
		return 1;

But with modern CPUs I would have still expected software encryption to
be faster than 20 Mbps so the chances are it can be something else as
well.

> Is there a way to force the card to connect over WPA2-PSK?

That's a user space decision and depends on what connection manager you
use. For example, here's some info how to setup key management with
Network Manager:

https://askubuntu.com/questions/1290589/how-to-use-wpa3-with-ubuntu-20-04

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

