Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-f48.google.com ([209.85.192.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xt375-0002E2-ME
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 23:32:12 +0000
Received: by mail-qg0-f48.google.com with SMTP id q107so7637841qgd.35
 for <ath10k@lists.infradead.org>; Mon, 24 Nov 2014 15:31:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQn2xi3ssEn+HGc_5pgdb5Xrw4SPqBD4-QaWT1d9LqieMA@mail.gmail.com>
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
 <CAD1M062FNiiAD=Q6zGX8ooSfrQTj8gi_1oDSdEPjAQsaNPrjEw@mail.gmail.com>
 <CA+BoTQn2xi3ssEn+HGc_5pgdb5Xrw4SPqBD4-QaWT1d9LqieMA@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Mon, 24 Nov 2014 15:31:19 -0800
Message-ID: <CAD1M061c2u8kykkPPRCWSTVBaTj=cbgy8rbzqrE3XzoOew2bHA@mail.gmail.com>
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

On Tue, Nov 18, 2014 at 10:44 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
>> While running the extended test, at about 7 hours of continuous
>> testing with the two boards without a PCIe bridge (configured as a
>> wireless bridge e.g. 4addr=on), the STAtion has a kernel panic that
>> seems to be caused by a double free or something similar. Log is
>> located here (glad I set 'debug' in kernel cmdline):
>> http://dpaste.com/1G77X7N (most interesting info located between times
>> [25684.512971] - [25684.587585]).
>
> Is this on vanilla ath10k code or did you ignore the rx_confused flag
> during the test?

Vanilla code.

> Anyway it'd be lovely if you could get the code line for
> ath10k_htt_txrx_compl_task+0x100 (e.g. via `gdb` with `l *
> ath10k_htt_txrx_compl_task+0x100)`.

I'm on a slightly constrained system, but here's the info I could grab
(I couldn't get the exact code line):

(gdb) list *ath10k_htt_txrx_compl_task+0x100
0xca3c is in ath10k_htt_txrx_compl_task (include/linux/skbuff.h:987).
982     include/linux/skbuff.h: No such file or directory.
(gdb) list *ath10k_htt_txrx_compl_task+0x100/0x544
0xc93c is in ath10k_htt_txrx_compl_task (include/linux/spinlock.h:290).
285     include/linux/spinlock.h: No such file or directory.

However, if I were to make a guess, I would think the the oops
occurred in the rx_ring.lock when freeing.

From your comment a few emails back, you mentioned that a possible
workaround is to "keep on syncing dma to cpu and checking the
MSDU_DONE bit for a few msecs." I tried this out and found (waited an
infinite amount of time just to verify) that it would never quit out,
meaning the memory wasn't there in the first place.

- Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
