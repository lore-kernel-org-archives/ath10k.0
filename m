Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZwXG-0005sH-Gw
 for ath10k@lists.infradead.org; Fri, 03 Oct 2014 06:40:15 +0000
Received: by mail-wg0-f50.google.com with SMTP id a1so682343wgh.9
 for <ath10k@lists.infradead.org>; Thu, 02 Oct 2014 23:39:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmeMNz2PvT9Si_smYqL24OBA+JX8fJORnp5hck0x7eP2g@mail.gmail.com>
References: <CAHqTa-2yz13WAgvXxJVYMXQ7fVqRtuQ8ABAC6vKv07=fne_YGw@mail.gmail.com>
 <CA+BoTQmeMNz2PvT9Si_smYqL24OBA+JX8fJORnp5hck0x7eP2g@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Fri, 3 Oct 2014 02:39:32 -0400
Message-ID: <CAHqTa-33hHnsQHw8HzW+OGXi33zVBphofKyynWv38f3f3tTQgQ@mail.gmail.com>
Subject: Re: Probe Response packets sometimes delayed by 200ms
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
Cc: ath10k <ath10k@lists.infradead.org>

On Fri, Oct 3, 2014 at 2:10 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 3 October 2014 07:48, Avery Pennarun <apenwarr@gmail.com> wrote:
>> Steps:
>> - start capturing packets, either on the ath10k AP itself or a
>> secondary monitor system
>> - on the Macbook Air (which has joined your SSID at least once
>> before), open and close the wifi dropdown menu a few times.  (May also
>> happen with clients other than Macbook Air; not heavily tested.)
>
> Was the Macbook Air disconnected cleanly on the AP?

In my particular test case, I was actually already associated with the
AP while I was doing these steps.  I don't think that affects the
results, which means in this case that there is no question of being
uncleanly disconnected since I was not disconnected at all.

> There's a tx credit starvation bug which blocks wmi commands after
> disassoc+deauth frames are queued (via wmi as well) and aren't acked
> by station in which case wmi peer delete command times out and
> sta_state splats a calltrace in kernel logs. This effectively leaves
> firmware thinking the peer is still connected and it is never
> disconnected (you can expect spurious sta kickout events after an hour
> once that happens). This could explain why ath10k AP tries to play
> powersave with the Macbook Air.

I think we previously ran into the tx credit starvation bug and
cherry-picked one of your patches to fix it.  So I don't think that's
the problem here.

> Or perhaps this is related to uAPSD? Do you have it enabled in
> hostapd? Is Macbook Air associating with uAPSD enabled?

We tried enabling uAPSD but it caused lots of problems so we turned it
off again.

> Or maybe firmware expects host driver should reset some ap-sta
> powersave related settings before deleting peer entries.

I'm not sure it's deleting peer entries, but my guess is that the host
driver needs to reset some power save related setting, yeah.  I looked
through the ath10k driver and wasn't really sure where to look
however.  I found some global per-vdev power save mode settings, but
not any per-STA ones.

Thanks!

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
