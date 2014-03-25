Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSTd4-0000FT-Nj
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 15:51:07 +0000
Message-ID: <5331A5D2.3030004@candelatech.com>
Date: Tue, 25 Mar 2014 08:50:42 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Scanning all 5Ghz channels with AC NIC.
References: <53307524.8070501@candelatech.com> <20140325144255.GA30784@w1.fi>
In-Reply-To: <20140325144255.GA30784@w1.fi>
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
To: "hostap@lists.shmoo.com" <hostap@lists.shmoo.com>, ath10k <ath10k@lists.infradead.org>

On 03/25/2014 07:42 AM, Jouni Malinen wrote:
> On Mon, Mar 24, 2014 at 11:10:44AM -0700, Ben Greear wrote:
>> I notice this issue while trying to scan specific channels with
>> an ath10k NIC.
>>
>> If I configure supplicant to use a specific freq list, it will fail:
>>
>> 1395683887.458813: nl80211: Scan frequency 5170 MHz
>> 1395683887.458823: nl80211: Scan frequency 5180 MHz
> ...
> 
> You need to be quite careful when using freq_list. wpa_supplicant will
> use exactly what is provided there and if cfg80211 does not like what it
> sees, it will reject this. Apparently duplicate entries would hit that
> and so would channels that the driver does not support.
> 
> In general, it is much easier to just do "wpa_cli scan freq=4900-6000"
> if you just want to scan all the enabled 5 GHz channels.


I use the freq_list to effectively disable 2.4Ghz, for instance when trying
to force a station to act like /a only instead of /a/b/g.

Maybe there is a better way?  (I don't often use wpa_cli directly,
so that won't help my case...)

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
