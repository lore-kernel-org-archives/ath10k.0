Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm9-vm0.bullet.mail.bf1.yahoo.com ([98.139.213.154])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyycT-0007ZO-NX
 for ath10k@lists.infradead.org; Wed, 18 Nov 2015 09:01:40 +0000
Date: Wed, 18 Nov 2015 09:01:14 +0000 (UTC)
From: Joerg Pommnitz <pommnitz@yahoo.com>
Message-ID: <898991972.6790146.1447837274772.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <018201d12175$a4604d80$ed20e880$@tranzeo.com>
References: <018201d12175$a4604d80$ed20e880$@tranzeo.com>
Subject: Re: TX-Power limits for ath10k based card on Linux 3.18.24 (offlist)
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Joerg Pommnitz <pommnitz@yahoo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michael Rex <mrex@tranzeo.com>, 'Ben Greear' <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: =?UTF-8?Q?=27Mike_Jaecker=27_=E2=80=8E=E2=80=8E?= <jaecker@kohlstaedt.de>, Michael Schaefer <schaeferm@iabg.de>

Michael, Ben,
thanks for the illuminating answers. From Michaels latest reply I gather that the hardware is actually capable of transmitting with full power on a single chain/antenna, but that the current firmware or driver limits the tx power on a single chain in a way that makes sure that the combined tx power of all available chains is within the regulatory limits. Is this correct?
What would it take to enable full tx power for a single chain?

 -- Regards       Joerg



> Michael Rex <mrex@tranzeo.com> schrieb am 21:22 Dienstag, 17.November 2015:
> > Ben,
> 
> That is definitely a good way to do it.  That seems to be the way lab
> engineers have been configuring ART during the tests, but as you can see
> from Compex datasheet, they are marketing the combined power of 2 and 3
> chains, not making them the same regardless of chains. So they are marketing
> it higher than their approved certificate says... I think nearly all MFG's
> are doing that 'false' advertising.  Well, perhaps maybe not your 
> customer
> who went through approvals...
> 
> Since an individual chain is capable of full power, and companies want to
> market and sell the highest power, I think it would be better (better
> meaning max power achievable) to allow all 3 chains to go full power rather
> than 1/3 power, but it would have to be done in time for the certification.
> Not sure how complex the code would have to be to allow both methods of
> target power setting, but you're kind of stuck for the people who already
> approved on that driver behaviour.  It probably would increase power density
> and other things and perhaps fail unless target power decreased to pass the
> limit.
> 
> Hard to say which way is better, but your method is the safer method of
> passing approvals.  Given the expense of approvals, having it pass first try
> might be more critical than squeezing out every dBm for the datasheet (tech
> vs sales argument).
> 
> Regards,
> Mike
> 
> 
> -----Original Message-----
> From: Ben Greear [mailto:greearb@candelatech.com] 
> Sent: November 17, 2015 11:48 AM
> To: Michael Rex; pommnitz@yahoo.com
> Subject: Re: TX-Power limits for ath10k based card on Linux 3.18.24
> (offlist)
> 
> On 11/17/2015 11:20 AM, Michael Rex wrote:
>>  Joerg,
>> 
>>  The power at 11g is 15-19dBm, not 20dBm as shown in this screenshot.
> There is no such thing as 2 chains power in 11g (they have diversity, which
> means A port
>>  or B port, there is no MIMO processing going on there to sum the powers).
> That is a fallacy but they won't remove it from their datasheet.
>> 
>>  The power will fluctuate, depending on the data rate used.  So when you
> had less attenuation, it likely transmitted at 54M. When you added
> attenuation, it
>>  adapted to 6M and output 4dBm more.  You'd have to see the received 
> data
> rate on the receiver, or test equipment that can detect it (I believe there
> is still an
>>  issue reporting data rate in Ath10k?).  The power for 48M is likely 16,
> and 36M is likely 17dBm, so you kind of have to know what data rate is being
> sent to
>>  know how close to expected you really are. Otherwise, you could be 4dBm
> off from your expectation, but its exactly as designed.
> 
> You can force the data-frame transmit rate in ath10k firmware, and, at least
> with my hacked kernel and firmware,
> you can also force the management and broadcast/mcast frames to a specific
> legacy rate.
> 
> So, you should be able to force to 6Mbps, do a test, and then force to
> 54Mbps, and do
> another test to verify the tx-power at different rates.
> 
> The change I made to my firmware regarding tx power is something like this:
> 
> Original code took total-requested-power, and basically divided by 3 if NIC
> was 3x3 capable.
> 
> I changed it to set up tx-power based on the number of chains that a
> particular rate would use, so
> legacy rates got full power, 2x2 got 1/2 power, and 3x3 got 1/3 power per
> chain.
> 
> I'm not 100% sure this is correct, but it seems to work, and at least one
> company using
> my firmware passed regulatory testing with no problems related to tx
> power...
> 
> Thanks,
> Ben
> 
> 
>> 
>>  Power accuracy is also not guaranteed and commonly outside of +/- 2dBm.
> However, Compex is /usually/ one of the good ones you can usually count on
> within -2dBm
>>  of accuracy (I wouldn't bet money on it, quality varies for all
> manufacturers).  So it is important to have accurately calibrated test
> setups with measured
>>  losses of cables and connectors, as NOTHING (short of $$$ parts) is ever
> their rating.  For example, ALL my mini circuits 20dBm attenuators are
> closer to 21dBm
>>  than 20dBm.  All the cheap splitters have more than 4.3dBm of insertion
> loss where people often expect 3dBm.  The attenuators like Aeroflex that are
> 6X the cost
>>  will be like 10.1dBm and 20.2dBm on their respective ratings as a
> comparison of quality, in my experience.
>> 
>>  In an earlier previous gen 11n Compex card, when you put the card in 11g
> mode and used left chain (their firmware using the closed Qualcomm fusion
> driver), you
>>  got full output power. When you used right chain, there was like 7dBm
> less.  Compex couldn't explain it to me, we just had to note it and move on.
> Who knows if
>>  something like that is part of the problem.  It could have been an antenna
> misconfiguration in their calibration.  Likely, they often just accept the
> Qualcomm
>>  reference platform for the most part.
>> 
>>  How accurate is your test setup and measurements? If you don't have 
> tested
> losses, you can probably only say +/- 3dBm on your numbers, or just relative
>>  measurement testing.
>> 
>>  Best regards,
>> 
>>  Mike
>> 
> 
> 
> -- 
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
