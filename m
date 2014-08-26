Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMJrt-0003eI-LX
 for ath10k@lists.infradead.org; Tue, 26 Aug 2014 16:45:14 +0000
Received: by mail-la0-f54.google.com with SMTP id hz20so14917998lab.41
 for <ath10k@lists.infradead.org>; Tue, 26 Aug 2014 09:44:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87sikl6on7.fsf@kamboji.qca.qualcomm.com>
References: <CABnBrYUtF_S+Gh9nwPQwOct1uA5wsLvwW_oxoYYVtWBqiRQROQ@mail.gmail.com>
 <CAJ-VmokR-2SQG-Hb+7yTXG-5X1PQ_VqB1wiYVCdWa17JyAnMTw@mail.gmail.com>
 <CABnBrYUv4tLcmOJLUD99B96jWRwepk1_-6NQ1LdEaCaPQ5QOwg@mail.gmail.com>
 <87sikl6on7.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 26 Aug 2014 09:44:49 -0700
Message-ID: <CABnBrYWTZrHHnSWMKkwNws7VrEo2drfvQ=4hQUmJ2b13YKB8mw@mail.gmail.com>
Subject: Re: Malformed AddBA Response prevents clients from associating?
From: Denton Gentry <denton.gentry@gmail.com>
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
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Sun, Aug 24, 2014 at 11:59 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Denton Gentry <denton.gentry@gmail.com> writes:
>
>> [   18.047597] ath10k: qca988x hw2.0 (0x4100016c, 0x043202ff) fw
>> 10.1.467.2-1 api 2 htt 2.1
>>
>> On Sun, Aug 24, 2014 at 7:22 PM, Adrian Chadd <adrian@freebsd.org> wrote:
>>> Which firmware build are you using?
>
> (Standard whining: top posting is annoying.)
>
> Denton, any chance you could test with 10.2 firmware and see if the bug
> happens on that firmware as well? I don't know what version of ath10k
> you are using, but I think it should be enough to just to have this
> patch:
>
> https://github.com/kvalo/ath/commit/24c88f7807fb7c723690474d0a5d3441468185d9
>
> And then take the firmware from here:
>
> https://github.com/kvalo/ath10k-firmware/tree/master/10.2
>
> Do not rename the firmware to firmware-2.bin or anything like that. To
> avoid problems keep the name firmware-3.bin.
>
> --
> Kalle Valo

I built an image with the 10.2 firmware and left it running with two
clients disassociating and reassociating every few seconds. After 8
hours I stopped it, with no failures detected.

I restored the 10.1 firmware, and it failed in 9 minutes. There is a
substantial amount of randomness, but it generally happens within 2
hours.

So whatever this issue is, firmware 10.2 does appear to resolve it or
at least make it way less likely to happen.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
