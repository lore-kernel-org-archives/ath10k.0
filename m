Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUeEf-0003L5-GN
 for ath10k@lists.infradead.org; Thu, 18 Sep 2014 16:07:10 +0000
Message-ID: <541B0311.3060508@candelatech.com>
Date: Thu, 18 Sep 2014 09:06:41 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Hard lockup during vif restart tests.
References: <541884AC.3020402@candelatech.com>
 <CA+BoTQkeSSp5K=Ov-Sce9tcKz5ARL1im615PckPgNK-X8O-c1Q@mail.gmail.com>
 <5419AE32.6010805@candelatech.com>
 <CA+BoTQkcP=Yc8kA2=OotrWbaAf09aMOmiPQp5W2j1vxsu3x4Kg@mail.gmail.com>
 <87vbols7tg.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87vbols7tg.fsf@kamboji.qca.qualcomm.com>
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
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>

On 09/18/2014 12:31 AM, Kalle Valo wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
> 
>>> Why do we reset the firmware/NIC when we admin down/up the
>>> vif (when a single vif is active)?  Couldn't we just keep
>>> the firmware active in this state and not risk lockup due
>>> to reset?
>>
>> If you put down last interface mac80211 calls drv_stop(). There isn't
>> any real need to keep the device up and running after that other than
>> trying to workaround the reset issue. But then you need to deal with
>> firmware quirks. I recall it could report Rx indications after all
>> vdevs had been removed (and this is now also observable with 10.2
>> during probing/bootup). It's just simpler to reboot firmware on
>> drv_stop/start().
> 
> And there's the reliability issue. Being able to reset the firmware with
> interface down/up sequency is pretty useful and AFAIK almost all
> upstream drivers do that. And let's not forget power consumption either.

The fact that restarting firmware can hang the machine or require
reboot to recover is so serious that I think a work-around is
worth looking into.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
