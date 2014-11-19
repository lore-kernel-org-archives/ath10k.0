Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xqu0F-0004xE-2H
 for ath10k@lists.infradead.org; Wed, 19 Nov 2014 01:24:16 +0000
Received: by mail-qc0-f174.google.com with SMTP id c9so8616051qcz.5
 for <ath10k@lists.infradead.org>; Tue, 18 Nov 2014 17:23:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkdZ52GKaGzKL_NU8TD5fCxxxiObj6RnBXk1Rz=426N7w@mail.gmail.com>
References: <CAD1M060Y+3r_-J12ZqT4TqddUf9tJHKCEPJ0DhFJ1sCiXimdVw@mail.gmail.com>
 <5461382B.6070607@candelatech.com>
 <CAD1M062xcGu2EJzxaXYQt5uHyDxHpEE+FDiPB4SBirXX5ePz_A@mail.gmail.com>
 <54613C13.9010008@candelatech.com>
 <CAD1M061wRo5MqmKYy8jw9fKpraA0DFJTh4k+QNzLkayLmBttfA@mail.gmail.com>
 <CA+BoTQk7idFbyYzLxKCgmSQ=zzQTraOJ-fy5_qhDpzkueQe8KQ@mail.gmail.com>
 <CAD1M063n=WGeQRJKycvWYGMZRFN4gabM56dgeX_4tf8W8hyUKA@mail.gmail.com>
 <CA+BoTQkfPJp4tg8eR4OJDs2Cf_s0x36QYD-Yq6fTQ41c1jm6TA@mail.gmail.com>
 <CAD1M0638VrB_hAqAn-H-02cjF6ivQzFBwtqs02BxgzLRdpCGsg@mail.gmail.com>
 <CA+BoTQkdZ52GKaGzKL_NU8TD5fCxxxiObj6RnBXk1Rz=426N7w@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Tue, 18 Nov 2014 17:23:26 -0800
Message-ID: <CAD1M062FNiiAD=Q6zGX8ooSfrQTj8gi_1oDSdEPjAQsaNPrjEw@mail.gmail.com>
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

On Mon, Nov 17, 2014 at 10:56 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> You can get super sure and take a look in dmesg/syslog to verify if
> ath10k's wlan interface is in promisc mode or not. I guess it's not
> though.
It seems that there's a "vdev 0". I'll look into hacking this out
later when I get some more time, though it seems that whenever a
station is associated with an AP, a vdev is always created.

>> ...
>> I tried not setting
>> the confused flag when the issue was hit, but eventually a kernel
>> panic would occur.
>
> I'm glad you like them.
>
> The result of not setting the confused flag in this case is pretty expected :-)
>
>> Something very interesting that I found was I only see this issue when
>> the radio's are behind a PCIe bridge. That is, I tested on two set's
>> of boards with the same CPU/structure, with the one difference that
>> there is no PCIe bridge on one. I am currently running an extended
>> test on the board without PCIe to see if it isn't an issue that will
>> manifest itself at a later time, but as of now, it's looking like
>> that's no the case. Do you have any thoughts on this?
>
> Hmm.. Perhaps there's some kind of race and the host main memory isn't
> updated in a timely fashion? In that case ath10k could try to, instead
> of immediatelly unmapping, keep on syncing dma to cpu and checking the
> MSDU_DONE bit for a few msecs (what an ugly workaround..) before it
> finally unmaps the frame.
>
> I wonder if that's a bug in ath10k's target device PCIe controller or
> the PCIe bridge?

While running the extended test, at about 7 hours of continuous
testing with the two boards without a PCIe bridge (configured as a
wireless bridge e.g. 4addr=on), the STAtion has a kernel panic that
seems to be caused by a double free or something similar. Log is
located here (glad I set 'debug' in kernel cmdline):
http://dpaste.com/1G77X7N (most interesting info located between times
[25684.512971] - [25684.587585]).

This is basically the same kernel oops I saw earlier when I disabled
the confused flag (occurs on skb_release_data). I've ruled out a SMP
issue as I can recreate this with nosmp. Because I see this issue on a
board without a PCIe bridge, I'm leaning towards the root cause of the
issue to maybe be in the ath10k's target device PCIe controller (irq's
being fired is what lead to this code path).

When I get some time later, I'll try that workaround, though I don't
think that's the "right" way to fix this problem.

- Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
