Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZeZH-00076g-O4
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 11:29:08 +0000
Received: by mail-lb0-f177.google.com with SMTP id w7so2051459lbi.36
 for <ath10k@lists.infradead.org>; Thu, 02 Oct 2014 04:28:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87tx3moips.fsf@kamboji.qca.qualcomm.com>
References: <CAB6w8enBQM5+xApKgA=p=NZicit6nzasefwjv_0XfO3ZwaS67g@mail.gmail.com>
 <CA+BoTQ=nFs9o1VipEinmJgxXYr24jL9QH9RCDzpXPKo_qsB0-w@mail.gmail.com>
 <87tx3moips.fsf@kamboji.qca.qualcomm.com>
From: Ramprasad Vempati <ramprasad.vempati@gmail.com>
Date: Thu, 2 Oct 2014 16:58:23 +0530
Message-ID: <CAB6w8emWrQDtETBzKVxU3Ya6MF4c6dP1vr_2pqYxYzfMXG+Xwg@mail.gmail.com>
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

Below is the output I get. But shouldn't it be working in 11ac mode,
probably in 40Mhz, if regulatory is not updated?

root@banwifilap100u:~# iw reg get
country US:
        (2402 - 2472 @ 40), (3, 27)
        (5170 - 5250 @ 40), (3, 17)
        (5250 - 5330 @ 40), (3, 20), DFS
        (5490 - 5600 @ 40), (3, 20), DFS
        (5650 - 5710 @ 40), (3, 20), DFS
        (5735 - 5835 @ 40), (3, 30)
        (57240 - 63720 @ 2160), (N/A, 40)

And I'm updating my kernel 3.13.
Regards,
Ramprasad


On Thu, Oct 2, 2014 at 4:13 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
>
>>> http://www.compexshop.com/product_info.php?currency=USD&products_id=460
>>>
>>> I've placed the firmware that's downloaded from  :
>>> https://github.com/kvalo/ath10k-firmware. I've pasted the firmware
>>> file as "firmware-2.bin" in /lib/firmware/ath10k/QCA988X/hw2.0. Now
>>> there are two files firmware.bin (default one) and "firmware-2.bin"
>>> downloaded from github. Now even after reboot of laptop the firmware
>>> version doesn't change. It still shows 1.0.0.636.
>>>
>>> Can someone let me know what am I missing?
>>
>> Support for firmware-2.bin was added in kernel 3.13.
>
> And if you want to run latest ath10k on an older kernel, you need to use
> backports:
>
> http://wireless.kernel.org/en/users/Drivers/ath10k/faq#How_can_I_run_latest_ath10k_on_older_kernels.3F
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
