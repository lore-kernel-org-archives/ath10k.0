Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF543C4345F
	for <ath10k@archiver.kernel.org>; Mon, 29 Apr 2024 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bV/1tuZuSr8aNDYIxY1YtcJPD4SfdQhJOIw12DQVdE=; b=BuOfm2cerKuUkOI8yktJiujq7R
	X4DAJnw9s7UXKtxFE377L2cj2voMiBIHrMH12dBm/z+FN6iHIQn/zdHb4QJGJgLxGY4xVwapXNZwJ
	C4EaZzTah8i7cNuHawQb7GUlcb2evjn5CBfRs+wytWTy11aJ/9G+kr2y8/2JFSBqLi6vaey5LpSl0
	342doIBSNj8hsW4R1lY5WNeUST+Wbbo4KzqsBp+iQj51MZSxGkKhdutmIwQkDRNGJaFuwgy5GjDpl
	0suoIcOujhOT5qYLFAZUSGnZROZkKawsCti/zj4RdKLw4xS07x18ZjmFl+NncaaCsoLRNQqndIJUv
	bNvVfCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1R1j-00000002vRl-1iQ4;
	Mon, 29 Apr 2024 13:26:39 +0000
Received: from mail-108-mta215.mxroute.com ([136.175.108.215])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1R1f-00000002vPo-3KKV
	for ath10k@lists.infradead.org;
	Mon, 29 Apr 2024 13:26:37 +0000
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta215.mxroute.com (ZoneMTA) with ESMTPSA id 18f2a0917da0008ca2.002
 for <ath10k@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Apr 2024 13:26:30 +0000
X-Zone-Loop: 7412f0b097b1225342f468296f56bf38e51281bc075c
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ericswpark.com; s=x; h=Content-Transfer-Encoding:Content-Type:Message-ID:
	References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9bV/1tuZuSr8aNDYIxY1YtcJPD4SfdQhJOIw12DQVdE=; b=M17M7Y4q5YsehmBNL+6W6dHPpW
	VFpyOq5aznBaAxMcsSxX9jAkzSn0+3QFEEu4EjhXOxe7nul/ZemrnaZ7U95XUzPedAUUPY+4v1ROY
	IO+fl2fAmRQz0Ba5iByHP1DvKzC1l/+gQb9LBzlM2vRf7+U7y3pCiU1FqMCoO77mZx5vybJ2V2hmK
	D3VaOvIVncSNUX5Pp7fhJ0Ed3cvAP4uVfkCC+4bjH4kYx2+lF5R7CK1WI5bz30nNs+iV/kw66WGmC
	ejBdHhBkDAXW0RLaB1/zY2ss6FKOwLxH0kqajXMe+2yrRytQ3GV9dik1BvK+t1sudhTc2hyn204tR
	7XOd5Ofw==;
MIME-Version: 1.0
Date: Mon, 29 Apr 2024 15:26:28 +0200
From: Eric Park <me@ericswpark.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
In-Reply-To: <87o79sfjlf.fsf@kernel.org>
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
 <87r0ghf4rw.fsf@kernel.org>
 <a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
 <87wmolsrcc.fsf@kernel.org>
 <eb86c5b7-b1b6-4515-afdf-cf3e78a79df2@ericswpark.com>
 <87o79sfjlf.fsf@kernel.org>
Message-ID: <483bc3022513fd0740b5342b59ce94ad@ericswpark.com>
X-Sender: me@ericswpark.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: me@ericswpark.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_062635_993524_814816F4 
X-CRM114-Status: GOOD (  14.79  )
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

On 2024-04-29 14:18, Kalle Valo wrote:
> If you run wpa_supplicant -dddt (or similar) you get a lot of debug
> output, I'm sure it will also include the cipher.

Good to know, thank you. Will keep this in mind the next time I'm
troubleshooting WPA-levels.

> Very good that you found this is 802.11w related. What is the make and
> model of your router?

I'm using a GL-AXT1800 (Slate AX) router from GL.iNet.

> I don't know how well ath10k 802.11w support is tested and then it was
> last tested. Do you happen to have other Access Points supporting
> 802.11w? That might help to pinpoint if 802.11w is completely broken in
> ath10k or if this is an interoperability issue with ath10k and your AP.

I unfortunately do not have access to any other routers I can modify
settings on at the moment (or any other APs to connect to, to test on,
really...) I may have some routers to test it on next week, but I'm
unsure whether they allow me to modify the 802.11w settings as they're
mostly proprietary and don't run something like OpenWRT.

Do you know if it'll be possible to add a flag to enable/disable 802.11w
on ath10k's side? Even if it turns out to be an interoperability issue,
it will most likely be useful to have the ability to switch it off for
APs that don't play nice. Especially for public APs and proprietary
APs where the end-user can't realistically turn off 802.11w for the
entire network.

- Eric

