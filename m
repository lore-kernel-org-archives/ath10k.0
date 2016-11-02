Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1xSL-0001RO-DW
 for ath10k@lists.infradead.org; Wed, 02 Nov 2016 15:28:02 +0000
Received: by mail-wm0-x235.google.com with SMTP id t79so44459267wmt.0
 for <ath10k@lists.infradead.org>; Wed, 02 Nov 2016 08:27:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1233772075.6396.1478077219620@office.mailbox.org>
References: <1403930336.4012.1477681558487@office.mailbox.org>
 <CA+BoTQmbz1vHjn0Xbo2hKcb9v8MdN5uTEnVNOAK0Kfh_NwTp5w@mail.gmail.com>
 <ema51f2924-a0bb-4f7a-8d84-3ee6fb82e317@valkyrie>
 <CA+BoTQkyd2f78Pk=_FrYyuQXedn8t6EEYq6BWHB8zthOF_AZ6w@mail.gmail.com>
 <1233772075.6396.1478077219620@office.mailbox.org>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Wed, 2 Nov 2016 16:27:38 +0100
Message-ID: <CA+BoTQnOGOAEvM=M-1TqaN3GPgSJ2CUX-6Upa38jmaRzW9JkGA@mail.gmail.com>
Subject: Re: Re[2]: Linux freezes after a time while running
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
To: Conrad Kostecki <ck+ath10k@bl4ckb0x.de>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 2 November 2016 at 10:00, Conrad Kostecki <ck+ath10k@bl4ckb0x.de> wrote:
> Hi!
>
>> Michal Kazior <michal.kazior@tieto.com> hat am 2. November 2016 um 04:31 geschrieben:
>> I suspect the pcie link gets broken one direction because attempting a
>> cold reset did crash the host even harder.
>
> What I can see, the WiFi runs stable, if nobody connects to it. The failure starts, when somebody connects and does some throughput.
>
>> Looks like the device went into a very confused state due to pcie link
>> failure starting from:
>
> Well, I did a test and removed the Mikrotik RB14e, as it has a PLX chip and provides an extra pcie switch. Instead, I took a simple passive miniPCIe->PCIe adapter and build only one card into it. The problem still exists. So, the RB14e is not the cause at least.
>
>>   [ 691.609836] pcieport 0000:00:02.0: AER: Multiple Uncorrected
>> (Non-Fatal) error received: id=0800
>
> I see, so the firmware crash it not the cause, but the error reported by AER. Thanks for clarify!
>
>> I'm not really familiar with these. Perhaps there's a pcie bridge
>> problem on your host platform or maybe an electrical issue (e.g.
>> insufficient power supply to handle short bursts?).
>
> Well, the mainboard is microATX. So its powered by a Seasonic 400W passive PSU, but the whole system takes about 40-50w. So the PSU itself should be enough? ;-) IIRC PCIe should provide up to 75W?
>
> I am out of ideas.. I know, a year ago, that cards were perfectly working. Even a test replacement shows the same errors, so it's not a defective card.

Were the cards working with this particular microATX mainboard before though?

Maybe the adapter is to blame? Or maybe it's a faulty mobo? You could
try reducing txpower of the card with "iw" and see if it makes a
difference.


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
