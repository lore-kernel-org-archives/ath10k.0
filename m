Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZfDe-0007H2-5t
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 12:10:51 +0000
Received: by mail-lb0-f176.google.com with SMTP id p9so2133624lbv.35
 for <ath10k@lists.infradead.org>; Thu, 02 Oct 2014 05:10:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87bnpuofnp.fsf@kamboji.qca.qualcomm.com>
References: <CAB6w8enBQM5+xApKgA=p=NZicit6nzasefwjv_0XfO3ZwaS67g@mail.gmail.com>
 <CA+BoTQ=nFs9o1VipEinmJgxXYr24jL9QH9RCDzpXPKo_qsB0-w@mail.gmail.com>
 <87tx3moips.fsf@kamboji.qca.qualcomm.com>
 <CAB6w8emWrQDtETBzKVxU3Ya6MF4c6dP1vr_2pqYxYzfMXG+Xwg@mail.gmail.com>
 <87bnpuofnp.fsf@kamboji.qca.qualcomm.com>
From: Ramprasad Vempati <ramprasad.vempati@gmail.com>
Date: Thu, 2 Oct 2014 17:34:50 +0530
Message-ID: <CAB6w8ekCfRR-SLLDMvVukwVyTp0ooXPQgXdj6o8GqdPtCr+c3g@mail.gmail.com>
Subject: Re: Unable to upgrade firmware for QCA988x module, ath10k!
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
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Thanks for the support. Now I see firmware it picked up latest one.
But still 11ac is not working.

Yes, I've updated to latest kernel. but I still don't see 80Mhz channels.

How do I upgrade regulatory database?

root@banwifilap100u:~# iw reg get
country US:
        (2402 - 2472 @ 40), (3, 27)
        (5170 - 5250 @ 40), (3, 17)
        (5250 - 5330 @ 40), (3, 20), DFS
        (5490 - 5600 @ 40), (3, 20), DFS
        (5650 - 5710 @ 40), (3, 20), DFS
        (5735 - 5835 @ 40), (3, 30)
        (57240 - 63720 @ 2160), (N/A, 40)
root@banwifilap100u:~#
root@banwifilap100u:~#
root@banwifilap100u:~# uname -a
Linux banwifilap100u 3.13.0-36-generic #63-Ubuntu SMP Wed Sep 3
21:30:45 UTC 2014 i686 i686 i686 GNU/Linux
root@banwifilap100u:~#

and now I see firmware is also changed to what I intended, but still
can see only in 802.11n mode, but not in 11ac mode.

root@banwifilap100u:~# ethtool -i wlan1
driver: ath10k_pci
version: 3.13.0-36-generic
firmware-version: 10.1.467-ct-swcrypt-diet-011
bus-info: 0000:03:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no

Regards,
Ramprasad


On Thu, Oct 2, 2014 at 5:19 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Ramprasad Vempati <ramprasad.vempati@gmail.com> writes:
>
>> And I'm updating my kernel 3.13.
>
> I recommend updating to the latest kernel. The older the kernel the more
> difficult it is to help.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
