Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cc5Q6-00084h-Pm
 for ath10k@lists.infradead.org; Fri, 10 Feb 2017 07:15:05 +0000
Received: by mail-wm0-x243.google.com with SMTP id u63so6051532wmu.2
 for <ath10k@lists.infradead.org>; Thu, 09 Feb 2017 23:14:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87tw82il32.fsf@kamboji.qca.qualcomm.com>
References: <1486030773-30600-1-git-send-email-amadeusz.slawinski@tieto.com>
 <CAJ-VmonrHpS3MArM9ohHgLvb6xspP_gnVVeJWA9F-pjUpJ+LZA@mail.gmail.com>
 <87y3xi4b28.fsf@qca.qualcomm.com> <5899DDD7.7000605@candelatech.com>
 <87tw82il32.fsf@kamboji.qca.qualcomm.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 9 Feb 2017 23:14:40 -0800
Message-ID: <CAJ-Vmom7k3Tsgs8tRHQppmL7XxADS3V24AGOQY5QgkrSgr5Qzg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ath10k: remove ath10k_vif_to_arvif()
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeusz.slawinski@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ben Greear <greearb@candelatech.com>

On 9 February 2017 at 23:03, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 02/07/2017 01:14 AM, Valo, Kalle wrote:
>>> Adrian Chadd <adrian@freebsd.org> writes:
>>>
>>>> Removing this method makes the diff to FreeBSD larger, as "vif" in
>>>> FreeBSD is a different pointer.
>>>>
>>>> (Yes, I have ath10k on freebsd working and I'd like to find a way to
>>>> reduce the diff moving forward.)
>>>
>>> I don't like this "(void *) vif->drv_priv" style that much either but
>>> apparently it's commonly used in Linux wireless code and already parts
>>> of ath10k. So this patch just unifies the coding style.
>>
>> Surely the code compiles to the same thing, so why add a patch that
>> makes it more difficult for Adrian and makes the code no easier to read
>> for the rest of us?
>
> Because that's the coding style used already in Linux. It's great to see
> that parts of ath10k can be used also in other systems but in principle
> I'm not very fond of the idea starting to reject valid upstream patches
> because of driver forks.
>
> I think backports project is doing it right, it's not limiting upstream
> development in any way and handles all the API changes internally. Maybe
> FreeBSD could do something similar?

I tried, but ... well, imagine renaming vif->drv_priv to something
else. That's what you're suggesting. :-) You can do it with
coccinelle, but not via just backports API implementations. I'm a big
fan of light weight accessor APIs for the same reason.

(Since FreeBSD doesn't have that pointer in ieee80211vap, it's done a
different way.)

If you could convert other direct uses over to ath10k_vif_to_arvif()
then that'd make me happier. If not, it's fine, when I push this into
freebsd and fast-forward commits, I'll have to just maintain it.

For what it's worth - the linux skb accessors are the same. If there
were accessors for the skb data / len fields (like we do for mbufs)
then porting the code would've involved about 5,000 less changed
lines.



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
