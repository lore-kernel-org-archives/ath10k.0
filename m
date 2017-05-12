Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg0-x233.google.com ([2607:f8b0:400e:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8yJz-0001Cx-A7
 for ath10k@lists.infradead.org; Fri, 12 May 2017 00:20:41 +0000
Received: by mail-pg0-x233.google.com with SMTP id q125so2544744pgq.2
 for <ath10k@lists.infradead.org>; Thu, 11 May 2017 17:20:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c3814c7d-eed3-dad2-c568-6ce456ee7166@gmail.com>
References: <CAHNpzpeRE6ha4JA9i4oyJ2BjgJg53FvDpAb1yZccncrmTeiBdQ@mail.gmail.com>
 <8737g45xc7.fsf@kamboji.qca.qualcomm.com>
 <c3814c7d-eed3-dad2-c568-6ce456ee7166@gmail.com>
From: Ann Lo <annlo.tech@gmail.com>
Date: Thu, 11 May 2017 17:20:13 -0700
Message-ID: <CABy9W5kF8KcTUgk9UOguu1A-N==tMbjVW1gWGeq8pgAN6YREUg@mail.gmail.com>
Subject: Re: Driver support for QCA6174 chip using SDIO interface
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: Akesh M Chacko <akesh.chacko@vvdntech.in>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Erik,

We are hoping to use your new SDIO patches for QCA9377 on kernel
version 4.1.36. There appears to be version 7 patches according to the
following email:
http://lists.infradead.org/pipermail/ath10k/2017-April/009633.html

Would you advise on the followings?

1) What is the status of ath10k SDIO for QCA9377? The above email has
the comment "With this patch we have the low level HTC protocol
working and it's possible to boot the firmware, but it's still not
possible to connect or anything like." Do you have an estimate of the
time for full functionality, that wpa_supplicant and hostapd will run
successfully? How much further work is needed?

2) Our BSP uses kernel version 4.1.36. Can we apply your patches to
this version? Or, do we need to backport a newer version for QCA9377?

We are trying to prepare the software so that we can test when our
hardware is ready.

Thanks,
Ann



On Sun, Jan 29, 2017 at 1:16 PM, Erik Stromdahl
<erik.stromdahl@gmail.com> wrote:
> If you are interested in trying the latest version of the sdio code
> you can clone the below repo:
>
> https://github.com/erstrom/linux-ath.git
>
> I have just pushed some updates for QCA9377 SDIO (that might work with
> QCA6174 chipsets as well).
>
> I will do some more testing of this code during the weeks to come.
>
> If you could try it out and give me feedback it would be great!
>
> On 2017-01-27 16:36, Valo, Kalle wrote:
>>
>> Akesh M Chacko <akesh.chacko@vvdntech.in> writes:
>>
>>> We are using QCA6174 chip on our embedded platform using SDIO
>>> interface. could you please help us to get the SDIO support for
>>> QCA6174 driver.
>>
>>
>> Erik Stromdahl is working on adding SDIO support to ath10k:
>>
>> https://patchwork.kernel.org/patch/9516477/
>>
>> But it's still WIP.
>>
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
