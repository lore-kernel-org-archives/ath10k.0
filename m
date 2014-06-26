Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22b.google.com ([2607:f8b0:400c:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0JTa-0002qb-Lk
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 23:53:11 +0000
Received: by mail-ve0-f171.google.com with SMTP id jz11so4525445veb.16
 for <ath10k@lists.infradead.org>; Thu, 26 Jun 2014 16:52:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABnBrYWEN+KL5vHGggi_b4HZ6gd15yqpna0WBNo0p6i76y9uWw@mail.gmail.com>
References: <CABnBrYV8-UY56eEYn7FYEXrNU_SMeMOBXa1fwH9ugOHf_xAq0A@mail.gmail.com>
 <CA+BoTQnOBaB0QY6_AtkL6La=aw7gFxgqy_4OLDccuHe7f75mNg@mail.gmail.com>
 <CABnBrYWEN+KL5vHGggi_b4HZ6gd15yqpna0WBNo0p6i76y9uWw@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Thu, 26 Jun 2014 19:52:24 -0400
Message-ID: <CAHqTa-2zzSb-Yk_yM-O8R9-Z=gWJ471A6qX3arvUDO__3FtRtQ@mail.gmail.com>
Subject: Re: No reorder buffer?
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
To: Denton Gentry <denton.gentry@gmail.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Jun 26, 2014 at 6:27 PM, Denton Gentry <denton.gentry@gmail.com> wrote:
> On Thu, Jun 26, 2014 at 3:28 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>> On 24 June 2014 16:47, Denton Gentry <denton.gentry@gmail.com> wrote:
>>> I'm bridging ath10k to Ethernet, gathering pcaps on another ath10k
>>> system in monitor mode and on the Ethernet system which is receiving
>>> the packets. I see packets being delivered out of order to the
>>> Ethernet system. So far as I can tell, any packet which has to be
>>> re-sent on the Wifi link will be delivered out of order to Ethernet.
>>
>> As I've mentioned in my other mail - perhaps reordering is disabled in
>> firmware under some circumstances.
>>
>> My suspicion is monitor vdev may be involved. It is created in
>> firmware when you set ath10k interface into promisc mode (bridging
>> implies that; most sniffers set promisc mode too unless told to not
>> to, e.g. tcpdump -p).
>>
>> Can you somehow verify if you observe the reordering problem without
>> bridging with ethernet (e.g. run traffic to AP w/ bridging and w/o
>> bridging) ? If it's too much work then forget it :-)
>
> Running an iperf server on my AP, to take bridging out of the picture:
> iperf -s -w 1M

Note that our version of hostapd (and possibly all versions of
hostapd) automatically creates a monitor interface alongside the wlan
interface.  From what I've seen in the code, this is entirely for
legacy reasons (??) and it doesn't actually use the monitor interface
anymore for anything.  So we could probably chop out the code that
creates it.  I suspect if we don't, it will be in monitor mode even
when bridging is not active.

For this test, I guess we could also just manually delete the monitor
interface after starting hostapd.  But I'm unclear on whether the
firmware would switch reordering back on in that case.

Or maybe using a separate monitor-mode interface doesn't trigger this
with the main wlan0 interface, but I'm guessing that's not the case.

(Separately, it makes me a bit sad that enabling monitor mode changes
the behaviour of the wifi.  It defeats part of the purpose of monitor
mode.)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
