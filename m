Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMXrv-0000ql-06
 for ath10k@lists.infradead.org; Wed, 27 Aug 2014 07:42:11 +0000
Received: by mail-wg0-f47.google.com with SMTP id b13so15254718wgh.6
 for <ath10k@lists.infradead.org>; Wed, 27 Aug 2014 00:41:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkys4ZHohK6BG7_h8fFJDFv=Ro4He7tprwZOHaODRCXSQ@mail.gmail.com>
References: <CAHqTa-0GxKjo2ObRtoAKu6H9J6upC7JNS44MpNQpFDPXpiEKJw@mail.gmail.com>
 <8761hpc9j9.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1ZWg38dkT1N0fm3JkLL1kVc_pP1dsuCuorZxXm8z6M7Q@mail.gmail.com>
 <87wqa5au7q.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=Qcrrutt6ZUtbrgKzx0Mo9186SRuV7dc97FnOxwn3Jxg@mail.gmail.com>
 <87siktat4d.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=QGc+bqN+9NA39AxTeN7Xr-PDK13dDD8JxuYxorbmayw@mail.gmail.com>
 <CAHqTa-0Z=VbsZvWNW_=prAU4gCYq4D4ab6m+P8di2s6PHL7bbA@mail.gmail.com>
 <CA+BoTQkys4ZHohK6BG7_h8fFJDFv=Ro4He7tprwZOHaODRCXSQ@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 27 Aug 2014 03:41:28 -0400
Message-ID: <CAHqTa-14hN=+YPWuweptQ=skfOk1dQ=bfZFTcr1ri6vLJ-JqMQ@mail.gmail.com>
Subject: Re: Support for scan while in AP mode, and offchannel while in AP mode
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k <ath10k@lists.infradead.org>

On Wed, Aug 27, 2014 at 2:55 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> Avery wrote:
>> Any guesses about why the offchannel time would be too short on ath10k?
>
> Try setting up a larger beacon interval, e.g. 300ms.

wireshark confirmed that the beacon interval was changed, but
offchannel time was weirdly still about 50ms.

>> I haven't investigated whether the packets are enqueued or simply
>> retransmitted after it returns to the channel, but in any case,
>> userspace and TCP don't see packet loss, so it's fine with me.
>>
>> This is the ath10k driver from 3.15rc1 and firmware 10.1.467.2-1.
>
> I think 10.2 handles scanning in AP mode more reliably so I'd suggest
> you try it out. You might need to cherry pick the 10.2 support for
> your 3.15rc1 (https://github.com/kvalo/ath/commit/24c88f7807fb7c723690474d0a5d3441468185d9).

Looks like the 10.2 firmware does indeed fix this problem.  Offchannel
time is now more like 130ms, no packet loss, and the scan reliably
sees beacons on the other channel.

The first time I booted with the new firmware, my AP seemed to
silently not be working.  Restarting hostapd fixed it.  I'll start
another thread if this recurs.

Thanks!

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
