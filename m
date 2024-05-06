Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA5BC25B5C
	for <ath10k@archiver.kernel.org>; Mon,  6 May 2024 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGTPOzpsPeXbdBBzIq/rSE+g6F4hqZPgv1na7tT0YjM=; b=vHkCXrQroFCQ56pKCjzVGUxs6v
	SuO1ksY2Gm71wggdANplqIN/FFUUaOC862OMrJPI65R8xaZqcYzy6KOZtu3Q7Sm+J6F9+Xscb8Mhz
	ffX+K4KgF4Ug35eopJp6DmplHyGaBjg9OzJfgGBLBtUM5npxVz11c1fe3P+oIFFXtF7y/7n9+WrQ6
	bCTtOSzvgTDA6W2NCcYVQ2WNSQIQnWUA3+HfdQMriPeAPQWtDSV6mGI6YeWJ6psQTTnmFMdeVDiEX
	/Xbz1AUgmdRtoAcwarX7OP2XL84HgNBBzt+aZ+z4m8FKjfPVd2NQqSjqHZVUY3hYto4dWBrCh2FDi
	EkpxQv4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3uH9-00000006jmD-1p4O;
	Mon, 06 May 2024 09:04:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3uH5-00000006jjV-2cXr
	for ath10k@lists.infradead.org;
	Mon, 06 May 2024 09:04:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B95A461115;
	Mon,  6 May 2024 09:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FB9C116B1;
	Mon,  6 May 2024 09:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714986280;
	bh=fgvoj0EoUqITCbi6T0ph43pzi6dps4lLWN8TneDPZLc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pAqoIbwUXZ7ulIWetOwrzGBiabSJsY8lOBYefjlgbObaSxZnU1WGB2Wyxm3lBUCJk
	 l5GbRBpMOuSxjjCxcefOZpMLarJVOX82X242+NKQ3hJeHFj9CXF8phxyiBUgXgANYf
	 wvi9YS5P53jbA3Eh/dzwfcAJASPE7W7odWgLdjauh2MhhXtAnLIng0PqAXwe1kN6AL
	 BWvAG9CEZtFISbaqhaIh9C3Fas5VWnvo3HDKW6UjoJR8h4LbU6PS32dYgoHkW7OwuF
	 lyumcH03pKEJHSGiCJUsIuDzSxNAmtz1JoLdvQrMiSRE3Me6z70y6fL1iuktVc86/3
	 MsnKxJIYdjkoA==
From: Kalle Valo <kvalo@kernel.org>
To: Eric Park <me@ericswpark.com>
Cc: ath10k@lists.infradead.org
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
	<87r0ghf4rw.fsf@kernel.org>
	<a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
	<87wmolsrcc.fsf@kernel.org>
	<eb86c5b7-b1b6-4515-afdf-cf3e78a79df2@ericswpark.com>
	<87o79sfjlf.fsf@kernel.org>
	<483bc3022513fd0740b5342b59ce94ad@ericswpark.com>
	<87bk5sqgdf.fsf@kernel.org>
	<7b8068ed-52ea-4051-b530-3a9af650e582@ericswpark.com>
	<b9a07fe0-b50a-4d70-a7f3-3b82d224d90f@ericswpark.com>
Date: Mon, 06 May 2024 12:04:38 +0300
In-Reply-To: <b9a07fe0-b50a-4d70-a7f3-3b82d224d90f@ericswpark.com> (Eric
	Park's message of "Fri, 3 May 2024 17:52:57 -0400")
Message-ID: <87jzk7mhuh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_020443_829703_FF2699A9 
X-CRM114-Status: GOOD (  15.78  )
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

> I had the opportunity to test the connection with another router (Asus
> RT-AX56U) today and it negotiated with WPA2-PSK, PMF default on, on 5
> GHz. I ran a speedtest and got 20 Mbps both up/down.
>
> I then ran the `nmcli connection modify <SSID2> wifi-sec.pmf 1` and
> after reconnecting it connected with PMF disabled. (I think the reason
> it worked this time is because of WPA2-PSK -- there's probably some
> way of making it work with WPA3 APs and `nmcli` but I don't know the
> correct commands to give in order to make that happen.) The speedtest
> increased to 100 Mbps both up/down, and that's the WAN limit -- I'm
> pretty sure if I ran a iperf3 inside the LAN it would've been much
> faster.
>
> I think the PMF implementation in ath10k, at least for the QCA6174
> chip, has some issues as it has consistently worsened performance on
> two out of two sample APs I've tested it on.

Yeah, clearly something is wrong somewhere but difficult to say where
exactly. I got a private comment that one possible cause might be that
the first ADDBA frame is not decrypted correctly and the aggregation is
not working. Broken aggregation would explain the decrease in
throughput.

This is of course just a theory. I don't know how familiar you are with
802.11 protocols but that is something to investigate. Unfortunately I
have very little time for ath10k nowadays.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

