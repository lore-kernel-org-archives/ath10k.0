Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1av467-0006Sz-50
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 14:36:20 +0000
Message-ID: <571F7CB7.9090601@candelatech.com>
Date: Tue, 26 Apr 2016 07:35:35 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: QCA99XX with MU-MIMO and beamforming?
References: <571E7E8F.1010404@candelatech.com>
 <CA+BoTQke1auNL1-oPN-N9=e9K5vit0w2iJSS9KuXEifR7hqm6Q@mail.gmail.com>
In-Reply-To: <CA+BoTQke1auNL1-oPN-N9=e9K5vit0w2iJSS9KuXEifR7hqm6Q@mail.gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>



On 04/25/2016 11:16 PM, Michal Kazior wrote:
> On 25 April 2016 at 22:31, Ben Greear <greearb@candelatech.com> wrote:
>> Has anyone tried this?  Looks like hostapd has the ability to set the
>> feature flags, but I am not sure if it is really working in ath10k?
>
> Yes, it works. You need a few vht_capabs. I have mine like this:
>
>   > vht_capab=[RXLDPC][SHORT-GI-80][TX-STBC-2BY1][SU-BEAMFORMER][SU-BEAMFORMEE][MU-BEAMFORMER][RX-ANTENNA-PATTERN][TX-ANTENNA-PATTERN][BF-ANTENNA-4][MAX-MPDU-11454][RX-STBC-1][MAX-A-MPDU-LEN-EXP7]
>
> The SU-, MU- and BF- are the required part only I think.
>
>
>>
>> Do you actually need anything other than standard whip antenna to
>> allow this to function properly?
>
> I don't think. FWIW Make sure the antennas are reasonably set
> up/separated from each other. If you cram them too tight/randomly
> beamforming won't work efficiently. I had problem with client antennas
> being too close to each other and lying flat on a table (I than made a
> foam-stand and put them a few cm apart) so the same thing must apply
> to AP as well.
>
>
>>
>> What about station mode?
>
> Works as well. Both on QCA99XX and QCA9377.

Thanks for the info.  How did you determine that it actually worked?

My understanding is that the QCA99XX should be able to simultaneously
transmit a 2x2 frame to one peer and another 2x2 frame to a second peer,
but seems that would be hard to verify.

Maybe just look for full-ish 2x2 throughput two two different 2x2 peers?

And, maybe there are some management frames to sniff for?

And finally, could you let me know the model number of your QCA9377 device?  I'd like
to get some for testing...

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
