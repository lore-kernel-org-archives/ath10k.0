Return-Path: <SRS0=F6w2=IX=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13727C433C1
	for <ath10k@archiver.kernel.org>; Thu, 25 Mar 2021 10:34:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBE3061A1A
	for <ath10k@archiver.kernel.org>; Thu, 25 Mar 2021 10:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBE3061A1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pXq2isz+5Ho/KcOpKyrYuukEBxUUq3Q9BCbLE8qrVJE=; b=XQv0TPAUkY2Y0gtGOAQr9Cbvg
	09aRGDeqosfvfd+TMcuE/ZLJr5rsHAnWrZeZYLJsxSJVGi0cqPgnnqQC0OhXHsDWo2pPybSrEZjaz
	FqfibRD45+dZoLUEB/ubzaoshfDGYOlpw+zFnZbk+a9NwQdR6gkYxCcis36O2wtpzEkPmB0+H5iRz
	7rhALC4JTRCmlo9Uo4FaWeBURdHD45DuSUj8B6i4pLbJ+rvXtSPtko/gu0wdqjDzPYoF3Dw8DOFTw
	VGcPYw1ABDfKypHDaiq9I2eg8XLVFxMTCbNUuZejFpPLTt265J5ndusjuc/Ml4w2vj8Ihk39SdAzU
	U1JpN3a5g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPNJt-001DTt-Ov; Thu, 25 Mar 2021 10:34:29 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPNJT-001DT6-B7
 for ath10k@lists.infradead.org; Thu, 25 Mar 2021 10:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zX4w/YCkqpoXy6bZV/Ut/Ci2wQiJmAv2JfLAPxQJFqE=; b=Ia8EkU18A2xNwsyK3OpzgjLKLN
 5CoFQt5FqnnsFZdgK9ZQAHhiC//FyW9i1ap51uUVLdvmTahmQPtEpeO1O0QXweTu1njJ1rf/oomaz
 bhhfmOoH9d118Fg1dbfcniJgUstgdh4CnwLGfZzXH6BAtG8O4ej9hHECFYAPeiA8J+Fg=;
Received: from p4ff13c8d.dip0.t-ipconnect.de ([79.241.60.141] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lPNJL-0003xC-IU; Thu, 25 Mar 2021 11:33:55 +0100
To: Rakesh Pillai <pillair@codeaurora.org>,
 'Ben Greear' <greearb@candelatech.com>,
 'Brian Norris' <briannorris@chromium.org>
Cc: 'Johannes Berg' <johannes@sipsolutions.net>,
 'Rajkumar Manoharan' <rmanohar@codeaurora.org>,
 'ath10k' <ath10k@lists.infradead.org>,
 'linux-wireless' <linux-wireless@vger.kernel.org>,
 'Linux Kernel' <linux-kernel@vger.kernel.org>,
 'Kalle Valo' <kvalo@codeaurora.org>, "'David S. Miller'"
 <davem@davemloft.net>, 'Jakub Kicinski' <kuba@kernel.org>,
 netdev@vger.kernel.org, 'Doug Anderson' <dianders@chromium.org>,
 'Evan Green' <evgreen@chromium.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
 <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
 <d79ae05e-e75a-de2f-f2e3-bc73637e1501@nbd.name>
 <04d7301d5ad7555a0377c7df530ad8522fc00f77.camel@sipsolutions.net>
 <1f2726ff-8ba9-5278-0ec6-b80be475ea98@nbd.name>
 <06a4f84b-a0d4-3f90-40bb-f02f365460ec@candelatech.com>
 <CA+ASDXOotYHmtqOvSwBES6_95bnbAbEu6F7gQ5TjacJWUKdaPw@mail.gmail.com>
 <47d8be60-14ce-0223-bdf3-c34dc2451945@candelatech.com>
 <633feaed-7f34-15d3-1899-81eb1d6ae14f@nbd.name>
 <003701d7215b$a44ae030$ece0a090$@codeaurora.org>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
Message-ID: <e7dc6d97-bab2-3bd4-685a-a8b5e25c18d9@nbd.name>
Date: Thu, 25 Mar 2021 11:33:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <003701d7215b$a44ae030$ece0a090$@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_103423_457405_C94E745B 
X-CRM114-Status: GOOD (  13.65  )
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


On 2021-03-25 10:45, Rakesh Pillai wrote:
> Hi Felix / Ben,
> 
> In case of ath10k (snoc based targets), we have a lot of processing in the NAPI context.
> Even moving this to threaded NAPI is not helping much due to the load.
> 
> Breaking the tasks into multiple context (with the patch series I posted) is helping in improving the throughput.
> With the current rx_thread based approach, the rx processing is broken into two parallel contexts
> 1) reaping the packets from the HW
> 2) processing these packets list and handing it over to mac80211 (and later to the network stack)
> 
> This is the primary reason for choosing the rx thread approach.
Have you considered the possibility that maybe the problem is that the
driver doing too much work?
One example is that you could take advantage of the new 802.3 decap
offload to simplify rx processing. Worked for me on mt76 where a
dual-core 1.3 GHz A64 can easily handle >1.8 Gbps local TCP rx on a
single card, without the rx NAPI thread being the biggest consumer of
CPU cycles.

And if you can't do that and still consider all of the metric tons of
processing work necessary, you could still do this:
On interrupts, spawn a processing thread that traverses the ring and
does the preparation work (instead of NAPI).
From that thread you schedule the threaded NAPI handler that processes
these packets further and hands them to mac80211.
To keep the load somewhat balanced, you can limit the number of
pre-processed packets in the ring.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
