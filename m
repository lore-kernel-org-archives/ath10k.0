Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLRBl-0006l3-JQ
 for ath10k@lists.infradead.org; Wed, 23 May 2018 10:40:14 +0000
Message-ID: <1527071997.3759.18.camel@sipsolutions.net>
Subject: Re: [PATCH] ath10k: add dynamic vlan support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 23 May 2018 12:39:57 +0200
In-Reply-To: <988f350d-a6eb-1733-4a2f-43a87053e96a@codeaurora.org>
References: <1524232653-22573-1-git-send-email-mpubbise@codeaurora.org>
 <87r2n5auvq.fsf@kamboji.qca.qualcomm.com>
 <aa04534d-9677-f42e-a239-b230093ef2f5@dd-wrt.com>
 <f8d6d13943ccac22f363d7d4f53d645c@codeaurora.org>
 <1526637270.3805.15.camel@sipsolutions.net>
 <59ff8201-fc1b-8579-d5a9-f4b08621f5ec@codeaurora.org>
 <1527069018.3759.15.camel@sipsolutions.net>
 <988f350d-a6eb-1733-4a2f-43a87053e96a@codeaurora.org>
Mime-Version: 1.0
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Wed, 2018-05-23 at 16:09 +0530, Manikanta Pubbisetty wrote:
> > > > > + * @IEEE80211_HW_SUPPORTS_SW_ENCRYPT: Device is capable of transmitting
> > > > > + *     frames encrypted in software, only valid when SW_CRYPTO_CONTROL
> > > > > + *     is enabled. Based on this flag, mac80211 can allow/disallow VLAN
> > > > > + *     operations in the BSS.
> > > > 
> > > > Based on the name and initial description, this sounds equivalent to
> > > > just turning off SW_CRYPTO_CONTROL. I think that's not the intent, but
> > > > would need some renaming.
> > > 
> > > I can rename it to something which is very specific to VLAN support on
> > > sw crypto controlled devices if that is okay.
> > 
> > I don't think that makes sense. If we split the capability of AP_VLAN
> > and AP_VLAN_FOR_4ADDR at the "root", then we don't need to play with all
> > these things. Yes, this is slightly awkward for userspace, and perhaps
> > with the interface combination checks, but I'd like you to look at that.
> > 
> 
> Makes sense, I had this thought to split the VLAN and 4-addr 
> functionality, but since we need to fiddle with userspace, I refrained.
> Anyways, I will check all the possibilities of splitting these 
> functionalities.

I'm not sure we really have to - it's likely that wpa_s/hostapd don't
check the capabilities?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
