Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XaFdC-0004Ju-FQ
 for ath10k@lists.infradead.org; Sat, 04 Oct 2014 03:03:39 +0000
Received: by mail-wg0-f47.google.com with SMTP id x13so2814208wgg.18
 for <ath10k@lists.infradead.org>; Fri, 03 Oct 2014 20:03:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkOJP64UBVW9XSs+b+k8yxa4PbDMnKceUtNZAg21VSbHw@mail.gmail.com>
References: <CAHqTa-2yz13WAgvXxJVYMXQ7fVqRtuQ8ABAC6vKv07=fne_YGw@mail.gmail.com>
 <CA+BoTQmeMNz2PvT9Si_smYqL24OBA+JX8fJORnp5hck0x7eP2g@mail.gmail.com>
 <CAHqTa-33hHnsQHw8HzW+OGXi33zVBphofKyynWv38f3f3tTQgQ@mail.gmail.com>
 <CA+BoTQkOJP64UBVW9XSs+b+k8yxa4PbDMnKceUtNZAg21VSbHw@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Fri, 3 Oct 2014 23:02:56 -0400
Message-ID: <CAHqTa-0botSY5pVZOevb1MBNnnYwFSZMsMRYF+4k8Se2bK1=QQ@mail.gmail.com>
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

On Fri, Oct 3, 2014 at 3:37 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 3 October 2014 08:39, Avery Pennarun <apenwarr@gmail.com> wrote:
>> On Fri, Oct 3, 2014 at 2:10 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>>> Was the Macbook Air disconnected cleanly on the AP?
>>
>> In my particular test case, I was actually already associated with the
>> AP while I was doing these steps.  I don't think that affects the
>> results, which means in this case that there is no question of being
>> uncleanly disconnected since I was not disconnected at all.
>
> But this kind of confirms that if there's a peer entry then ath10k AP
> will try to do powersave game with probe req / resp.

Yeah, I'm not at all surprised if it's a powersave game.

>>> There's a tx credit starvation bug which blocks wmi commands after
>>> disassoc+deauth frames are queued (via wmi as well) and aren't acked
>>> by station in which case wmi peer delete command times out and
>>> sta_state splats a calltrace in kernel logs. This effectively leaves
>>> firmware thinking the peer is still connected and it is never
>>> disconnected (you can expect spurious sta kickout events after an hour
>>> once that happens). This could explain why ath10k AP tries to play
>>> powersave with the Macbook Air.
>>
>> I think we previously ran into the tx credit starvation bug and
>> cherry-picked one of your patches to fix it.  So I don't think that's
>> the problem here.
>
> Tx starvation credit bug cannot be simply fixed in host. It needs
> firmware changes as well which aren't there. Perhaps this is actually
> what causes the problem? I recall my patches had a timeout on wmi mgmt
> tx. Wasn't it 2x beacon interval? That's the 200ms. Pcap suggests your
> beacon interval is 100ms.
>
> Can you look at ath10k logs if each wmi mgmt tx is sent immediately
> after wmi mgmt rx? Can you share the exact patch you cherry-picked?

Hmm, okay, you're right, I see the 2*beacon_interval delay in your patch.

0531 ath10k: fix wmi-htc tx credit starvation
0532 ath10k: wait for mgmt tx when flushing too
0533 ath10k: improve tx flushing

Exact patches are visible here:
https://gfiber.googlesource.com/buildroot/+/master/package/backports-custom/

Looks like none of these were ever applied to kvalo's tree.  They are
essential for avoiding some really serious problems we had in the
field (ie. beacons stop getting sent).

I see from looking back at those threads that you did have a comment
about it being unfixable without a firmware change.  Reducing the WMI
timeout to 1s could help (sort of), but would not fix the problem in
the current thread, which requires transmissions in well under 100ms.
How is anyone surviving without a fix?  The problem triggers
frequently.

>>> Or perhaps this is related to uAPSD? Do you have it enabled in
>>> hostapd? Is Macbook Air associating with uAPSD enabled?
>>
>> We tried enabling uAPSD but it caused lots of problems so we turned it
>> off again.
>
> I'm asking since it calls per-peer powersave wmi command a few times
> (wmi_ap_ps_peer_cmd).

I could look up what problems uAPSD caused.  ISTR it was random driver
or firmware crashes on our setup, and we didn't have time to debug
further since it's an optional feature.

Thanks!

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
