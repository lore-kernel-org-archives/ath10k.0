Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuxEh-0003y9-AI
 for ath10k@lists.infradead.org; Thu, 12 Jun 2014 05:07:39 +0000
Message-ID: <53993583.2000607@candelatech.com>
Date: Wed, 11 Jun 2014 22:07:15 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: basic help request
References: <CFBEA45B.B25BF%pete@sablalik.us>
In-Reply-To: <CFBEA45B.B25BF%pete@sablalik.us>
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
To: Peter Sabat <pete@sablalik.us>
Cc: ath10k@lists.infradead.org



On 06/11/2014 09:58 PM, Peter Sabat wrote:
> So I grabbed it again - I just did a wget before, maybe something got
> garbled there.

It's using the new firmware, I don't think mod-info
is entirely correct.

Others have reported problems with upstream firmware and
bridging, but not sure if that is your problem or not.

You might try:  dmesg | grep "crash"
to see if firmware is crashing.

Or, remove the bridge logic from your hostapd config
file.

Or possibly, give my firmware a try:

http://www.candelatech.com/ath10k.php

I haven't done any testing with ath10k APs in
a bridge yet, so no idea how well or not it actually
works.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
