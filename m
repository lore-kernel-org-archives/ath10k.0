Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIiZJ-0000bM-6D
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 17:46:53 +0000
Message-ID: <530E2873.8000506@candelatech.com>
Date: Wed, 26 Feb 2014 09:46:27 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone have a working hostapd conf file for AC?
References: <530D128B.3030509@candelatech.com>
 <87sir5kc5t.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87sir5kc5t.fsf@kamboji.qca.qualcomm.com>
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

On 02/26/2014 09:37 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> I'm working on making a WLE900VX into an AP to do some
>> additional testing.  Not having the best of luck yet, but
>> maybe it's my config file....
>>
>> Does anyone have a working hostapd config file for
>> ath10k?
> 
> There's a simple configuration file in the wiki:
> 
> http://wireless.kernel.org/en/users/Drivers/ath10k/configuration#Configuring_hostapd
> 
> But we should also add a full configuration with all bells and whistles.

That would be nice.

Also, might be nice to document which channel & center frequency index
combinations are supposed to work...the first few I tried did not work,
but perhaps it was other issues.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
