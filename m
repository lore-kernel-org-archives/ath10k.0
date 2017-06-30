Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQnF4-0001qs-1c
 for ath10k@lists.infradead.org; Fri, 30 Jun 2017 04:09:16 +0000
Received: by mail-qt0-x232.google.com with SMTP id i2so90119309qta.3
 for <ath10k@lists.infradead.org>; Thu, 29 Jun 2017 21:08:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d4a7c59c-85f0-bbfb-84ce-ce0a6c7bf483@bowerswilkins.com>
References: <CAOiRWuXVO5ACHCX6ZHy_rP1oA7+sgnnvtOTydHqUJWHjpBZTZw@mail.gmail.com>
 <d4a7c59c-85f0-bbfb-84ce-ce0a6c7bf483@bowerswilkins.com>
From: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Date: Fri, 30 Jun 2017 12:08:51 +0800
Message-ID: <CAEFj986gxesLcSaeVH9Yfwre7cTB0uqSzHBMpZKSNbmgQFcmhA@mail.gmail.com>
Subject: Re: Is using 802.11s with DFS possible?
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
To: Peter Oh <peter.oh@bowerswilkins.com>
Cc: Zach Sherin <zach@netblazr.com>, benjamin@sipsolutions.net, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Simon Wunderlich <sw@simonwunderlich.de>

On Fri, Jun 30, 2017 at 1:53 AM, Peter Oh <peter.oh@bowerswilkins.com> wrote:
>
>
> On 06/28/2017 06:54 PM, Zach Sherin wrote:
>>
>> Hi all,
>>
>> I've been running some experiments in LEDE thanks to your help many
>> months ago, and I want to use DFS frequencies with my mesh network.
>> Does ath10k currently support this or am I up a creek? My tests show
>> that I can use DFS frequencies with AP mode but have always failed
>> when I use them in a mesh, such that the interface won't even start.
>>
>> Any suggestions?
>
> As far as I know, no DFS channels enabled in mesh mode at this moment.
> To support DFS channels in mesh mode, wpa_supplicant and mac80211 changes
> are required.
>

https://www.spinics.net/lists/linux-wireless/msg162307.html
Simon and Benjamin have submitted the above patches and some of them
has upstream to mac80211-next.

Perhaps, Simon and Benjamin can comment on this.

----
Chun-Yeow

>> Thanks for your time,
>> Zach
>>
>> PS: I'm using an Archer C7 v2, latest stable LEDE build with the
>> built-in ath10k firmware. Meshing on channel 36 is fine, but anything
>> that requires DFS fails.
>>
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
