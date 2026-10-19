Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3742CCF2DB
	for <ath10k@archiver.kernel.org>; Mon, 19 Oct 2026 13:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT7565n3cY+YDTERB3uQ8khKJFfspA8uXPmSUyaFk3g=; b=e3GMd3cpivpxzG1+fJYl+dqubZ
	apbw0uGvudixHUJ8VSjjLZJU68PyJO6Qe8GUPO8JPfX78OMBaAwHR3+uYtzBSd69wMsHiLz+8WuVM
	v8XWiEhp+OaeBm4qLgZdD1HrbamO1q4zleC1qjicmRMxDu4K1Jt2osJt24KBWY702gtoR1Af+3xEv
	Bt/iGOGNBHjf2HYmndUsC0Eem2tbgEzogfGqLRjrItHKMtyROp1OWYgF86jek/VMiY05/LFqsoQhq
	y/ugXeSFXyHU1JDVnJ1TUU0EzBBK4bwspV1eBiTcWy+tn5QfOUdI9d4qTKoH7FMqLTyQYNDb6QVbY
	yzFlfQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInA3-00000007UKX-1wvr;
	Mon, 19 Oct 2026 13:12:19 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInA0-00000007UK0-2fcj
	for ath10k@lists.infradead.org;
	Mon, 19 Oct 2026 13:12:18 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e812e2b31bso10655945ad.3
        for <ath10k@lists.infradead.org>; Mon, 19 Oct 2026 06:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792415535; x=1793020335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gT7565n3cY+YDTERB3uQ8khKJFfspA8uXPmSUyaFk3g=;
        b=QPuDEnD16lKTJUkd7npizesK1HSXaOknnWZSGh8NIq/GxgJRrezUgA2zy7vWSV3r12
         dSjHH/mimiORkQofiAdB+BLMNg07OYCXDOjT/jK9ic6k3QLQqHkcsrefg0uE/6b2qgU+
         3gh2HPcrwGfUTLf8RhDPLU2wzO7yo27+pc2VpVA6TiwwsdYkFH7KTb8s/RztWVPgfHoC
         nEUW0PgvWsk1CBqhonpQ5VvDcJxfOahbmccsK74tSI3hQlBj5vmQA+8dJzZ/kl8463kf
         2RWLWrPdUVAsyI4KQWkaqks6Bj9mLxrlzVfQVh9Rm+wwp6+3LE1QDQTIlZ0lSRM7acmg
         8ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415535; x=1793020335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gT7565n3cY+YDTERB3uQ8khKJFfspA8uXPmSUyaFk3g=;
        b=LnMzMhPhMdy0KfpR1VXmB8efaPFAlpKUqOv3vDm+7+Di1l/ux4+zseD9deZt3MnZb1
         7aR17ln/X9wQx8AhsGp8bmbfm8WnkfoSAT7KsIY+y6CA9dodhTf2oFb7Muh5jtH1ayYI
         UkL0zff5AmezYfccC8bv+hWXWMBiQCbFdr00Pei5tA0XtgOZHE7DjNLhO32LJwGA09OR
         KVZrOMyl+P4lXNiaeADIQbwGjnkyTuPbwiJ91MRTPLlXvr33Axi1x1iiDsZfcybRhUap
         kKNaNrdNZiQB6pUrJuSnLVuAQZS/6YWxxdu8TPOgbFvAx0j/RiFo7W+rSjD8Mk5Ffxgn
         PmKw==
X-Forwarded-Encrypted: i=1; AKwUvBwEpCwjMeiq9O04OIv1AdNyN7Qm6DzMhX+KiFNO4s0WnsfoIuPpyNaVdiCPhVrjE7xOAb91ABk=@lists.infradead.org
X-Gm-Message-State: AFq9FYLkcPM6SAfktW9/Hy5QG4cgNYJqlo9diM3mFOIepRHolk5MKKCC
	gc5DRRzc2ifKug6Ek2LtVI2EbvwSglKds7NxRL4IyelHuXAGrKpfwZwV
X-Gm-Gg: AYBFou2Qlshu9WVO9hfbIbWd5JScdn2J0fbjUIRbXlFt0JnbLs4M6IyvDFnSvMwUCgc
	5GNAFNe7sNrt+kvGfmmFNLz6SMQi7zDuCA8MktANZ3bKi1Y8RZaj+9yjHrwrianijxfXSqo05PC
	gnXdyU4wrHk+5Zyy0qamR4FKXwJXO2rCWJ2tlT2+Z69EVnp4cj0PqJWuBHOc2iU0SISYDmj8CWd
	dKKQ0Y4VCy/1P5VWnFRSzmeAWGWj8i02VleVIXs3b/mINF4iyWd5nOaKy3iiIeTOBCz3VcvDtx4
	g6m/8wsxuAENikKb8nIP+hSxc3MDXqYwPhOdVeNZZ1hZ/B3ehvPZrDmFEMXNgS7W+LD1Umr+Pz1
	Yve3aq8q64ZrI+YRnHHnNWOlH/POaF/fObsM9FhgKwFrwQnWcj6X7aP1CWtBvf8lbIS7Nbw4DpJ
	X878cg3t48r44cgTqB9PMAERWQIidkfbdgmpvnb8tuVWf4bffsFkqwIxNY6KdqHy1OlADlSscRl
	9Ka7AhP/sREfgEXCw1LfJrLpXi3an4cAt6tBIgh8ruPSJTSIJSimzF0L4mEFuxuRz5QtKHLa1yj
	X/SGqM1d
X-Received: by 2002:a17:902:e84c:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2e9a69e93d4mr70486035ad.30.1792415535050;
        Mon, 19 Oct 2026 06:12:15 -0700 (PDT)
Received: from [192.168.1.164] (h69-130-12-20.bendor.broadband.dynamic.tds.net. [69.130.12.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1517e895sm430215ad.57.2026.10.19.06.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:12:12 -0700 (PDT)
Message-ID: <61207966-c403-441d-9019-583702833a7f@gmail.com>
Date: Mon, 19 Oct 2026 06:12:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/3] wifi: ath10k: bring down a station vdev that
 never came up
To: shunsuke@nagashi.ma, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 Fabricio Akio <fabricioakio@gmail.com>
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-3-c847697b3558@nagashi.ma>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <20261016-ath10k-series-v1-send-v1-3-c847697b3558@nagashi.ma>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_061216_681170_E70F0315 
X-CRM114-Status: GOOD (  14.62  )
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

Hi Shunsuke,

On 10/15/26 5:17 PM, Shunsuke Nagashima via B4 Relay wrote:
> From: Shunsuke Nagashima <shunsuke@nagashi.ma>
>
> When a connection attempt fails before the station vdev is brought up
> (authentication timeout, SAE failure, association rejected, or an Auth
> burst the AP never acknowledged), mac80211 removes the AP station and
> unassigns the channel context. ath10k deletes the peer and sends
> WMI_VDEV_STOP, but no WMI_VDEV_DOWN: for a station vdev that never came
> up, the down would only come from ath10k_bss_disassoc(), which a failed
> connection attempt never reaches.
>
> On WCN3990 firmware WLAN.HL.2.0.c10-00459 and c10-00236, the Auth frames
> of the next attempt on the same vdev are then not transmitted
> (management tx completion status "discard") until about 20 s after the
> first Auth frame of the failed attempt. In sniffer captures, 241 such
> holds ended 19.94-20.03 s after that frame. Some lasted longer (in one
> overnight run, 29 of 226 had not ended when the cycle ended), for
> example when user space gave up on the attempt during the hold. Probe
> requests still go out. The state belongs to the vdev: an attempt to
> another network (another BSS on the same AP) on the same vdev was held
> too (2 of 2), and re-creating the vdev cleared it (2 of 2). This happens
> on WPA2 networks as well as WPA3. An older firmware build,
> WLAN.HL.2.0-01387, did not hold the frames (0 of 7 reconnects after
> status 30).

This seems similar to an issue we see on the QCA6174's. I don't see a 20 
second delay, but sometimes after an auth/assoc timeout we get a spam of 
failed connections with NL80211_TIMEOUT_UNSPECIFIED. I've mentioned this 
quite some time ago [1]. Do you think it has any relation to whats being 
fixed here?

Thanks,

James

[1] 
https://lore.kernel.org/linux-wireless/441e9883-1efc-498b-ba33-6a4f12443f3b@gmail.com/


