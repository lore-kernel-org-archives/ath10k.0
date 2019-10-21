Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMYF6-0002YG-LO
 for ath10k@lists.infradead.org; Mon, 21 Oct 2019 14:01:06 +0000
Subject: Re: WARNING at net/mac80211/sta_info.c:1057
 (__sta_info_destroy_part2())
References: <87lfuuln5n.fsf@tynnyri.adurom.net>
 <1571584320-29816-1-git-send-email-pozega.tomislav@gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <073b0ffb-187b-659e-0967-23ae44c5c660@candelatech.com>
Date: Mon, 21 Oct 2019 07:01:00 -0700
MIME-Version: 1.0
In-Reply-To: <1571584320-29816-1-git-send-email-pozega.tomislav@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?UTF-8?Q?Tomislav_Po=c5=beega?= <pozega.tomislav@gmail.com>, kvalo@codeaurora.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, johannes@sipsolutions.net, torvalds@linux-foundation.org, davem@davemloft.net



On 10/20/2019 08:12 AM, Tomislav Po=9Eega wrote:
>> -11 is -EAGAIN which would mean that the HTC credits have run out some
>>  reason for the WMI command:
>>
>> if (ep->tx_credits < credits) {
>>         ath10k_dbg(ar, ATH10K_DBG_HTC,
>>                 "htc insufficient credits ep %d required %d available %d=
\n",
>>                 eid, credits, ep->tx_credits);
>>         spin_unlock_bh(&htc->tx_lock);
>>         ret =3D -EAGAIN;
>>         goto err_pull;
>> }
>>
>> Credits can run out, for example, if there's a lot of WMI command/event
>> activity and are not returned during the 3s wait, firmware crashed or
>> problems with the PCI bus.
>
> Hi
>
> Can this occur if the target memory is not properly allocated?

I have only seen this on wave-1 cards, and it is usually paired with situat=
ions
where the wave-1 stops doing WMI related interrupts properly as best as I c=
an
understand.  If I force the firmware to poll instead of waiting for irqs, t=
hen
WMI communication will work for a while...I have not implemented that on the
driver side though, so I still see these WMI timeout issues.

Thanks,
Ben

-- =

Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
