Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6DQQ-0006Wr-I9
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 06:06:03 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: BAR error, failed to get chip id.
References: <52E02B28.6020503@candelatech.com>
 <CAJ-VmokveU-WxqboRhdagLwp2E2o-Bic7Pd4LvHaj7TX+rBnYA@mail.gmail.com>
 <52E06430.5060408@candelatech.com>
Date: Thu, 23 Jan 2014 08:05:22 +0200
In-Reply-To: <52E06430.5060408@candelatech.com> (Ben Greear's message of "Wed, 
 22 Jan 2014 16:37:04 -0800")
Message-ID: <87iotb9qsd.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Adrian Chadd <adrian.chadd@gmail.com>, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 01/22/2014 04:10 PM, Adrian Chadd wrote:
>> Tgis is rev 2.0 right? I recall reset bugs in 1.0 that had the pcie bits not setup right by the firmware after a cold reset.
>
> I'm using a rev 2 development NIC (CUS223, I think..haven't cracked the
> machine open in a while).
>
> I usually get about 1-3 module reloads before the system either totally
> freezes or prints out the info below (and fails to load the driver),
> requiring reboot of the system.
>
> I have been working on other features and bugs and have been ignoring
> these lockups, but now I'm a bit more interested in trying to resolve
> them...

I was told that CUS223 has a problem with cold resets. Whenever the host
issues a cold reset occasionally voltage in one of the board component's
goes too down and causes PCI errors. I think that's what you are seeing.

The workaround is to use warm resets, but we are still having some
problems with that after firmware crashes. Hopefully we can send patches
next week.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
