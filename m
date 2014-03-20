Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQfNR-0006FK-Ug
 for ath10k@lists.infradead.org; Thu, 20 Mar 2014 15:59:30 +0000
Message-ID: <532B104A.7060302@candelatech.com>
Date: Thu, 20 Mar 2014 08:59:06 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Trouble connecting to broadcom AC APs?
References: <5329CD60.6080609@candelatech.com>
 <87txatfkad.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87txatfkad.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 03/19/2014 11:36 PM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> We are seeing various funny things when trying to connect
>> ath10k stations to commercial APs with broadcom AC NICs.
>>
>> It sort of works sometimes, but we often see failure to
>> acquire DHCP lease in a timely manner, etc.
> 
> So it's a problem with broadcast frames? With or without encryption? Did
> you try disabling power save?

With and without encryption we see issues.  I am disabling power-save,
but from poking around in firmware, I'm not sure how much affect that
has.

I'm using commands like this to disable it:
./local/sbin/iw dev sta219 set power_save off

>> Similar testing on APs using QCA AC NICs appears to work
>> much better.
>>
>> Our problems could be most anything, including the fact that this
>> testing is done on our modified firmware, but I am curious if anyone
>> else seems any similar issues?
> 
> Occasionally I test connecting to D-Link DIR-865L in STA mode. But I
> just do just simple ping tests and with manual IPs.

We'll keep poking at things and see if we can find any
pattern or work around.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
