Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsVVI-0000mW-AQ
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 11:06:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>
 <87wqczz3h9.fsf@kamboji.qca.qualcomm.com>
 <538CA904.4000508@candelatech.com>
 <87ioojz1b1.fsf@kamboji.qca.qualcomm.com>
 <538CB782.1000509@candelatech.com> <538CC68C.10808@gmail.com>
 <538CC949.5020901@candelatech.com>
 <CANUX_P2vbKD3zkwE=DvJJWpo=gEMORCBy=XFoC2YSFpmg9sr_A@mail.gmail.com>
 <538CD507.1050803@candelatech.com>
Date: Thu, 5 Jun 2014 14:06:13 +0300
In-Reply-To: <538CD507.1050803@candelatech.com> (Ben Greear's message of "Mon, 
 2 Jun 2014 12:48:23 -0700")
Message-ID: <87bnu7pqe2.fsf@kamboji.qca.qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Emmanuel Grumbach <egrumbach@gmail.com>

Ben Greear <greearb@candelatech.com> writes:

> On 06/02/2014 12:29 PM, Emmanuel Grumbach wrote:
>
>> Different TLV based binary blobs concatenated. The actual encoding of
>> each of them is another story.
>
> Should we try to make the 'Type' in TLV be consistent as convenient
> across different drivers?  That might someday help auto-reporting
> tools?

I don't see the need for that as all firmwares are so different anyway.
As long as there's some magic string to recognize/verify for which
firmware it is we should be ok.

> It does not resolve my interest in firmware logs interleaved with
> kernel logs and possibly supplicant, however.
>
> Looks like trace-cmds could do that, but it will not be
> running for normal users when they experience crashes.
>
> Any suggestions other than printk for this feature?

Why do you want to put the crash dump in kernel log, can you describe
your "use case" here? For me it would be enough to have a UUID for each
crash dump and then have the driver print that to kernel log:

ath10k: firmware crashed (uuid 1234567890-4321)

And then you just need to find the correct dump from the file system and
start debugging. Would that be enough for you?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
