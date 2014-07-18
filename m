Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X87Sp-0005Fu-JZ
 for ath10k@lists.infradead.org; Fri, 18 Jul 2014 12:40:40 +0000
Received: by mail-lb0-f170.google.com with SMTP id w7so1953683lbi.29
 for <ath10k@lists.infradead.org>; Fri, 18 Jul 2014 05:40:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871tti3l0t.fsf@kamboji.qca.qualcomm.com>
References: <1404992714-15690-1-git-send-email-janusz.dziedzic@tieto.com>
 <871tti3l0t.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 18 Jul 2014 14:40:15 +0200
Message-ID: <CALhHN=rwv1uVmrnErypGBTEu50JfmNSFFiHub2bZD4MBoQbpaQ@mail.gmail.com>
Subject: Re: [RFT/RFC 0/5] ath10k: handle/report A-MSDU as a skb list
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Denton Gentry <denton.gentry@gmail.com>

On 18 July 2014 14:32, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> This is prototype, how we can handle A-MSDU as a skb list in mac80211.
>> No changes in mac80211 reordering code required in such case, also we
>> don't need to build one big frame using memcpy ...
>>
>> With such prototype tid_agg_rx->reorder_buf[sn] will describe exactly
>> one MPDU (with included A-MSDU subframes if skb->next) and detection of
>> duplicated frames will work correctly. So, reordering should works
>> correctly.
>>
>> I tested this with A-MPDU and A-MSDU run together (A-MSDU frame up to
>> 10k) - TCP STA -> AP. I used ath10k STA with unlocked A-MSDU limit in
>> RC in firmware. Didn't notice any problems.
>
> So what are you exactly fixing here? It would be nice to get some
> background and motivations for the changes in the cover letter.
>
> Also we have so many reordering patches that I'm confused now. For
> example, how is this related to patch "ath10k: handle attention flags
> correctly when A-MSDU"?
>
We should skip this patchset, while we decide to change reordering
code in mac80211 instead of passing skb list.

ath10k: handle attention flags correctly when A-MSDU  is required
while fix generic FCS reporting issue.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
