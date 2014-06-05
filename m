Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsVZf-00027Z-Ja
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 11:11:12 +0000
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
 <CANUX_P1iaTtFccraAF_p1dFZ3SJFpdNfF=i=eAVXP8yM3GrM4A@mail.gmail.com>
 <538F7381.4070100@candelatech.com>
Date: Thu, 5 Jun 2014 14:10:45 +0300
In-Reply-To: <538F7381.4070100@candelatech.com> (Ben Greear's message of "Wed, 
 4 Jun 2014 12:29:05 -0700")
Message-ID: <877g4vpq6i.fsf@kamboji.qca.qualcomm.com>
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

> On 06/04/2014 12:23 PM, Emmanuel Grumbach wrote:
>
>>> Do you have a link to your patch that defines the types you used?
>>>
>> 
>> Take a look at 1bd3cbc1a0e9ed977a6bd470c5bc7bd36fd87e26.
>> But I am adding more and more content to this file.
>
> Yeah, after implementing it in ath10k it seems there would
> be very little over-lap, so probably each driver should just
> do their own.
>
> We can keep the debugfs file names the same, and the udev
> event types the same, which should help user-space a bit.

In the future I would actually want to take this a step further and put
all that to cfg80211. That way the driver would only need to call
cfg80211_firmware_crashed(wiphy, dump) and cfg80211 will handle the
rest. This would make sure that all drivers use the exactly same user
space interfaces and hopefully also motivate other drivers to use it.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
