Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyFiI-0004EF-Ul
 for ath10k@lists.infradead.org; Wed, 22 Jul 2020 14:27:20 +0000
Received: from [192.168.254.5] (unknown [50.34.202.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 6420413C2B0
 for <ath10k@lists.infradead.org>; Wed, 22 Jul 2020 07:27:17 -0700 (PDT)
Subject: Re: duplicate authentications / excessive missing ACKs / deauth due
 to inactivity timer
References: <20200722161812.329d7a10@brot>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <cdba7890-62e4-4d99-bd0f-f1d458a4adc7@candelatech.com>
Date: Wed, 22 Jul 2020 07:27:16 -0700
MIME-Version: 1.0
In-Reply-To: <20200722161812.329d7a10@brot>
Content-Language: en-MW
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
To: ath10k@lists.infradead.org

On 7/22/20 7:18 AM, Leon M. George wrote:
> Hi :-)
> 
> I've encountered connection issues that appear to be strongly related to the
> problem in this thread [1] (found via the arch linux bug tracker [2]).

If this is ath10k-ct only problem, plz don't bother this list and send to just me
and/or add to ath10k-ct bugtracker on github.

If it does affect upstream ath10k too, then that would be valid for this mailing
list.

Thanks,
Ben

> 
> Symptoms:
> ap: "disconnected due to excessive missing ACKs"
> station: "No beacon heard and the time event is over already..."
> 
> Using a monitoring interface on the AP i was able to confirm that the beacon is
> indeed not being sent at any time.
> 
> I've found a configuration that reliably produces this state
> ("error state" from here on):
> If any number of mesh (or adhoc with ct) points are configured alongside any
> number of ordinary APs, this issue starts appearing.
> The mesh connections appear to be working correctly in the error state.
> 
> I tested various combinations of openwrt-19.xx and openwrt-trunk
> with ath10k/ath10k-ct - all were affected.
> Aligning with my vague memory, a user on the openwrt forum reports the issue isn't
> present in openwrt-18.xx [3].
> 
> About the ruling out client issues:
> My employer is operating installations with multiple hundreds of ath10k access
> points.
> We couldn't identify the source of the issue at first when we encountered it in
> our live setup and received unsolicited reports from basically every
> installation.
> As far as we can tell, no client is able to connect in the error state.
> We've had our users confirm the bug for
>    - Apple phones/tablets/macbooks
>    - Samsung phones, laptops
>    - computers with Intel/Realtek/AzureWave-hardware.
> 
> I hope this info is helpful.
> 
> kind regards,
> Leon George
> 
> [1] https://www.mail-archive.com/ath10k@lists.infradead.org/msg11599.html
> [2] https://bugs.archlinux.org/task/58457
> [3] https://forum.openwrt.org/t/wifi-connectivity-issues-with-ath10k/67779
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
