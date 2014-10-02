Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZdrL-00037i-BH
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 10:43:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Unable to upgrade firmware for QCA988x module, ath10k!
References: <CAB6w8enBQM5+xApKgA=p=NZicit6nzasefwjv_0XfO3ZwaS67g@mail.gmail.com>
 <CA+BoTQ=nFs9o1VipEinmJgxXYr24jL9QH9RCDzpXPKo_qsB0-w@mail.gmail.com>
Date: Thu, 2 Oct 2014 13:43:11 +0300
In-Reply-To: <CA+BoTQ=nFs9o1VipEinmJgxXYr24jL9QH9RCDzpXPKo_qsB0-w@mail.gmail.com>
 (Michal Kazior's message of "Thu, 2 Oct 2014 12:39:36 +0200")
Message-ID: <87tx3moips.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Cc: Ramprasad Vempati <ramprasad.vempati@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

>> http://www.compexshop.com/product_info.php?currency=USD&products_id=460
>>
>> I've placed the firmware that's downloaded from  :
>> https://github.com/kvalo/ath10k-firmware. I've pasted the firmware
>> file as "firmware-2.bin" in /lib/firmware/ath10k/QCA988X/hw2.0. Now
>> there are two files firmware.bin (default one) and "firmware-2.bin"
>> downloaded from github. Now even after reboot of laptop the firmware
>> version doesn't change. It still shows 1.0.0.636.
>>
>> Can someone let me know what am I missing?
>
> Support for firmware-2.bin was added in kernel 3.13.

And if you want to run latest ath10k on an older kernel, you need to use
backports:

http://wireless.kernel.org/en/users/Drivers/ath10k/faq#How_can_I_run_latest_ath10k_on_older_kernels.3F

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
