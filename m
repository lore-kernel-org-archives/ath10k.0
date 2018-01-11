Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x22e.google.com ([2607:f8b0:4001:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZhiO-0005li-B2
 for ath10k@lists.infradead.org; Thu, 11 Jan 2018 18:36:38 +0000
Received: by mail-io0-x22e.google.com with SMTP id t63so3044244iod.0
 for <ath10k@lists.infradead.org>; Thu, 11 Jan 2018 10:36:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87inc8tlhl.fsf@kamboji.qca.qualcomm.com>
References: <CAEV+hqzaqrabZ2uYHHHSNxcmddyFU5Q8odyPqrPZSt-DTJye7A@mail.gmail.com>
 <87inc8tlhl.fsf@kamboji.qca.qualcomm.com>
From: Contrib Open Source <contrib.open.source@gmail.com>
Date: Thu, 11 Jan 2018 19:36:24 +0100
Message-ID: <CAEV+hqzeeeyhcyowhRUTUo1+fN5vcGrhykzaA3kLQtob0Pt3eQ@mail.gmail.com>
Subject: Re: SparkLan WPEQ-261ACN (QCA6174) : packets loss ?
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org

OK, many thanks for these advices. ^_^
I will try both cases:
   *) recent board files + older firmware file
   *) recent board + firmware files and latest ath10k thanks to
backports project

Moreover, do you have any clue about previous questions Q4 and Q5 ?

And finally, I know it will be difficult to answer, but:
Q6) what is the expected throughput on Linux host ?
from: https://www.qualcomm.com/media/documents/files/qca6174a-product-brief.pdf
   WLAN TCP/IP Throughput
      620Mbps/600Mbps TCP DL/UL (PCIe2.1)
Is it true on Linux ?

Thanks again for your help,
Contrib

2018-01-11 17:21 UTC+01:00, Kalle Valo <kvalo@codeaurora.org>:
> Contrib Open Source <contrib.open.source@gmail.com> writes:
>
>> So my questions are :
>
>> Q1) is it correct to "downgrade" firmware API in this case (symbolic
>> link firmware-5.bin) ?
>
> It's not safe, you have to really know what you are doing and understand
> the ath10k internals. We do these FW API increases (5 -> 6) for a
> reason, usually because the new firmware won't work with older version
> of ath10k.
>
> But if you want to run latest ath10k on older kernels I recommend to
> look at backports project:
>
> https://backports.wiki.kernel.org/index.php/Main_Page
>
>> Q2) is it possible to use recent board files with an "older" firmware
>> file ?
>
> To my knowledge board files are not dependent on the firmware versions.
> So yes, you should be able to use newer board-2.bin with older firmware
> release.
>
>> Q3) how to know which firmware files to use for my specific device ?
>
> The firmware releases are not "device" specific (but of course it
> depends on what you mean with device in this context). But my
> recommendation is to always use the latest firmware which works with
> your kernel (WITHOUT any symlink hacks etc).
>
> --
> Kalle Valo
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
