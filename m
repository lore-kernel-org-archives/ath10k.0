Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X40eh-0007ai-Ut
 for ath10k@lists.infradead.org; Mon, 07 Jul 2014 04:35:57 +0000
Message-ID: <53BA2393.8020409@candelatech.com>
Date: Sun, 06 Jul 2014 21:35:31 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Question on beacon-miss handling.
References: <53B808BF.8070000@candelatech.com>	<CAJ-Vmo=8pO0eVpL5L28AVALn+rpYPxhOw5kYkaGieBt-RzN3iQ@mail.gmail.com>	<53B8C4DF.5000308@candelatech.com>	<CAJ-Vmo=tjqCAns3N2_PY08r6A85Q9e8CoSWCV7g5KCQHRmqN-g@mail.gmail.com>	<21432.58953.39322.640936@gargle.gargle.HOWL>	<53B90EB1.8020305@candelatech.com>
 <21434.5649.615843.633424@gargle.gargle.HOWL>
In-Reply-To: <21434.5649.615843.633424@gargle.gargle.HOWL>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: Adrian Chadd <adrian@freebsd.org>, ath10k <ath10k@lists.infradead.org>

On 07/06/2014 08:37 PM, Sujith Manoharan wrote:
> Ben Greear wrote:
>> Maybe the driver should make this 0 instead of 2 then?
>> hw.h:#define TARGET_10X_BMISS_OFFLOAD_MAX_VDEV	2
>> That would save resources in the firmware.
>
> Yes, it would. ath10k doesn't seem to be handling roam
> events too, so maybe that can be set to 0 - not sure if
> there are plans to properly enable and use roaming functionality
> that is already in the firmware.

I have set both to zero when using my firmware, and so far, everything
seems to be working fine.

I am tempted to just compile the roaming and beacon-miss code entirely
out of the firmware to save a bit of memory, but I guess that might
possibly break some driver, so if I do, I will have to add a new
firmware image variant...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
