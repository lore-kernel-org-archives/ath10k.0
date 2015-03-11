Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVqAo-0003wT-1w
 for ath10k@lists.infradead.org; Wed, 11 Mar 2015 23:36:22 +0000
Message-ID: <5500D15F.7070009@candelatech.com>
Date: Wed, 11 Mar 2015 16:35:59 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k and 802.11s support?
References: <54FF2912.4030909@candelatech.com>
 <CAEFj9848iE7Sy5+g6Bvqe+EiExx=xgyxJ12ZeyyXWCAB8btFKA@mail.gmail.com>
In-Reply-To: <CAEFj9848iE7Sy5+g6Bvqe+EiExx=xgyxJ12ZeyyXWCAB8btFKA@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 03/11/2015 04:26 PM, Yeoh Chun-Yeow wrote:
> Hi, Ben
> 
> I have forwarded my email two years ago related to fw supporting 802.11s.

Thanks for the info.

I'll look into this a bit more when I finish some other pending work.

Thanks,
Ben


> 
> -----
> Chun-Yeow
> 
> ---------- Forwarded message ----------
> From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
> Date: Mon, Mar 3, 2014 at 10:21 AM
> Subject: Mesh Support in ath10k
> To: Kalle Valo <kvalo@qca.qualcomm.com>
> 
> 
> Hi, Kalle Valo
> 
> Currently, I am investigating the possibility of putting mesh or o11s
> support in ath10k by utilizing the adhoc mode available in ath10k.
> 
> I have compiled the following issues that need to address to enable
> the mesh support:
> 
> 1. Beacon Filtering
> Currenly, adhoc mode only allowed the beacon with the BSSID set by the
> ath10k_wmi_vdev_up to pass to mac80211. Continuous background scanning
> may not be good since we need to receive the beacon for
> synchronization purpose.  FYI, mesh uses the BSSID similar to its own
> vif mac addr.
> 
> 2. QoS Data Frame for broadcast data frame
> Currently, only non-QoS data allowed for broadcast frame as I observed.
> 
> 3. QoS Control Field, no stripped off
> We need to set the bit-8 of QoS control field to indicate the presence
> of mesh control field.
> 
> I believe that we need to have some changes on the Firmware to make this work.
> 
> Please kindly let me know is that possible to make arrangement of FW changes.
> 
> Thanks
> 
> Regards,
> Chun-Yeow
> 
> 
> On Tue, Mar 10, 2015 at 5:25 PM, Ben Greear <greearb@candelatech.com> wrote:
>> Anyone know what it would take to get ath10k to support
>> 802.11s?
>>
>> As you know, I'm not above modifying ath10k firmware, but
>> I also do not have a huge amount of time to put into this,
>> so if changes needed are extensive, then probably I cannot
>> do it now...
>>
>> Thanks,
>> Ben
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
