Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUDdi-0000l5-NU
 for ath10k@lists.infradead.org; Mon, 01 Aug 2016 13:52:23 +0000
Message-ID: <579F4E4E.80103@candelatech.com>
Date: Mon, 01 Aug 2016 06:27:42 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] cfg80211: Add support to set tx power for a station
 associated
References: <1465926256-6463-1-git-send-email-arnagara@qti.qualcomm.com>
 <1467110918.2493.9.camel@sipsolutions.net>	
 <1cb3e2cc49b433fe5ed834a33adf64b6@codeaurora.org>
 <1470043740.3389.10.camel@sipsolutions.net>
In-Reply-To: <1470043740.3389.10.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>, Ashok Raj Nagarajan <arnagara@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, ath10k@lists.infradead.org



On 08/01/2016 02:29 AM, Johannes Berg wrote:
>
>> Sure.. First use case will be to help with the problem of legacy
>> client devices that roam across multiple APs. It is a classic
>> enterprise Wi-Fi AP problem,  often managed by a "network controller"
>> unit that is connected to all the APs.
>> The problem is how to handle seamless handoff of clients between
>> multiple  APs while maximizing the client throughput and minimizing
>> disruption of IP application services like VoIP calls and video
>> streaming. A legacy client will often  hold onto an AP association,
>> even down to 1 Mbps as it roams away. Instead,  if the AP can
>> recognise that the client RSSI (and therefore throughput) is poor, it
>> can "drop" the Tx power significantly (just to that client) such that
>> it forcesthe client to look for a better, closer, and therefore
>> higher-throughputassociation. It would "give it a kick" without
>> blacklisting it. It just needsto hold the power low for the small
>> amount of time it takes to convince it to go away.
>
> Not sure that *works* since implementations may just compare beacon
> signal strength and hold on to the AP based on that, but it does seem
> like a reasonable use case.

How is that better than just kicking the station deliberately and/or
refusing to send frames to it at all?

Thanks,
Ben

>
> How would this interact with automatic adjustment though?
>
> johannes
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
