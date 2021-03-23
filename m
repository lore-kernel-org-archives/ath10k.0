Return-Path: <SRS0=Hvwv=IV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90264C433DB
	for <ath10k@archiver.kernel.org>; Tue, 23 Mar 2021 01:22:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB4661934
	for <ath10k@archiver.kernel.org>; Tue, 23 Mar 2021 01:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FB4661934
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4QqNYY55PF4a3q2rM+IxRxg9+GQNe0b5kydB+4nr2f8=; b=YNHBVkKAFZNqwNhLhZ/NMAMIJ
	+S0d1BkQOoJslNGz6136b+ZHQiIvCfCMAKOL4gKvry432Mijl9cV6umSmAphY4o3miM4ujaB/wtN6
	+0qKGGLC4Ke4yeb6efwqKcTWjORpoT4fNFyhkB8z1gvmusjOM0oqewnV/VISyFu/y7lCHu0Dy9KVY
	cbXH+bWEIYyWmeq6dSeSg7LbbnLDskhj9++P6uZs/S6a8Rx3J8DKk8TWJwt6L9f6jrKm2gEj/OLct
	Lh79CHx8vabIHZTfKBw5NfqSfQBNbJYnsFAMzcF2vDMo0kydjrGhr3EhZguVM2bv+mnE/Je+vIZLM
	8VPA+boxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOVjc-00DDEV-CK; Tue, 23 Mar 2021 01:21:28 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOVjO-00DDCx-8Z
 for ath10k@lists.infradead.org; Tue, 23 Mar 2021 01:21:16 +0000
Received: by mail-oi1-x236.google.com with SMTP id c16so6367883oib.3
 for <ath10k@lists.infradead.org>; Mon, 22 Mar 2021 18:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JYxYqwBBeANyqWyQGmvwdqYnwLRNZNV58JDTVavfLTc=;
 b=a6JdwhHNlMdGaVeyHRZVJp6OtC/hlOt2kSI6OhN2ddlOaHVxVeZeQ8HV+E3FTvmvQI
 pH1SrynTesuBahTBNhFHiYEUSrRpIW+SEGg/Om+b8Jo2ibJxfOS4B1Nd+F1pWFpuNAjM
 1XKffvMC9iWDlAG/WJRZCqZ15ztaMjjuJsuMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JYxYqwBBeANyqWyQGmvwdqYnwLRNZNV58JDTVavfLTc=;
 b=NOe3BB4XH4cAlBNBo+RgovJIvrR/DDi/4i8//x/WEdnE0rxgiSNC0N4bF0cylcgJwx
 yT0C1uukkMZ8wLTZ9Skr1MImz7OzEgu3VMCUswfi52epzmqdzaudLDJuhhF0CEZwIfWw
 Jxb3644rpEVp8MsmeLGnrkfBAb7u/n1MwpLhzkC6nDI9yMV7MV0j1n8GDRHKKJXRFnf/
 9/yknlDTT8FremhgGFEWKUmDstg+0X11v/ayrFKFYzqjvimxX/qdNORY2BdPYS3p4Eo0
 Ec80W36Gpy43nacQt/5GhYAqsZKdyG7KQ3e1/HihTmnm532/YdFoMTlZb55nOj/HM9E3
 qkHw==
X-Gm-Message-State: AOAM530hZ/AiMttwIrwD3cY66I6itBl50hYILrof5qyY+seIPjXn5GjQ
 2+RGwek36zumzN/gQhyE2isf6rii9SNnnw==
X-Google-Smtp-Source: ABdhPJzMKwnyozW/5pAiHvDrhNpBP2wnKhVBSkmozL6bPvFR36HRsi4P1/8Zz3qN8knr1qVDeBZj6A==
X-Received: by 2002:a05:6808:f0a:: with SMTP id
 m10mr1532502oiw.48.1616462471788; 
 Mon, 22 Mar 2021 18:21:11 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com.
 [209.85.210.50])
 by smtp.gmail.com with ESMTPSA id 8sm3857637otx.1.2021.03.22.18.21.10
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 18:21:11 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id
 s11-20020a056830124bb029021bb3524ebeso1178576otp.0
 for <ath10k@lists.infradead.org>; Mon, 22 Mar 2021 18:21:10 -0700 (PDT)
X-Received: by 2002:a9d:1b70:: with SMTP id l103mr2239864otl.203.1616462470404; 
 Mon, 22 Mar 2021 18:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
 <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
 <d79ae05e-e75a-de2f-f2e3-bc73637e1501@nbd.name>
 <04d7301d5ad7555a0377c7df530ad8522fc00f77.camel@sipsolutions.net>
 <1f2726ff-8ba9-5278-0ec6-b80be475ea98@nbd.name>
 <06a4f84b-a0d4-3f90-40bb-f02f365460ec@candelatech.com>
In-Reply-To: <06a4f84b-a0d4-3f90-40bb-f02f365460ec@candelatech.com>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 22 Mar 2021 18:20:58 -0700
X-Gmail-Original-Message-ID: <CA+ASDXOotYHmtqOvSwBES6_95bnbAbEu6F7gQ5TjacJWUKdaPw@mail.gmail.com>
Message-ID: <CA+ASDXOotYHmtqOvSwBES6_95bnbAbEu6F7gQ5TjacJWUKdaPw@mail.gmail.com>
Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
To: Ben Greear <greearb@candelatech.com>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes@sipsolutions.net>, 
 Rajkumar Manoharan <rmanohar@codeaurora.org>,
 Rakesh Pillai <pillair@codeaurora.org>, 
 ath10k <ath10k@lists.infradead.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>, 
 Linux Kernel <linux-kernel@vger.kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>, Evan Green <evgreen@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_012114_394515_83780C16 
X-CRM114-Status: GOOD (  16.59  )
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

On Mon, Mar 22, 2021 at 4:58 PM Ben Greear <greearb@candelatech.com> wrote:
> On 7/22/20 6:00 AM, Felix Fietkau wrote:
> > On 2020-07-22 14:55, Johannes Berg wrote:
> >> On Wed, 2020-07-22 at 14:27 +0200, Felix Fietkau wrote:
> >>
> >>> I'm considering testing a different approach (with mt76 initially):
> >>> - Add a mac80211 rx function that puts processed skbs into a list
> >>> instead of handing them to the network stack directly.
> >>
> >> Would this be *after* all the mac80211 processing, i.e. in place of the
> >> rx-up-to-stack?
> > Yes, it would run all the rx handlers normally and then put the
> > resulting skbs into a list instead of calling netif_receive_skb or
> > napi_gro_frags.
>
> Whatever came of this?  I realized I'm running Felix's patch since his mt76
> driver needs it.  Any chance it will go upstream?

If you're asking about $subject (moving NAPI/RX to a thread), this
landed upstream recently:
http://git.kernel.org/linus/adbb4fb028452b1b0488a1a7b66ab856cdf20715

It needs a bit of coaxing to work on a WiFi driver (including: WiFi
drivers tend to have a different netdev for NAPI than they expose to
/sys/class/net/), but it's there.

I'm not sure if people had something else in mind in the stuff you're
quoting though.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
