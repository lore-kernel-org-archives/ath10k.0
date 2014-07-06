Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X3iDT-0004zE-C7
 for ath10k@lists.infradead.org; Sun, 06 Jul 2014 08:54:35 +0000
Message-ID: <53B90EB1.8020305@candelatech.com>
Date: Sun, 06 Jul 2014 01:54:09 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Question on beacon-miss handling.
References: <53B808BF.8070000@candelatech.com>	<CAJ-Vmo=8pO0eVpL5L28AVALn+rpYPxhOw5kYkaGieBt-RzN3iQ@mail.gmail.com>	<53B8C4DF.5000308@candelatech.com>	<CAJ-Vmo=tjqCAns3N2_PY08r6A85Q9e8CoSWCV7g5KCQHRmqN-g@mail.gmail.com>
 <21432.58953.39322.640936@gargle.gargle.HOWL>
In-Reply-To: <21432.58953.39322.640936@gargle.gargle.HOWL>
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
To: Sujith Manoharan <sujith@msujith.org>, Adrian Chadd <adrian@freebsd.org>
Cc: ath10k <ath10k@lists.infradead.org>

On 07/05/2014 11:01 PM, Sujith Manoharan wrote:
> Adrian Chadd wrote:
>> Think about it in terms of "minimising how much the host is woken up."
>>
>> That's what the target market of the STA firmware for this chip is
>> thinking about.
>
> I don't think beacon filtering is enabled for ath10k, which means
> all beacons are sent to mac80211 anyway. HW/FW connection monitoring
> (in STA mode) is also not enabled in ath10k, so mac80211's beacon loss/miss
> infrastructure is already used, no ?

Maybe the driver should make this 0 instead of 2 then?

hw.h:#define TARGET_10X_BMISS_OFFLOAD_MAX_VDEV	2

That would save resources in the firmware.

Thanks,
Ben

>
> Sujith
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
