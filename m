Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cdMW4-0002kM-Ef
 for ath10k@lists.infradead.org; Mon, 13 Feb 2017 19:42:30 +0000
Subject: Re: VHT 160Mhz and nss related config.
References: <0082a9e3-83f3-9bc3-af43-b890b91cfd93@candelatech.com>
 <1486969571.5142.3.camel@sipsolutions.net>
 <d53a8fac-b4e0-2fb2-c1e1-c537a2c5e8aa@candelatech.com>
 <1487014657.19813.3.camel@sipsolutions.net>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <0f30d7bf-b710-10a8-91e6-bfd75457cf75@candelatech.com>
Date: Mon, 13 Feb 2017 11:42:07 -0800
MIME-Version: 1.0
In-Reply-To: <1487014657.19813.3.camel@sipsolutions.net>
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

On 02/13/2017 11:37 AM, Johannes Berg wrote:
>
>>> This was recently added to the VHT capabilities in the spec, see
>>> Table 9-250 in 802.11-2016.
>
>> I don't have that spec...maybe you could post a patch that adds that
>> flag and/or other fields to the appropriate header files?  I can
>> attempt to add support to ath10k after that...
>
> We're planning to, but it's not the most important thing on my list
> right now ... I'll check where that's at now.
>
> I can't even easily explain it, since it's really complicated.

So, think it is worthwhile to use the max-rx-rate as a proxy
until the 'real' spec is implemented?  If 2x2 160Mhz is super complicated,
and yields no useful throughput improvement, then likely it will
be a long time before someone implements it properly I'd guess.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
