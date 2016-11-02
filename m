Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1rPg-0004Ba-FS
 for ath10k@lists.infradead.org; Wed, 02 Nov 2016 09:00:54 +0000
Date: Wed, 2 Nov 2016 10:00:19 +0100 (CET)
From: Conrad Kostecki <ck+ath10k@bl4ckb0x.de>
Message-ID: <1233772075.6396.1478077219620@office.mailbox.org>
In-Reply-To: <CA+BoTQkyd2f78Pk=_FrYyuQXedn8t6EEYq6BWHB8zthOF_AZ6w@mail.gmail.com>
References: <1403930336.4012.1477681558487@office.mailbox.org>
 <CA+BoTQmbz1vHjn0Xbo2hKcb9v8MdN5uTEnVNOAK0Kfh_NwTp5w@mail.gmail.com>
 <ema51f2924-a0bb-4f7a-8d84-3ee6fb82e317@valkyrie>
 <CA+BoTQkyd2f78Pk=_FrYyuQXedn8t6EEYq6BWHB8zthOF_AZ6w@mail.gmail.com>
Subject: Re: Re[2]: Linux freezes after a time while running
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
Cc: ath10k@lists.infradead.org

Hi!

> Michal Kazior <michal.kazior@tieto.com> hat am 2. November 2016 um 04:31 geschrieben:
> I suspect the pcie link gets broken one direction because attempting a
> cold reset did crash the host even harder.

What I can see, the WiFi runs stable, if nobody connects to it. The failure starts, when somebody connects and does some throughput.

> Looks like the device went into a very confused state due to pcie link
> failure starting from:

Well, I did a test and removed the Mikrotik RB14e, as it has a PLX chip and provides an extra pcie switch. Instead, I took a simple passive miniPCIe->PCIe adapter and build only one card into it. The problem still exists. So, the RB14e is not the cause at least.

>   [  691.609836] pcieport 0000:00:02.0: AER: Multiple Uncorrected
> (Non-Fatal) error received: id=0800

I see, so the firmware crash it not the cause, but the error reported by AER. Thanks for clarify!

> I'm not really familiar with these. Perhaps there's a pcie bridge
> problem on your host platform or maybe an electrical issue (e.g.
> insufficient power supply to handle short bursts?).

Well, the mainboard is microATX. So its powered by a Seasonic 400W passive PSU, but the whole system takes about 40-50w. So the PSU itself should be enough? ;-) IIRC PCIe should provide up to 75W?

I am out of ideas.. I know, a year ago, that cards were perfectly working. Even a test replacement shows the same errors, so it's not a defective card.

Cheers
Conrad

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
