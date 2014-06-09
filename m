Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wtv27-0000X0-Hx
 for ath10k@lists.infradead.org; Mon, 09 Jun 2014 08:34:24 +0000
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
 <87bnu7pqe2.fsf@kamboji.qca.qualcomm.com>
 <53909372.1040707@candelatech.com>
 <87fvjimsxj.fsf@kamboji.qca.qualcomm.com>
 <5391E620.4090706@candelatech.com>
 <87vbscj2ho.fsf@kamboji.qca.qualcomm.com>
 <53932F52.2030203@candelatech.com>
 <8738ffiysv.fsf@kamboji.qca.qualcomm.com>
 <539483B1.5020401@candelatech.com>
Date: Mon, 9 Jun 2014 11:17:03 +0300
In-Reply-To: <539483B1.5020401@candelatech.com> (Ben Greear's message of "Sun, 
 8 Jun 2014 08:39:29 -0700")
Message-ID: <87ppiih4zk.fsf@kamboji.qca.qualcomm.com>
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

>>> With time-of-day, time-since-boot, and MAC, each dump should be unique.
>>
>> But I would like to easily match from kernel log that the crash dump
>> matches with log. uuid would provide that in a simple way (check that
>> the uuid in the log matches with the uuid in the dump). What's so bad
>> from using uuid?
>
> Just tell me how you want me to create the uuid and I'll do so.

As kbuild found some compilation problems, I think it would be easier if
I make the final changes to your patches and send that for review. Would
that be ok for you?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
