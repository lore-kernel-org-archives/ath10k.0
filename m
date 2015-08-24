Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTujB-0004DY-Td
 for ath10k@lists.infradead.org; Mon, 24 Aug 2015 16:36:10 +0000
Received: by igui7 with SMTP id i7so65343007igu.1
 for <ath10k@lists.infradead.org>; Mon, 24 Aug 2015 09:35:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55DB4720.1090106@candelatech.com>
References: <006a01d0de35$1bde70a0$539b51e0$@netlab.snu.ac.kr>
 <55DB4720.1090106@candelatech.com>
Date: Mon, 24 Aug 2015 09:35:48 -0700
Message-ID: <CAJ-Vmo=HX5iDDYpwwPFL_xFZbRnC_NZo7gJ_CwXWRhbS+Ar1yA@mail.gmail.com>
Subject: Re: How to access the CCA related operation
From: Adrian Chadd <adrian@freebsd.org>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Seowoo Jang <swjang@netlab.snu.ac.kr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

There's TX_FRAME, RX_FRAME, RX_BUSY, etc state machine indications
that you can break out via GPIO pins..



-adrian


On 24 August 2015 at 09:32, Ben Greear <greearb@candelatech.com> wrote:
> It is in firmware, and you cannot reliably poke it through the driver
> read/write register API because each time the radio resets (channel change,
> etc), it is
> liable to re-write the CCA registers back to default values.
>
> There is a large list of registers with 'CCA' in the name, but I don't
> know what they really mean, and I had hard time getting that info out
> of QCA.  If you have any better luck, please post whatever you can
> share.
>
> Thanks,
> Ben
>
>
>
> On 08/23/2015 11:21 PM, Seowoo Jang wrote:
>>
>> Hello,
>>
>> We are trying to evaluate our idea on 802.11ac protocol with Atheros
>> qca9880
>> / ath10k driver.
>>
>> We would like to be able to access/know the result of the CCA (clear
>> channel
>> assessment) operation
>> or the level of interference on the carrier when we need.
>>
>> We have dug into the driver files and concluded that the CCA related
>> values
>> are likely
>> in the firmware or on the registers of the hardware.
>>
>> And please correct us if we are thinking wrong.
>>
>> We would appreciate the help if someone can give us some starting points,
>> such as the address of the register that stores the carrier sensing values
>> (CCA values)
>> or the result of it (whether the carrier is busy or idle), to investigate.
>>
>> The chipset we are using is compex WLE900VX-7AA.
>>
>> We are currently using Ubuntu 14.04.03 with kernel version 4.1.5,
>> but we can use any versions of OS and kernel if they support 802.11ac
>> bandwidth.
>>
>> Thank you for help in advance.
>>
>> -------------------------------
>> Seowoo Jang, Ph.D.
>> Ubiquitous Network Laboratory
>> EECS, Seoul National University
>>
>> CEL   +82-10-3723-3401
>> E-mail swjang@netlab.snu.ac.kr
>> -------------------------------
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
