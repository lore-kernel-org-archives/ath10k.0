Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWp8L-0007U3-Od
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 16:09:38 +0000
Message-ID: <5422ECAA.6050600@candelatech.com>
Date: Wed, 24 Sep 2014 09:09:14 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: use configured nss instead of max nss.
References: <1411426820-4047-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQn9sECMNZsxQpB4i3wHPxfVL+LXq9=2GBd-opH6+9TD=A@mail.gmail.com>
 <5421A44C.8080307@candelatech.com>
 <CA+BoTQ=mry3tPD-LK+gFD2bC6RU0KvY6LC9=FOAGTLi_1rzUog@mail.gmail.com>
In-Reply-To: <CA+BoTQ=mry3tPD-LK+gFD2bC6RU0KvY6LC9=FOAGTLi_1rzUog@mail.gmail.com>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/24/2014 12:09 AM, Michal Kazior wrote:
> On 23 September 2014 18:48, Ben Greear <greearb@candelatech.com> wrote:
>> On 09/23/2014 01:59 AM, Michal Kazior wrote:
>>> On 23 September 2014 01:00,  <greearb@candelatech.com> wrote:
>>>> From: Ben Greear <greearb@candelatech.com>
> [...]
>>>> @@ -4086,6 +4086,10 @@ ath10k_default_bitrate_mask(struct ath10k *ar,
>>>>         u32 legacy = 0x00ff;
>>>>         u8 ht = 0xff, i;
>>>>         u16 vht = 0x3ff;
>>>> +       u16 nrf = ar->num_rf_chains;
>>>> +
>>>> +       if (ar->cfg_tx_chainmask)
>>>> +               nrf = get_nss_from_chainmask(ar->cfg_tx_chainmask);
> [...]
>>> I think it might be a good idea to convey the limitation of tx/rx
>>> chainmask to the user: you can't change the tx/rx chainmask on the fly
>>> easily (while connected/have associated stations). Or do you plan to
>>> schedule peer reassoc in __ath10k_set_antenna() in a follow up
>>> patch(es) later?
>>
>> My user-space tools assume you have to re-connect (requested from user-space)
>> after changing the chainmask.  I was under the impression that this
>> is how ath9k works, though I could be wrong.
> 
> ath9k doesn't have firmware and it doesn't have a blackbox rate
> control so maybe it doesn't need to worry about this as much as ath10k
> needs to.
> 
> But then this is not something you normally use except some very
> specific use cases so I think it might not be worth the hassle to
> implement full-blown reconfig after chainmask is updated.

See this in net/mac80211/cfg.c:

static int ieee80211_set_antenna(struct wiphy *wiphy, u32 tx_ant, u32 rx_ant)
{
	struct ieee80211_local *local = wiphy_priv(wiphy);

	if (local->started)
		return -EOPNOTSUPP;

	return drv_set_antenna(local, tx_ant, rx_ant);
}


It ensures there are no active vdevs when this change is made, so
you should not have to worry about block-ack or anything similar.


> But it's still probably a good idea to comment the quoted code chunk
> above explaining why nrf is overriden by chainmask (i.e. due to
> firmware rate control issues, right?).

I am not certain it is a bug in the firmware.  The driver should not configure
nss incorrectly as it was doing previous to my recent patches.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
