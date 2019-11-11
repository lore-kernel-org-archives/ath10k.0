Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU5uU-00085I-Fz
 for ath10k@lists.infradead.org; Mon, 11 Nov 2019 09:22:59 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k:mac: disassoc dbg msg after return check
References: <20191111083040.16824-1-eduardoabinader@gmail.com>
 <87lfsmssny.fsf@kamboji.qca.qualcomm.com>
 <CAGoNHni94JihdS-XovcC_zZ9YkMhSeoupfsMn2ioh9koA0EwmQ@mail.gmail.com>
Date: Mon, 11 Nov 2019 11:22:50 +0200
In-Reply-To: <CAGoNHni94JihdS-XovcC_zZ9YkMhSeoupfsMn2ioh9koA0EwmQ@mail.gmail.com>
 (Eduardo Abinader's message of "Mon, 11 Nov 2019 10:14:27 +0100")
Message-ID: <87h83asr6d.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Eduardo Abinader <eduardoabinader@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Eduardo Abinader <eduardoabinader@gmail.com> writes:

> On Mon, 11 Nov 2019 at 09:50, Kalle Valo <kvalo@codeaurora.org> wrote:
>
>> Eduardo Abinader <eduardoabinader@gmail.com> writes:
>>
>> > Signed-off-by: Eduardo Abinader <eduardoabinader@gmail.com>
>>
>> No empty commit logs, please.
>>
>> > --- a/drivers/net/wireless/ath/ath10k/mac.c
>> > +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> > @@ -6786,13 +6786,13 @@ static int ath10k_sta_state(struct ieee80211_hw
>> *hw,
>> >               /*
>> >                * Disassociation.
>> >                */
>> > -             ath10k_dbg(ar, ATH10K_DBG_MAC, "mac sta %pM
>> disassociated\n",
>> > -                        sta->addr);
>> > -
>> >               ret = ath10k_station_disassoc(ar, vif, sta);
>> >               if (ret)
>> >                       ath10k_warn(ar, "failed to disassociate station:
>> %pM vdev %i: %i\n",
>> >                                   sta->addr, arvif->vdev_id, ret);
>> > +             else
>> > +                     ath10k_dbg(ar, ATH10K_DBG_MAC, "mac sta %pM
>> disassociated\n",
>> > +                        sta->addr);
>>
>> I don't understand, how is this better?
>>
>
> Either one msg or the other? I think a bit cleaner log.

I don't see it that way, the else branch makes the code harder to read
and for consistency it's better to always print the debug log.

> --000000000000b3b5a805970e8f8f
> Content-Type: text/html; charset="UTF-8"
> Content-Transfer-Encoding: quoted-printable

Please don't use HTML, I think the mailing lists drop all HTML mail
automatically.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
