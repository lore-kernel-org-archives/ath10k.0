Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366B7C10F16
	for <ath10k@archiver.kernel.org>; Fri,  3 May 2024 21:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atpR1fNWkMmXO82Ip23N6KcFWxdG/Cs1hkzYQ2NCQCg=; b=DW3ii8j4SQQfzWHqPi1MCD1Ago
	FGxzzaTOoh+p86GNQ0Mh+73jzROpsekNBy1vqh8FwG39SZk4cgFaWaUltBFcQQy9WNWgJAcf4FqtX
	UyZQG9R0abqdcQp4Wdfx4bECugU6JO1Av+hyW3Uo05IxcrMGEq9voQv3/WIj761O+co0m7xK93ZHG
	y/4iaqpgjvIon7bIlHU7w0B+b276HGHT7XCMeHW66zOUiezKoA+9AQsbisuzOXBKcIDAyS2jNw1Ur
	XMRsMo2B4dTdC4ORgxOZEiOKyT4e+9voCVN9l8hj7+Plb8oJlL3vH2v/bmzG5locdOFtOZJtMfrT9
	jA8MSU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s30q5-00000000W0k-2ujS;
	Fri, 03 May 2024 21:53:09 +0000
Received: from mail-108-mta25.mxroute.com ([136.175.108.25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s30q3-00000000VzS-09rV
	for ath10k@lists.infradead.org;
	Fri, 03 May 2024 21:53:08 +0000
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta25.mxroute.com (ZoneMTA) with ESMTPSA id 18f407247c30008ca2.002
 for <ath10k@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 03 May 2024 21:53:02 +0000
X-Zone-Loop: 264065521231c00f80c2a7202e3de64127882776a89d
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ericswpark.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=atpR1fNWkMmXO82Ip23N6KcFWxdG/Cs1hkzYQ2NCQCg=; b=bfHwln7hKTYOeOpXvK49OG9s/5
	0YjPthwvyIdUN+IJeWeC8bZEtdgkn0SHFHJZK8HGhIOEynhOT76sb1CfR8XDE8lA7uxUhbh+Dnngk
	wdxprPb8nnvwnhvayZW8hqNb6kBGqfHgki66DNTvEVR4nq0ocCXuJxW1TWU+zCjtv7ojGKq2zaFH8
	DfkeTk3QEr4ss5N0xw41qZO+hKjn+I4Kr7cxNKAfvn5K9OwpSqRVaGpeZlvualHaZCdoJbdzRo4Tj
	kpLiePRC3xFsCIgOD1jjRcmbZPshgkFVV91TMI46MxkA/nqLagVrSrkazafLGJfvoaO1jECdpFAJZ
	Q+Ju4XZQ==;
Message-ID: <b9a07fe0-b50a-4d70-a7f3-3b82d224d90f@ericswpark.com>
Date: Fri, 3 May 2024 17:52:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
From: Eric Park <me@ericswpark.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
 <87r0ghf4rw.fsf@kernel.org> <a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
 <87wmolsrcc.fsf@kernel.org>
 <eb86c5b7-b1b6-4515-afdf-cf3e78a79df2@ericswpark.com>
 <87o79sfjlf.fsf@kernel.org> <483bc3022513fd0740b5342b59ce94ad@ericswpark.com>
 <87bk5sqgdf.fsf@kernel.org>
 <7b8068ed-52ea-4051-b530-3a9af650e582@ericswpark.com>
Content-Language: en-US
In-Reply-To: <7b8068ed-52ea-4051-b530-3a9af650e582@ericswpark.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: me@ericswpark.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_145307_198601_1F12333A 
X-CRM114-Status: UNSURE (   6.92  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

I had the opportunity to test the connection with another router (Asus 
RT-AX56U) today and it negotiated with WPA2-PSK, PMF default on, on 5 
GHz. I ran a speedtest and got 20 Mbps both up/down.

I then ran the `nmcli connection modify <SSID2> wifi-sec.pmf 1` and 
after reconnecting it connected with PMF disabled. (I think the reason 
it worked this time is because of WPA2-PSK -- there's probably some way 
of making it work with WPA3 APs and `nmcli` but I don't know the correct 
commands to give in order to make that happen.) The speedtest increased 
to 100 Mbps both up/down, and that's the WAN limit -- I'm pretty sure if 
I ran a iperf3 inside the LAN it would've been much faster.

I think the PMF implementation in ath10k, at least for the QCA6174 chip, 
has some issues as it has consistently worsened performance on two out 
of two sample APs I've tested it on.


- Eric


