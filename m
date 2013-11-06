Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve76X-0007Hd-1D
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 17:41:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: What to do about hung firmware?
References: <52793E4B.20302@candelatech.com>
 <CA+BoTQk2EZddNywAMRLF2qpWafpD4OvyDrtvg+iTM4atcm44ig@mail.gmail.com>
 <87ob5yt1kp.fsf@kamboji.qca.qualcomm.com>
 <527A739C.4060807@candelatech.com>
Date: Wed, 6 Nov 2013 19:40:39 +0200
In-Reply-To: <527A739C.4060807@candelatech.com> (Ben Greear's message of "Wed, 
 6 Nov 2013 08:51:40 -0800")
Message-ID: <87li11e8dk.fsf@kamboji.qca.qualcomm.com>
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
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 11/05/2013 11:46 PM, Kalle Valo wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>> 
>>> You probably could try WMI_ECHO_CMDID to implement a keep alive when
>>> idling (i.e. not sending WMI commands for a few seconds at least).
>> 
>> Sending something periodically would be bad from power consumption point
>> of view. We would need to either disable it by default, only send it if
>> there's a problem or something like that.
>
> Ok, how about this:
>
> If we hit the 3*HZ timeout, then we send a ping to the firmware
> even if we are out of tickets.
>
> If we get no response to that in 3*HZ or so, then consider firmware
> hung and reset it.

Sounds good to me.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
