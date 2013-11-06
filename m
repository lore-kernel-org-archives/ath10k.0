Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdxQr-00069p-Uz
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 07:21:42 +0000
Message-ID: <5279EDEF.3090009@candelatech.com>
Date: Tue, 05 Nov 2013 23:21:19 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: What to do about hung firmware?
References: <52793E4B.20302@candelatech.com>
 <CA+BoTQk2EZddNywAMRLF2qpWafpD4OvyDrtvg+iTM4atcm44ig@mail.gmail.com>
In-Reply-To: <CA+BoTQk2EZddNywAMRLF2qpWafpD4OvyDrtvg+iTM4atcm44ig@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k@lists.infradead.org

On 11/05/2013 11:07 PM, Michal Kazior wrote:
> On 5 November 2013 19:51, Ben Greear <greearb@candelatech.com> wrote:
>> I'm seeing cases where it appears the firmware just gets
>> stuck and will not answer any WMI requests.
>
> You probably mean FW doesn't replenish HTT TX credits for WMI.

Maybe so..I added some debugging to check on that, but then of course
I could not reproduce the problem.

>> ath10k just patiently keeps timing out WMI commands,
>> (while holding locks, and making the whole system run slow).
>>
>> Should we maybe keep a last-msg-from firmware time stamp
>> and just whack the firmware if we detect it hung?  In addition
>> to this, we could add some 'ping' message that will get sent
>> periodically to the firmware to make sure it is alive.
>> We should be able to do this with existing WMI API, just
>> need to pick a message to send that expects some response.
>
> Probably the easiest/shortest way to do this is to store a timestamp
> in ath10k_wmi_op_ep_tx_credits() and check against it in
> ath10k_wmi_cmd_send(). Once you deem FW stopped responding you could
> queue ar->restat_work.
>
> You probably could try WMI_ECHO_CMDID to implement a keep alive when
> idling (i.e. not sending WMI commands for a few seconds at least).

Sounds good.  I'll work on this if I start seeing the lockups
again...

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
