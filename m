Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkEoI-00009B-G4
 for ath10k@lists.infradead.org; Mon, 20 Apr 2015 16:44:39 +0000
Message-ID: <55352CDF.6090901@candelatech.com>
Date: Mon, 20 Apr 2015 09:44:15 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Set vht transmission parameters using radiotap header
References: <20150418125132.Horde.n2KkWFDIVCdVMjc0WZqgldA@webmail.ugent.be>
 <CA+BoTQ=0MM0=wiR9G3g03t3tTCNFMh+Yw4aq2vTnoCr_P4wyuQ@mail.gmail.com>
In-Reply-To: <CA+BoTQ=0MM0=wiR9G3g03t3tTCNFMh+Yw4aq2vTnoCr_P4wyuQ@mail.gmail.com>
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
Cc: Louis Desfossez <Louis.Desfossez@ugent.be>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 04/19/2015 10:43 PM, Michal Kazior wrote:
> On 18 April 2015 at 12:51, Louis Desfossez <Louis.Desfossez@ugent.be> wrote:
>> Using the click modular router project we are trying to inject packets on an
>> Atheros QCA988x in monitor mode. Wireless parameters (nss, mcs, channel,
>> guard interval, channel width and tx power) are set in the radiotap header.
>> Which parameters can currently be read by the ath10k/mac80211 driver and be
>> set for transmission (ie. IEEE_RADIOTAP_DBM_TX_POWER,
>> IEEE_RADIOTAP_CHANNEL)?
>> Is there a possibility to handle the vht information (ie.
>> IEEE80211_RADIOTAP_VHT_MCS, IEEE80211_RADIOTAP_VHT_NSS)?
> 
> By the looks of ieee80211_parse_tx_radiotap() it seems that most
> radiotap is ignored on Tx path.
> 
> Anyway I hope you're aware upstream ath10k doesn't support packet injection.
> 
> Also due to firmware design there's no way to specify Tx rate for each
> frame. Using per-vdev fixed rate param would require really nasty
> hacks in driver. I'm not even sure if it's possible with official
> firmware to change mgmt and multicast tx rate (I think CT firmware
> from Ben has that). I guess using `iw wlanX set bitrates` explicitly
> would be better and cleaner - but first you need to get injection to
> work at all.

My CT firmware does allow hard-coding the unicast, broadcast, and control-packet
rates..but it is not a per-pkt or even per-peer setting.  I could probably make
it per-peer easily enough if someone cared.

I think it would take a good deal of firmware changes to allow per-pkt
rate-control from the host, but it seems the firmware was at least originally
designed to support this option.

I personally would love to move all rate-ctrl out of firmware and onto
the host, but it is probably not something I would try myself, and currently
there is no good way to share firmware development effort.

An interim solution might be to hack my CT firmware to return more tx-status
info so that a host based rate-ctrl could do frequent updates to the
firmware's rate-ctrl settings to sort of fake host-based rate-ctrl.

I might attempt those firmware changes if someone else wanted to handle
the bulk of the driver work.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
