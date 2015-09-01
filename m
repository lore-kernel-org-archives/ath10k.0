Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x22c.google.com ([2607:f8b0:4001:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWbqX-0002Nk-Ok
 for ath10k@lists.infradead.org; Tue, 01 Sep 2015 03:02:54 +0000
Received: by iod35 with SMTP id 35so50861925iod.3
 for <ath10k@lists.infradead.org>; Mon, 31 Aug 2015 20:02:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150829222531.GA8604@localhost>
References: <1440673024-13696-1-git-send-email-me@bobcopeland.com>
 <1440673024-13696-4-git-send-email-me@bobcopeland.com>
 <CAKf6xpsaygeFJyX_LKH2r82P2Xvih1GGBTAspKtCsZbBcVO9Ug@mail.gmail.com>
 <20150829222531.GA8604@localhost>
Date: Mon, 31 Aug 2015 23:02:32 -0400
Message-ID: <CAKf6xptqMZiqSyr3mOH_uotxa=JtHmtm2STBfDxdK5MBThaixA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ath10k: implement mesh support
From: Jason Andryuk <jandryuk@gmail.com>
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
To: Bob Copeland <me@bobcopeland.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Sat, Aug 29, 2015 at 6:25 PM, Bob Copeland <me@bobcopeland.com> wrote:
> On Sat, Aug 29, 2015 at 01:11:03PM -0400, Jason Andryuk wrote:
>> Is there a reason to hide rawmode behind a modparam, or should the
>> modparam just be removed?  Just let the driver set
>> ATH10K_FLAG_RAW_MODE when ATH10K_FW_FEATURE_RAW_MODE_SUPPORT is
>> detected?
>
> Yes: you don't want to enable raw mode TX / RX decap in the normal
> case because it's fairly inefficient compared to "native" wifi mode,
> according to my understanding.  The latter doesn't support mesh framing
> however.
>
>> Does struct ieee80211_iface_limit need to be conditional on firmware
>> support as well or does interface_modes (below) gate use of
>> MESH_POINT?
>
> If you advertise a combination that isn't supported by interface modes,
> I believe you'll get a kernel warning when the wiphy is registered.
>
>>
>> > @@ -6998,7 +7020,8 @@ int ath10k_mac_register(struct ath10k *ar)
>> >
>> >         ar->hw->wiphy->interface_modes =
>> >                 BIT(NL80211_IFTYPE_STATION) |
>> > -               BIT(NL80211_IFTYPE_AP);
>> > +               BIT(NL80211_IFTYPE_AP) |
>> > +               BIT(NL80211_IFTYPE_MESH_POINT);
>>
>> Set BIT(NL80211_IFTYPE_MESH_POINT) conditionally if ATH10K_FLAG_RAW_MODE is set?
>
> Yes, this was discussed on the ath10k mailing list and I'll probably do
> it in a follow-up patch.  It is a little messy because it will involve
> casting away a const somewhere.

Great.  Glad you've already considered all these things.

-Jason

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
