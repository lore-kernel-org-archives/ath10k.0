Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-f170.google.com ([209.85.216.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XqXUA-0000DU-DJ
 for ath10k@lists.infradead.org; Tue, 18 Nov 2014 01:21:39 +0000
Received: by mail-qc0-f170.google.com with SMTP id x3so2655748qcv.29
 for <ath10k@lists.infradead.org>; Mon, 17 Nov 2014 17:21:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkfPJp4tg8eR4OJDs2Cf_s0x36QYD-Yq6fTQ41c1jm6TA@mail.gmail.com>
References: <CAD1M060Y+3r_-J12ZqT4TqddUf9tJHKCEPJ0DhFJ1sCiXimdVw@mail.gmail.com>
 <5461382B.6070607@candelatech.com>
 <CAD1M062xcGu2EJzxaXYQt5uHyDxHpEE+FDiPB4SBirXX5ePz_A@mail.gmail.com>
 <54613C13.9010008@candelatech.com>
 <CAD1M061wRo5MqmKYy8jw9fKpraA0DFJTh4k+QNzLkayLmBttfA@mail.gmail.com>
 <CA+BoTQk7idFbyYzLxKCgmSQ=zzQTraOJ-fy5_qhDpzkueQe8KQ@mail.gmail.com>
 <CAD1M063n=WGeQRJKycvWYGMZRFN4gabM56dgeX_4tf8W8hyUKA@mail.gmail.com>
 <CA+BoTQkfPJp4tg8eR4OJDs2Cf_s0x36QYD-Yq6fTQ41c1jm6TA@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Mon, 17 Nov 2014 17:20:45 -0800
Message-ID: <CAD1M0638VrB_hAqAn-H-02cjF6ivQzFBwtqs02BxgzLRdpCGsg@mail.gmail.com>
Subject: Re: htt rx stopped. cannot recover
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
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, Nov 14, 2014 at 12:31 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> I've used ath10k AP in a bridge many times and haven't seen this issue yet.

I just found that I can reproduce the problem passing traffic through
from AP <-wifi-> STA with no bridging. The reason I didn't see the
problem before is that it takes considerably longer to reproduce and I
wasn't necessarily looking for it (65 seconds vs 5 seconds).

> Putting an interface into a bridge enables promiscuous mode on it. In
> ath10k this is handled by creating a monitor vdev to implicitly
> influence Rx filters so that hw/fw pass everything up to host. I
> suspect your RF environment may contain particular traffic patterns
> which trigger the problem within firmware code related to monitor
> vdev.
>
> You could try hacking up ath10k to not create/start monitor vdev and
> see if you can still reproduce the problem. Keep in mind bridging will
> be crippled in some cases since firmware won't deliver some frames to
> ath10k.

I've actually been using attenuators for these tests, a little more
than 60dB on each chain and as I mentioned above, I don't believe it's
a vdev issue due to the fact that I can reproduce this without
bridging (which doesn't put the radio into promiscuous mode and thus
doesn't create a monitor vdev, correct?).

> Hmm.. Now that I think about it, after the recent Rx rework it might
> be possible to circumvent the problem. ath10k uses very little data
> from Rx indication event and instead Rx descriptor is used for most
> things. Popping function would need some changes so that it can back
> off safely if a frame buffer isn't ready. ath10k would probably need
> to poll for Rx too.

I saw those patches and I liked what I saw. When I tested with them in
place, I found it failed in the same 'test' of checking for MSDU_DONE
flag (duh, just wanted to make that clear, haha). I tried not setting
the confused flag when the issue was hit, but eventually a kernel
panic would occur.

Something very interesting that I found was I only see this issue when
the radio's are behind a PCIe bridge. That is, I tested on two set's
of boards with the same CPU/structure, with the one difference that
there is no PCIe bridge on one. I am currently running an extended
test on the board without PCIe to see if it isn't an issue that will
manifest itself at a later time, but as of now, it's looking like
that's no the case. Do you have any thoughts on this?

- Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
