Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507AAD3B98F
	for <ath10k@archiver.kernel.org>; Tue, 26 Nov 2024 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPMLzMmK0KKzaO0NVovKhOpAnvw6uWElGaIczBWn2T0=; b=AxkNXLE3ldZ6yWFVebxoFJ+2Qp
	YF/YHM65F6iN+wd7I9crpTRk6Ns7Oy4konHpRl7fFna9rDYqFv6FaIO/GyKPj3PMffPZ5LAwfyRZU
	GyxKVzlKjKFIGesTMoEMGwZ05bEoacvyXHrn1YKEg006hLbTN11fl2XIyfhYFJNGmiZIkiQN1MlPy
	kjHOu1xW0nbyS85rR/BWMQWL6vs1yEzh38pNNRF/R7H7hY7mRg0APkqVu6OnjWTZyg4J+Ymqkv9Nr
	yT9/7hoeFxg2krU52X5dyFrezknJ2Blif7bFZ3CebbYvL1DHKSewMC1nYwRpXM3xyh9jw4NlR+HdG
	QagPqc3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvRE-0000000AgHy-2Gnl;
	Tue, 26 Nov 2024 13:17:08 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv8Q-0000000Ad7y-0Ge7
	for ath10k@lists.infradead.org;
	Tue, 26 Nov 2024 12:57:43 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6d41176505fso51407506d6.2
        for <ath10k@lists.infradead.org>; Tue, 26 Nov 2024 04:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732625860; x=1733230660; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kPMLzMmK0KKzaO0NVovKhOpAnvw6uWElGaIczBWn2T0=;
        b=XYwZaCg/auAa1FhLdrjdKavWmCPhT8VAmvPQrXur10OpN9EIdJl5eEfMqZSFvMVdZn
         8mQkdhaFtQDf9InlPGBwLL+lQ9nbBF6FBqad+11FV62E3dbMbUgE+z5NaXS9cywW+zSA
         d9ys5Mq9owJsosMLK0HMkRl6wk3tH+3QyQDPSPO2ET13Q5QTyHmGmo6cQRaU1YOBTy1r
         u/vVIJvBZ0RgTrpEEcijsZesT99BJQ7S7Ja5PdVryABcX8AsPpUKa6NIQAw+w6OKCEUm
         obBSsRsiJRpSUsRJs/aP5yxulgjE6FAqVNlIF5AURaRd5usIdkStj0vgV3P0UcUsfG63
         URzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732625860; x=1733230660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPMLzMmK0KKzaO0NVovKhOpAnvw6uWElGaIczBWn2T0=;
        b=lXz6zOKToopbSLbsZKbwtFWff+sqq8Ft8Ztfdc147eCxHH7/sy3rp8LaMaWs+syG79
         t9ZeHkHVG62O4uKeKyB7+jO23CDwSCu1PuRCfalXLCZhy/1OUsJpK9fdotEm8w6xK1gH
         bxfcno/+66HJWOnKfeFEw5VIfzG83WxQwSdUH8DhVLLCUzRqNfZsXAQ/T1dTo8btnE81
         kHCXmH0N0ePfirjFUY76PFmsy7erMCiys1+YvRuvVL0xF4oOGR6+tJ17LCt7/XhJZF4C
         32/t0+gOyX+SYLaU8u4VqWAlxG2o0b0MBgIMz1XFA345zKgl1ugPOs+x7qfeApU1VUZO
         AZ6A==
X-Forwarded-Encrypted: i=1; AJvYcCUwS+rV/ZmVaZ5kzbziLnycqXKFPh9Jlx5QHDyvq5PP4UztUg0w0WrGCH2sVi0Sj7cbeM0W18M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Kn9yH0HFnyVE+UwYrdKxy8W+1w+5B8nHWILX1vrTlcjYk/Ph
	s09ziMkzgx8SENCgizpF4Ao+AD53zZjTxQUp9RCD7l8U+kKLNXI5
X-Gm-Gg: ASbGnctQk3hJBqDkiSfcrT6Pa1ATgPy2acv0DBPqam96cVeYJbk+dqkWEnibuHOEZUl
	Zrt8etJEgjQtRMiE/dSLBr6BKgb7EhRhpCh3ZgftEVTK4hg5ntZ4IUPqz9h6JZjtdheoRB6X7g/
	6BE/VQ0nWtMHfYrgKel7mO9mrQx47xYqDn69FRz8t+plL+QNcMqS/FObJ0I3ds2433LF/hx96lW
	C/8QopoCV8nMBBTt65GFlu/DPlSPupEUO+sj6swtOKSjWgPdxjmGw==
X-Google-Smtp-Source: AGHT+IFnP2Gi8gvg7R66MTjJ+gzk2OF2AsbQsoaxzJZu2XBdwQXekD9jcmse+lTjI945O7/0K3D1Mw==
X-Received: by 2002:ad4:5fca:0:b0:6d4:12af:be77 with SMTP id 6a1803df08f44-6d451345773mr282199186d6.38.1732625860511;
        Tue, 26 Nov 2024 04:57:40 -0800 (PST)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451b23e25sm54289396d6.89.2024.11.26.04.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 04:57:40 -0800 (PST)
Message-ID: <20215f63-e2e6-4f9a-bbbe-d7535c5ce9d2@gmail.com>
Date: Tue, 26 Nov 2024 04:57:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v3 0/2] Improve ath10k flush queue mechanism
To: Remi Pommarel <repk@triplefau.lt>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
References: <cover.1732293922.git.repk@triplefau.lt>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <cover.1732293922.git.repk@triplefau.lt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045742_108557_03F2658B 
X-CRM114-Status: GOOD (  24.73  )
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

Hi Remi,

On 11/22/24 8:48 AM, Remi Pommarel wrote:
> It has been reported [0] that a 3-4 seconds (actually up to 5 sec) of
> radio silence could be observed followed by the error below on ath10k
> devices:
>
>   ath10k_pci 0000:04:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0
>
> This is due to how the TX queues are flushed in ath10k. When a STA is
> removed, mac80211 need to flush queues [1], but because ath10k does not
> have a lightweight .flush_sta operation, ieee80211_flush_queues() is
> called instead effectively blocking the whole queue during the drain
> causing this radio silence. Also because ath10k_flush() waits for all
> queued to be emptied, not only the flushed ones it could more easily
> take up to 5 seconds to finish making the whole situation worst.
>
> The first patch of this series adds a .flush_sta operation to flush only
> specific STA traffic avoiding the need to stop whole queues and should
> be enough in itself to fix the reported issue.
>
> The second patch of this series is a proposal to improve ath10k_flush so
> that it will be less likely to timeout waiting for non related queues to
> drain.
>
> The abose kernel warning could still be observed (e.g. flushing a dead
> STA) but should be now harmless.
>
> [0]: https://lore.kernel.org/all/CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
> [1]: commit 0b75a1b1e42e ("wifi: mac80211: flush queues on STA removal")

I saw in the original report that it indicated it was only for AP mode 
but after seeing this and checking some of our clients I saw that this 
is also happening in station mode too. I only have clients on 6.2 and 
6.8. I can confirm its not occurring on 6.2, but is on 6.8. I also tried 
your set of patches but did not notice any behavior difference with or 
without them. When it happens, its always just after a roam scan, ~4 
seconds go by and we get the failure followed by a "Connection to AP 
<mac> lost". Oddly the MAC address is all zeros.

Nov 25 09:09:50 iwd[16256]: src/station.c:station_start_roam() Using 
cached neighbor report for roam
Nov 25 09:09:54 kernel: ath10k_pci 0000:02:00.0: failed to flush 
transmit queue (skip 0 ar-state 1): 0
Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_mlme_notify() MLME 
notification Del Station(20)
Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_link_notify() event 16 
on ifindex 7
Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_mlme_notify() MLME 
notification Deauthenticate(39)
Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_deauthenticate_event()
Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_mlme_notify() MLME 
notification Disconnect(48)
Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_disconnect_event()
Nov 25 09:09:54 iwd[16256]: Received Deauthentication event, reason: 4, 
from_ap: false
Nov 25 09:09:54 kernel: wlan0: Connection to AP 00:00:00:00:00:00 lost

Other times, the above logs are preceded by this:

Nov 26 00:25:25 kernel: ath10k_pci 0000:02:00.0: failed to flush sta txq 
(sta ca:55:b8:7a:91:4b skip 0 ar-state 1): 0

Note, the above logs are with your patches applied. Maybe this is a 
separate issue? Or do you think its related?

Thanks,

James

>
> V3:
>    - Initialize empty to true to fix smatch error
>
> V2:
>    - Add Closes tag
>    - Use atomic instead of spinlock for per sta pending frame counter
>    - Call ath10k_htt_tx_sta_dec_pending within rcu
>    - Rename pending_per_queue[] to num_pending_per_queue[]
>
> Remi Pommarel (2):
>    wifi: ath10k: Implement ieee80211 flush_sta callback
>    wifi: ath10k: Flush only requested txq in ath10k_flush()
>
>   drivers/net/wireless/ath/ath10k/core.h   |  2 +
>   drivers/net/wireless/ath/ath10k/htt.h    | 11 +++-
>   drivers/net/wireless/ath/ath10k/htt_tx.c | 49 +++++++++++++++-
>   drivers/net/wireless/ath/ath10k/mac.c    | 75 ++++++++++++++++++++----
>   drivers/net/wireless/ath/ath10k/txrx.c   | 11 ++--
>   5 files changed, 127 insertions(+), 21 deletions(-)
>

