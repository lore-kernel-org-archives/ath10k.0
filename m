Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y19dV-0006w6-NR
 for ath10k@lists.infradead.org; Wed, 17 Dec 2014 08:07:10 +0000
Received: by mail-ig0-f181.google.com with SMTP id l13so9147931iga.2
 for <ath10k@lists.infradead.org>; Wed, 17 Dec 2014 00:06:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1418759663.1943.7.camel@sipsolutions.net>
References: <1418720165-19810-1-git-send-email-janusz.dziedzic@tieto.com>
 <1418759663.1943.7.camel@sipsolutions.net>
Date: Wed, 17 Dec 2014 09:06:41 +0100
Message-ID: <CALhHN=pmWR4jCeXtTiK4RwC5KP7i+29sO1mtftD2k1qLGg6ytw@mail.gmail.com>
Subject: Re: [PATCH] mac80211: notify NSS changed when IBSS and HT
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 16 December 2014 at 20:54, Johannes Berg <johannes@sipsolutions.net> wrote:
> On Tue, 2014-12-16 at 09:56 +0100, Janusz Dziedzic wrote:
>
>>                       drv_sta_rc_update(local, sdata, &sta->sta,
>>                                         IEEE80211_RC_SUPP_RATES_CHANGED);
>> +                     /* Force rx_nss recalculation */
>> +                     sta->sta.rx_nss = 0;
>>                       rate_control_rate_init(sta);
>> +                     if (rx_nss != sta->sta.rx_nss)
>> +                             drv_sta_rc_update(local, sdata, &sta->sta,
>> +                                               IEEE80211_RC_NSS_CHANGED);
>
> Seems to me you should consolidate those two drv_sta_rc_update() calls
> and just make the flags dependent on the NSS change?
>
Will send v2.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
