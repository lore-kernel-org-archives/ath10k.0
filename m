Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVh35-0008Sj-Hl
 for ath10k@lists.infradead.org; Wed, 20 Jun 2018 17:37:44 +0000
Subject: Re: [PATCH] ath10k: Don't allow tx logic when state is not ON.
References: <1529506583-20204-1-git-send-email-greearb@candelatech.com>
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Message-ID: <9ba64928-a73b-0fe6-9586-65929ca87013@codeaurora.org>
Date: Wed, 20 Jun 2018 23:07:23 +0530
MIME-Version: 1.0
In-Reply-To: <1529506583-20204-1-git-send-email-greearb@candelatech.com>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: greearb@candelatech.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, kvalo@codeaurora.org


> From: Ben Greear <greearb@candelatech.com>
>
> This is against the 4.16 kernel, likely applies to later kernels
> as well.  Firmware is beta ath10k-ct firmware for 9984 NIC.  The
> patch is not firmware or chipset specific.
>
> When firmware crashes, packets can still be sent from the
> mac80211 stack, and that can cause crashes in the ath10k
> tx path.

Yes, this is what I had observed and explained in the RFC patch which I 
have sent some time back. In my case the device never comes up and the 
entire system crashes; I hope you have observed the same behavior.

> After adding this patch, I saw cases where the tx path was
> called in state ATH10K_STATE_RESTARTED.
>
> I have not tested the tx_64 path, but assume it has similar
> issues, so same patch was added to it.

This case should not be dealt in ath10k, rather we should make sure 
packets does not reach the driver during hardware restart after the 
firmware crash.
Can you please try the RFC patch and see if it fixes the issue? I am 
working on the patch and probably send it out after doing some testing 
and cleanup.

https://patchwork.kernel.org/patch/10411967/

Thanks,
Manikanta

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
