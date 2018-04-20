Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9VOJ-000879-9q
 for ath10k@lists.infradead.org; Fri, 20 Apr 2018 12:43:53 +0000
MIME-Version: 1.0
Date: Fri, 20 Apr 2018 18:13:39 +0530
From: govinds@codeaurora.org
Subject: Re: [PATCH v2 4/4] ath10k: Enable sta idle power save
In-Reply-To: <5AD9A1DF.6060007@broadcom.com>
References: <1523966821-21903-1-git-send-email-pillair@codeaurora.org>
 <1523966821-21903-5-git-send-email-pillair@codeaurora.org>
 <946e582c-2438-872b-eec8-25d9dcb994d9@dd-wrt.com>
 <7a06a34a5fcb97e07a8d79b4d689e781@codeaurora.org>
 <87604oodt4.fsf@kamboji.qca.qualcomm.com>
 <a7dd1b94951725c61034f5be6744b725@codeaurora.org>
 <8736zrjgq6.fsf@kamboji.qca.qualcomm.com>
 <c48c1bae-04c9-55d0-fdb9-d9ae8f7cb843@dd-wrt.com>
 <5AD9A1DF.6060007@broadcom.com>
Message-ID: <0c70fb177d5ca9be7b81384b06d60949@codeaurora.org>
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
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, pillair@codeaurora.org, Kalle Valo <kvalo@codeaurora.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

On 2018-04-20 13:46, Arend van Spriel wrote:
> On 4/20/2018 9:21 AM, Sebastian Gottschall wrote:
>> 
>>>> Yes this is WIFI chip set level power-save(based on idleness) and 
>>>> not
>>>> related to protocol power save. FW will turn off/scale down the
>>>> resources(clock/rails) based on opportunity(when ever idle mode is
>>>> detected). This power save is mostly done in disconnected state. I 
>>>> am
>>>> not really sure when framework/user-space triggers power-save
>>>> config(iw dev <devname> set power_save on/off). Then doing this from
>>>> user-space will be unnecessarily toggling this config or may not be
>>>> setting at disconnected state.
>>> I think that 'set power_save' commands affects struct
>>> ieee80211_bss_conf::ps parameter and I don't think it should be used 
>>> in
>>> this case. We already have ath10k_config_ps() for 802.11 level of 
>>> power
>>> saving.
>>> 
>>> Arend again proposed runtime-pm with which I'm not very familiar. But
>>> why would we want to disable this? Doesn't it make sense to have this
>>> feature always enabled to save power? wcn3990 is a chip for a mobile
>>> device anyway.
>> it might be made for mobile devices but who knows how it is used by 
>> the
>> market.

I guess having this enabled by default is safe as 
WMI_PDEV_PARAM_UNSUPPORTED
protects for those version which does not support this pdev param.


> Reading the explanation above it does not make sense to use
> runtime-pm. That would only come into play if the host driver would
> actually control the resources being turned off/scaled down.
> 
> So this is purely reducing power-consumption of the chip. However, it
> would be good to know the consequences in terms of responsiveness to
> firmware commands for instance when requesting a scan operation.

Exit latency is around 8-10 ms, so i guess this delta should be ok.

> Another thing to consider is to provide user-space with possibility to
> change this configuration (maybe through debugfs?).


In case any one wants to measure power no's with/without this config, 
just giving
provision to disable may be useful.


BR,
Govind

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
