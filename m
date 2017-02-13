Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cdMC7-0000AA-Mu
 for ath10k@lists.infradead.org; Mon, 13 Feb 2017 19:21:55 +0000
Subject: Re: VHT 160Mhz and nss related config.
References: <0082a9e3-83f3-9bc3-af43-b890b91cfd93@candelatech.com>
 <1486969571.5142.3.camel@sipsolutions.net>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <d53a8fac-b4e0-2fb2-c1e1-c537a2c5e8aa@candelatech.com>
Date: Mon, 13 Feb 2017 11:21:29 -0800
MIME-Version: 1.0
In-Reply-To: <1486969571.5142.3.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 02/12/2017 11:06 PM, Johannes Berg wrote:
> On Fri, 2017-02-10 at 14:58 -0800, Ben Greear wrote:
>> So, it appears that the ath10k QCA9984 4x4 160Mhz chip can do 4x4
>> MIMO at VHT80, but
>> it can do only 2x2 MIMO at VHT160/80+80.
>>
>> When configuring a peer, we need to tell the firmware the number of
>> spatial streams
>> of the peer at VHT160 and at VHT80 and lower.  They are not the same
>> value.
>>
>> I cannot think of any standard way to get this information based on
>> VHT capabilities and such.  Currently, one could just assume VHT160
>> NSS is 1/2 of the VHT80 NSS, but that is unlikely to be true for all
>> vendors.
>
> This was recently added to the VHT capabilities in the spec, see Table
> 9-250 in 802.11-2016.
>
> johannes
>

I don't have that spec...maybe you could post a patch that adds that flag
and/or other fields to the appropriate header files?  I can attempt to
add support to ath10k after that...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
